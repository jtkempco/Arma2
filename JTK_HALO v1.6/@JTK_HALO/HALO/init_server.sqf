//by Kempco

#include "scripts\Common_Arrays.sqf"
#include "scripts\Common_Text.sqf"

JTK_HALO_Aircraft = [];
_types = ["C130J_US_EP1","C130J","MV22"];
_static = ["C130J_static_EP1","C130J_static_EP1","MV22"];
_sounds = ["JTK_C130_doors","JTK_C130_doors","JTK_MV22_doors"];
_alt_limits = [[JTK_HALO_min_alt_C130,JTK_HALO_max_alt_C130],[JTK_HALO_min_alt_C130,JTK_HALO_max_alt_C130],[JTK_HALO_min_alt_MV22,JTK_HALO_max_alt_MV22]];
_speed_limits = [[JTK_HALO_air_speed_C130,(JTK_HALO_air_speed_C130/2)],[JTK_HALO_air_speed_C130,(JTK_HALO_air_speed_C130/2)],[JTK_HALO_air_speed_MV22,(JTK_HALO_air_speed_MV22/2)]];
_boarding_offsets = [[[0,-8,-3.15],[-2.75,10,-3.15]],[[0,-8,-3.15],[-2.75,10,-3.15]],[[1.65,3.65,-1.0],[0,-7,-1.65]]];
_air = nearestObjects [[0,0,0],["Air"],20000];

if (count _air > 0) then {
	_aircraft_west = [];
	_aircraft_east = [];
	for "_i" from 0 to (count _air - 1) do {
		if (typeOf (_air select _i) in _types) then {
			if ((_air select _i) getVariable "jtk_halo_aircraft") then {
				
				_side = if ((format["%1",((_air select _i) getVariable "jtk_halo_aircraft_side")] == "<null>") OR (format["%1",((_air select _i) getVariable "jtk_halo_aircraft_side")] == "west")) then {west}else{east};
				_isC130 = if ((_static select (_types find (typeof(_air select _i)))) == "C130J_static_EP1") then {true}else{false};
				
				_attachArays = switch (typeof(_air select _i)) do {
					case "C130J_US_EP1":{if (isMultiplayer) then {JTK_AttachToArrays_C130}else{JTK_AttachToArrays_C130_AI}};
					case "C130J":{if (isMultiplayer) then {JTK_AttachToArrays_C130}else{JTK_AttachToArrays_C130_AI}};
					case "MV22":{if (isMultiplayer) then {JTK_AttachToArrays_MV22}else{JTK_AttachToArrays_MV22_AI}};
				};
				
				_dist2mrker = switch (typeof(_air select _i)) do {
					case "C130J_US_EP1":{if (isMultiplayer) then {400}else{400}};
					case "C130J":{if (isMultiplayer) then {400}else{400}};
					case "MV22":{if (isMultiplayer) then {300}else{300}};
				};
				
				(_air select _i) setVariable ["side",_side,true];
				(_air select _i) setVariable ["is a C130",_isC130,true];
				(_air select _i) setVariable ["door sound",(_sounds select(_types find (typeof(_air select _i))))];
				(_air select _i) setVariable ["attach arrays",_attachArays];					
				(_air select _i) setVariable ["altitude limits",(_alt_limits select(_types find (typeof(_air select _i)))),true];
				(_air select _i) setVariable ["speeds",(_speed_limits select(_types find (typeof(_air select _i)))),true];
				(_air select _i) setVariable ["Dist2MarkBuffer",_dist2mrker,true];
				(_air select _i) setVariable ["static type",(_static select (_types find (typeof(_air select _i))))];
				(_air select _i) setVariable ["boarding offsets",(_boarding_offsets select (_types find (typeof(_air select _i))))];
			
			
				if (_side == west)then{_aircraft_west = _aircraft_west + [(_air select _i)]};
				if (_side == east)then{_aircraft_east = _aircraft_east + [(_air select _i)]};
			};
		};
	};
	JTK_HALO_Aircraft = JTK_HALO_Aircraft + [_aircraft_west];
	JTK_HALO_Aircraft = JTK_HALO_Aircraft + [_aircraft_east];
	JTK_HALO_Terminate = if (count JTK_HALO_Aircraft > 0)then{false}else{true};
	JTK_HALO_Cooldown = if (JTK_HALO_Cooldown <= 60) then {60}else{JTK_HALO_Cooldown};
	publicVariable "JTK_HALO_Aircraft";
	publicVariable "JTK_HALO_Terminate";
	
	if (count JTK_HALO_Aircraft == 0) exitWith {sleep 5; call JTK_HALO_Error_C130_UnDefined};//Terminate if no aircraft are detected
	
	//Dummy aircraft are spawned as civs so markers don't show. Make sure center is present.
 	_civs = [];   
 	{if (side _x == civilian) then {_civs = _civs + [_x]}} foreach allunits;   
 	JTK_HALO_CreateCivCenter = if (count _civs == 0) then {true}else{false};
	publicVariable "JTK_HALO_CreateCivCenter";
	 
	#include "CompileFunctions.sqf"
	
	for "_i" from 0 to (count JTK_HALO_Aircraft - 1) do {
		for "_j" from 0 to (count (JTK_HALO_Aircraft select _i) - 1) do {
			[((JTK_HALO_Aircraft select _i) select _j)] spawn {
				_aircraft = _this select 0;
				_side = _aircraft getVariable "side";
				_type = _aircraft getVariable "static type";
				_isC130 = _aircraft getVariable "is a C130";
				
				private ["_static_name","_aircraft_name"];

				if (isnil "JTK_HALO_ID") then {JTK_HALO_ID = -1};
				JTK_HALO_ID = JTK_HALO_ID + 1;
				
				_static = if (_isC130) then {
					_type createVehicle [0,0,10000]
				}else{
					if (isMultiplayer) then {
						_type createVehicle [0,0,10000];	
					}else{
						([[0,0,10000],0,_type,_side] call bis_fnc_spawnvehicle) select 0;
					};
				};
				WaitUntil {!isNil "_static"};
				call compile format ["JTK_HALO_Static_%1 = _static;_static setvehiclevarname 'JTK_HALO_Static_%1';_static_name = 'JTK_HALO_Static_%1';publicvariable 'JTK_HALO_Static_%1'",JTK_HALO_ID];

				if !(_isC130) then {
					_anchor = "C130J_static_EP1" createVehicle [0,0,0];
					WaitUntil {!isNil "_anchor"};
					_anchor hideObject true;
					if (isMultiplayer) then {_static hideObject true}else{{_static animate [_x,1]} foreach JTK_MV22_Animations};
					JTK_Call_PVEH = [[_anchor,_static],compile "{_x hideObject true} foreach _this"]; 
					publicVariable "JTK_Call_PVEH"; 
					
					_static attachto [_anchor,[0,0,5000 + (random 5000)]];
					_dir = direction _static;
					_static setDir (_dir - 180);
					_static setVariable ["anchor",_anchor,true];
					_static lockDriver true;
					for "_i" from 0 to 25 do {_static lockCargo [_i, true]}; 
										 
				};
				[_aircraft,_static] spawn {sleep 5; _this execFSM (JTK_HALO_Path+"fsms\Server.fsm")};
				if (JTK_HALO_ByPass) then {execVM (JTK_HALO_Path+"JTK_ByPassSetUp.sqf")};
			};
		};
		sleep 2;
				
		onPlayerDisconnected "
			if (!JTK_HALO_ByPass) then {
				_aircraft = player getVariable 'JTK_HALO_Command_Unit'; 
				if (!isNil '_aircraft') then {
					player setVariable ['JTK_HALO_Command_Unit',nil,true];
					_aircraft setVariable ['JTK_HALO_Command_Unit',nil,true];
				};
			};
		";
	};
};
						
if (!isDedicated) then {execVM "JTK\HALO\init_client.sqf"};





