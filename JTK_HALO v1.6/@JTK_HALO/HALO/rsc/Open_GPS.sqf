//by Kempco


_this spawn {
	disableSerialization;
	playsound "JTK_GPS_On";
	_unit = _this select 0;
	_static = _this select 1;
	_aircraft = _this select 2;
	
	_kph_sim = (_aircraft getVariable "speeds") select 0;
	
	JTK_HALO_GPS_Layer cutRsc ['JTK_HALO_GPS_RSC', 'Plain'];
	_display = uiNamespace getVariable "JTK_HALO_GPS";
	WaitUntil {!isNil "_display"};
	
	_Alt_Error_Offset = (JTK_GPS_Altitude_Error_Margin*(getPos _static select 2));
	_decoy_marker = _aircraft getVariable "JTK_HALO_DecoyMarker";
	
	 
	_map_cntrl 	= _display displayCtrl 14;
	_dir_cntrl	= _display displayCtrl 7;
	_speed_cntrl= _display displayCtrl 8;
	_alt_cntrl	= _display displayCtrl 9;
	_alt_hdr_cntrl = _display displayCtrl 13;
	
	_unit setVariable ["HALO_GPS_Status","ON"];
	_unit setVariable ["HALO_GPS_Mode","MAP"];
	
	private ["_GPS_Marker","_offset"];

	_gray_BG = [0.05,0.05,0.05,0.7];
	_gray_txt = [0.075,0.075,0.075,1];
	_olive = [0.408333,0.447222,0.316667,1];		
	_delay = 1;
	_C130_Zoom_level = 1;
	
	
	if ((format ["%1",(_unit getVariable "JTK_GPS_Map_Sizes")]) == "<null>") then {
		_map_new = [];
		for "_i" from 0 to 3 do {
			if (_i != 3) then {_map_new = _map_new + [(ctrlPosition _map_cntrl) select _i];
			}else{_map_new = _map_new + [(ctrlPosition _map_cntrl select 3) - (ctrlPosition (_display displayCtrl 5) select 3)]};
		};
		_map_initial = ctrlposition _map_cntrl;
		player setVariable ["JTK_GPS_Map_Sizes",[_map_initial,_map_new]];
	};
	
	//Monitor Addaction
	_unit spawn JTK_HALO_GPS_Monitor_Addaction;


	if !(cadetMode) then {
		_GPS_Marker = player call JTK_GPS_Player_Marker;
		player setVariable ["JTK_HALO_GPS_PlayerMarker",_GPS_Marker];
		_GPS_Marker spawn {
			if (JTK_ACE_Detected)then{
				While {((player getVariable "HALO_GPS_Status") == "ON")} do {
					_this setMarkerDirLocal getDir (vehicle player);
					_this setMarkerPoslocal getpos (vehicle player);
					if (((player getVariable "JTK_HALO_Status") == "DONE") OR ((player getVariable "JTK_HALO_Status") == "SWIMMING"))exitWith {deletemarkerLocal _this};
					sleep 0.25;
				};
			}else{
				While {((player getVariable "HALO_GPS_Status") == "ON")} do {
					_this setMarkerDirLocal getDir player;
					_this setMarkerPoslocal getpos  player;
					if (player != vehicle player) then {_this setMarkerTypeLocal "Empty"};
					if ((player == vehicle player) AND (getMarkerType _this == "Empty") AND ((player getVariable "JTK_HALO_Status") == "FREEFALL")) then {_this setMarkerTypeLocal "mil_triangle"};
					if (((player getVariable "JTK_HALO_Status") == "DONE") OR ((player getVariable "JTK_HALO_Status") == "SWIMMING"))exitWith {deletemarkerLocal _this};
					sleep 0.25;
				};
			};
			deleteMarker _this;
		};
	};
			
	scopeName "main";	
	While {(alive _unit) AND ((_unit getVariable "HALO_GPS_Status") == "ON")} do {
		scopeName "GPS_Mode_Loop";
		if (((_unit getVariable "JTK_HALO_Status") == "DONE") OR ((_unit getVariable "JTK_HALO_Status") == "SWIMMING")) exitWith {_unit setVariable ["HALO_GPS_Status","OFF"]};//Exit if Done
//Map Mode		
		if ((_unit getVariable "HALO_GPS_Mode") == "MAP") then {
			[_display,"MAP"] spawn JTK_GPS_AnimateModeBttn;
			if !(cadetMode) then {_GPS_Marker setMarkerTypeLocal "mil_triangle"};
			While {((_unit getVariable "HALO_GPS_Mode") == "MAP") AND ((_unit getVariable "HALO_GPS_Status") == "ON")} do {
				if ((_unit getVariable "JTK_HALO_Status") == "WAITING") then {
					_GPS_Marker setMarkerTypeLocal "Empty";
					JTK_GPS_Zoom = 0.5;
					if ((_static getVariable "JTK_Jump_Status") != "white") then {
						_unit setVariable ["HALO_GPS_Mode","COORDS"];
					};
					
					if (typeName (_aircraft getVariable "JTK_Distance_Out") != "STRING") then {
						if ((_aircraft getVariable "JTK_Distance_Out") <= 750) then {_unit setVariable ["HALO_GPS_Mode","COORDS"]};
					};
					
					_offset = [getMarkerPos _decoy_marker,_kph_sim,(direction _unit)-180] call BIS_fnc_relPos;
				}else{
					JTK_GPS_Zoom = [_unit] call JTK_GetHALOMapZoom;
					_offset = [_unit] call JTK_HALO_GetMapOffset;
					if !(cadetMode) then {
						if (JTK_ACE_Detected)then {
							_GPS_Marker setMarkerTypeLocal "mil_triangle"
						}else{
							if (_unit == vehicle _unit) then {_GPS_Marker setMarkerTypeLocal "mil_triangle"};
						};
					};
				};
				_map_cntrl ctrlMapAnimAdd [0.2,JTK_GPS_Zoom,_offset];
				ctrlMapAnimCommit _map_cntrl;
				_t = time + (_delay/2); 
				While {(_t > time) AND !(ctrlMapAnimDone _map_cntrl)} do { 
					if ((_unit getVariable "HALO_GPS_Mode") == "COORDS") then {breakto "GPS_Mode_Loop"};
					if ((_unit getVariable "HALO_GPS_Status") == "OFF") then {breakto "main"};
					sleep 0.01;
				};  
			};
		};
//COORDS Mode
		if ((_unit getVariable "HALO_GPS_Mode") == "COORDS") then {
			if (isNil "_ByBassAnim") then {
				[_display,"COORDS"] spawn JTK_GPS_AnimateModeBttn;
				_GPS_Marker setMarkerTypeLocal "empty";
			}else{_ByBassAnim = nil};
			
			While {((_unit getVariable "HALO_GPS_Mode") == "COORDS") AND ((_unit getVariable "HALO_GPS_Status") == "ON")} do {
				private ["_speed","_alt","_var","_alt_type"];
				
				
				if ((_unit distance _static) <= 15) then {
					_var = if(random 1 < 0.5) then{1} else {-1};
					_multiplr = (round(random 2))*_var;
					_speed = _kph_sim + (_multiplr*5);

					_var = if(random 1 < 0.5) then{1} else {-1};
					if (surfaceIsWater [(position _unit select 0),(position _unit select 1)]) then {
						_alt = (getPosASL _unit select 2);
					}else{_alt = (getPosATL _unit select 2)};
					_alt = (round((_alt+_Alt_Error_Offset)/10))*10;	
					_var = if(random 1 < 0.5) then{1} else {-1};
					_multiplr = (round(random 2))*_var;
					_alt = _alt + (_multiplr*10);
				}else{
					_speed = if ((speed vehicle _unit) > 225) then {225}else{(floor((speed vehicle _unit)/5))*5};
					if (surfaceIsWater [(position _unit select 0),(position _unit select 1)]) then {
						_alt = (getPosASL _unit select 2);
					}else{_alt = (getPosATL _unit select 2)};
					_alt = (round((_alt+_Alt_Error_Offset)/10))*10;		
				};
				if (surfaceIsWater [(position _unit select 0), (position _unit select 1)]) then {
					_alt_type = "ALTITUDE : (ASL)";
				}else{_alt_type = "ALTITUDE : (ATL)"};
				
				_dir = floor(direction (vehicle _unit));
				_dir_cntrl ctrlSetText format ["%1",_dir];
				_speed_cntrl ctrlSetText format ["%1 kph",_speed];
				_alt_cntrl  ctrlSetText format ["%1 m",_alt];
				_alt_hdr_cntrl ctrlSetText _alt_type; 
				
				_t = time + (_delay*2);
			
				While {_t > time + _delay} do {
					if ((_unit getVariable "HALO_GPS_Mode") == "MAP") then {breakto "GPS_Mode_Loop"};
					if ((_unit getVariable "HALO_GPS_Status") == "OFF") then {breakto "main"};
					sleep 0.05;
				};
			};
		};
		sleep 0.01;
	};
};












