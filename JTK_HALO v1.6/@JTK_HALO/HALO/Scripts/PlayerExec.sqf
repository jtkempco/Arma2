//by Kempco
_unit 	= _this select 0;
_aircraft	= _this select 1;
_static 	= _this select 2;
_AttachPos 	= _this select 3;

if (!(isPlayer _unit) OR !(_unit in _aircraft) OR !(local _unit)) exitWith {};

_array 	= [_static] call JTK_HALO_GetVarsByStaticType;  
_animation 	= _array select 0;
_jump_dir 	= _array select 1;
_vehDrop 	= if (typeName(_aircraft getVariable "JTK_HALO_VehDrop") == "BOOL")then{false}else{true};
_isC130 	= _aircraft getVariable "is a C130";
_dropZoneMarker = _aircraft getVariable "JTK_HALO_DropZoneMarker";
_helper = "Sign_sphere10cm_EP1" createVehicle [0,0,0];

JTK_HALO_Player_ExitSpeed = [_aircraft,_vehDrop] call JTK_GetPlayerExitSpeed;
_unit setVariable ["JTK_HALO_Aircraft",[_static,_aircraft]];
_unit setVariable ["JTK_Ready_For_Decoy",false];

if ((!isMultiplayer) AND (teamSwitchEnabled)) then {enableTeamSwitch false};//Disable Team Switch during Jump

_unit spawn JTK_MonitorJumpStatus;
	
private ["_cam","_multiplr","_camarray","_dummy"];

if (viewDistance >= (position _static select 2)) then {
	JTK_Player_ViewDistance = viewDistance;//Save just in case
	[_unit,viewDistance,(position _static select 2)] spawn JTK_ForceViewDistance;
};

if (isMultiplayer) then {
	_dummy = [_unit,_static,_aircraft] call JTK_Spawn_Dummy; 
	WaitUntil {!isNil "_dummy"};
};

if (_isC130) then {
	_camarray = [_unit] call JTK_GetCargoDoorAnim;//Randomize Cammera transition 1
	_multiplr = _AttachPos call JTK_GetMultiplier;
	_cam = "camera" camCreate ((vehicle _unit) modelToWorld (_camarray select 0));
	_cam camSetFov (_camarray select 1);	 
	_cam camSetTarget (_camarray select 2);
	_cam cameraEffect ["internal", "BACK"];
}else{
	_cam = "camera" camCreate (_aircraft modelToWorld [0,3,-1.5]);
	_cam camSetFov 0.7;
	_cam camSetTarget (_aircraft modelToWorld [0,10,-1]);
	_cam cameraEffect ["internal", "BACK"];
};

//reset GPS to clear display just incase.
if (_unit hasWeapon "ItemGPS") then {_unit removeWeapon "ItemGPS";_unit spawn {sleep 5; _this addWeapon "ItemGPS"}};

//=================================Start Camera Script 1=======================================//
//This script is responsible for all cammera angles for the C130 that is boarded. (i.e. ground).
//=============================================================================================//
_ready = false;
_ready = [_unit,_static,_cam,5,_multiplr] call JTK_Camera_Transition_1;	
WaitUntil {_ready};

While {_unit in _aircraft} do {moveout _unit; sleep 0.01};
/*
This part here sets the player to random position so the cammerea can switched back to the player while 
the head identity is changed. Otherwise the unit will not show up until the player takes control again.
Really kills the effect of zooming to him in the aircraft with the Mask on. 
*/
_unit setPos [random 750,random 750,(3000 + random 10000)];
WaitUntil {_unit distance _static > 1000};

player switchCamera "Internal";//=======> Swith back to Player brifly to apply change (screen should be blacked out)
WaitUntil {cameraOn == _unit};
sleep 1.0;
_unit enableSimulation false;

if (JTK_CanChangeID) then {
	if (_aircraft getVariable "JTK_02_Required") then {
		if (local _unit) then {_unit setIdentity JTK_Oxygen_Mask_ID};
		if (isMultiplayer) then {JTK_Call_PVEH = [[_unit,JTK_Oxygen_Mask_ID], compile "(_this select 0) setIdentity (_this  select 1)"]; publicVariable "JTK_Call_PVEH"}; 
	}else{
		_ids = _unit getVariable "JTK_Identities"; 
		if (!isNil "_ids") then {	
			_unit setIdentity ((_unit getVariable "JTK_Identities") select 1);
			JTK_Call_PVEH = [[_unit,(_unit getVariable "JTK_Identities") select 1],compile "(_this  select 0) setIdentity (_this select 1)"]; 
			publicVariable "JTK_Call_PVEH";
		};
		
	};	
	if (!isMultiplayer) then {
		if !(_aircraft getVariable "JTK_02_Required") then {
			if (local _unit) then {_unit setIdentity ((_unit getVariable "JTK_Identities") select 1)};
		}; 
	};
};
sleep 1.0; 
//========================================================================================================		
//------------------------------------	SINGLE PLAYER ONLY	----------------------------------------				
//========================================================================================================		
if (!isMultiplayer) then {
	_AI_HALO_Units = _this select 4;
	player setVariable ["HALO Units",_this select 4];
	_unit setVariable ["JTK_HALO_AI_Count",count _AI_HALO_Units]; 
	_static setVariable ["JTK_Jump_Status","white"];//Define Locally For SP
	//Wait for AI units to teleport to Static So they cant be seen ejecting during cammera animation
	if (count _AI_HALO_Units > 0) then {
		//_aircraft setVariable ["HALO_Units",_AI_HALO_Units + [_unit]]; 	
		[_aircraft,_static,_AI_HALO_Units] spawn {
			_aircraft = _this select 0;
			_static = _this select 1;
			_AI_HALO_Units = _this select 2;		
			WaitUntil {fuel _aircraft == 0};
			sleep 1;
			[_aircraft,_static,_AI_HALO_Units] spawn JTK_AI_AttachToStatic;
		};
		//Monitor AI To See if they are at the static C130
		player setVariable ["JTK_HALO_AI_Status",[0,count _AI_HALO_Units]];
		While {true} do {
			_units_ready = (player getVariable "JTK_HALO_AI_Status") select 0;
			_total_units = (player getVariable "JTK_HALO_AI_Status") select 1;
			_AI_Units_Remaining = _total_units - _units_ready;		
			if (_debug) then {player globalChat format ["%1/%2",_units_ready,_total_units]};	
			if (_AI_Units_Remaining <= 2) exitWith {};
			sleep 0.1;
		}; 
	};
};
//========================================================================================================				 		
//========================================================================================================	
//========================================================================================================	

_cam switchCamera "Internal";
WaitUntil {cameraOn == _cam};

_unit attachTo [_static,[_AttachPos select 0,_AttachPos select 1,(_AttachPos select 2)-0.35]];
WaitUntil {(_unit distance _static < 15)};

if (!isNil "_dummy") then {
	[_unit,_static,_dummy,_cam,_isC130] spawn {
		_unit = _this select 0;
		_static = _this select 1;
		_dummy = _this select 2;
		_cam = _this select 3;
		_isC130 = _this select 4;
		
		_target = camtarget _cam; 
		_dly = if (_isC130) then {2}else{0.2};
		_cleanUp = if (_isC130) then {[driver _dummy,_dummy]}else{[driver _dummy,_dummy,(_dummy getVariable "anchor")]};
		WaitUntil {(camtarget _cam) != _target};
		sleep _dly;
		_dummy attachTo[_static,[0,0,0]];
		if !(_isC130) then {
			WaitUntil{_static getVariable "JTK_HALO_OpenDoors"};
			_dummy animate ["ramp_bottom",1];
			_dummy animate ["ramp_Top",1];
		};
		WaitUntil {(_unit getVariable "JTK_HALO_Status") == "FREEFALL"};
		sleep 5;
		{deleteVehicle _x} foreach _cleanUp;	
	};
};
			
_unit enableSimulation true;
WaitUntil{simulationEnabled _unit};
sleep 2;
_cam cameraEffect ["terminate","FRONT"];
_cam camCommit 0;
_unit switchCamera "Internal";

//=================================Start Camera Script 2=======================================//
//This script is responsible for all cammera angles for the Static C130 that is jumped from. (i.e. air).
//=============================================================================================//
_ready = false;
_ready = [_unit,_cam,_static,5,_multiplr] call JTK_Camera_Transition_2;
if (count _camarray > 3) then {deleteVehicle (_camarray select 2)}; 
WaitUntil {_ready};  
//----------------------------------------------------------------------------------------------//
//======================================CAMERAS DONE============================================//
//----------------------------------------------------------------------------------------------//

[_unit,_static,_helper] spawn {
	_unit 	= _this select 0;
	_static 	= _this select 1;
	_helper 	= _this select 2;
	_array 	= [_static] call JTK_HALO_GetVarsByStaticType; 
	_anim 	= _array select 0;
	_dir 		= _array select 1;
	_v 		= _array select 2;
	
	
	_unit enableSimulation false;
	WaitUntil{!(simulationEnabled _unit)};
	_helper hideObject true;
	if (isMultiplayer) then {
		JTK_Call_PVEH = [_helper,compile "_this hideObject true"]; 
		publicVariable "JTK_Call_PVEH"
	};
	
	[_helper,_unit,_anim] spawn {//simulate turbulance
		_x = 0; 
		_vUp = vectorup (_this select 0);
		while {!isNull (_this select 0)} do {
			sleep 0.01;
			if (animationState (_this select 1) == (_this select 2)) exitWith {};
			(_this select 0) setvectorup [(sin _x)/36,(sin _x)/36,1];  
			_x = _x + random 1;
		};
		(_this select 0) setVectorUp _vUp;
	};
	
	_helper setPos (_unit modelToWorld [0,0,0]);
	_helper setDir _dir;
	_unit attachTo [_helper,[0,0,0]];
	_helper setDir _dir;
	WaitUntil {animationState _unit == _anim};
	While {((_unit getVariable "JTK_HALO_Status") == "WAITING")} do {
		_helper setVelocity _v;
		sleep 0.01;
	};
};
["SHOW"] call JTK_CinemaBorder;//Cinema Border

if (isMultiplayer) then {
	_unit setVariable ["JTK_HALO_Player_Ready",true,true];//MP
}else{_static setVariable ["JTK_CountDown_Started",true]};//SP

	
_unit spawn {
	_handleKeyPress = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call JTK_HALO_KeyPressed"];
	_handleScrollWheel = (finddisplay 46) displayaddeventhandler ["mousezchanged","_this call JTK_HALO_ScrollWheel"];
	
	While {(alive _this) AND ((_this getVariable "JTK_HALO_Status") != "DONE") AND ((_this getVariable "JTK_HALO_Status") !=  "SWIMMING")} do {sleep 0.1};
	
	(findDisplay 46) displayRemoveEventHandler ["KeyDown",_handleKeyPress];
	(findDisplay 46) displayRemoveEventHandler ["mousezchanged",_handleScrollWheel];
	
	//Just in case
	JTK_HALO_GPS_Layer cutRsc ['default', 'Plain'];
	JTK_HALO_Mask_Layer cutRsc ['default', 'Plain'];
	JTK_HALO_GPS_Load_Layer cutRsc ['default', 'Plain'];
	JTK_HALO_Action_Layer cutRsc ['default', 'Plain'];
};

if (isNil "JTK_HALO_Mask_Resource_Defined") then {[_unit,(_aircraft getVariable "JTK_02_Required")] call JTK_BailOut_Mask};//So it works okay
sleep 1.25;
//Mask Overlay
if ((JTK_CanChangeID) AND (_aircraft getVariable "JTK_02_Required")) then {[_unit] call JTK_BailOut_Mask};
if !(JTK_HALO_Disable_Jump_Computer) then {
	[_unit,_static] call JTK_GPS_LoadScreen;
	[_unit,_static,_aircraft] call JTK_Open_GPS;
};

//========================================================================================================		
//------------------------------------	SINGLE PLAYER ONLY	----------------------------------------				
//========================================================================================================	
if !(isMultiplayer) then {
	_AI_HALO_Units = _this select 4;
	
	_RP = if (surfaceIsWater (getmarkerPos(_aircraft getVariable "JTK_HALO_DropZoneMarker"))) then {
		[(getmarkerPos(_aircraft getVariable "JTK_HALO_DropZoneMarker")),_static] call JTK_AI_GetWaterInsertOffset
	}else{(getmarkerPos(_aircraft getVariable "JTK_HALO_DropZoneMarker"))};
	JTK_SP_AVG_SPEED = (([_static,_RP] call BIS_fnc_distance2D)-150)/([(position _static select 2)] call  JTK_Kinematics_GetTime);
	JTK_SP_EXIT_SPEED = (JTK_HALO_Player_ExitSpeed*4);
	
	
	if ((!isMultiplayer) AND (count _AI_HALO_Units > 0))  then {[count _AI_HALO_Units] spawn JTK_AI_RestoreSwitch};//Restore  Teamswitch
	
	_static spawn {
		waitUntil {!isNil "JTK_HALO_JumpStatus_dly_WHITE"};
		sleep JTK_HALO_JumpStatus_dly_WHITE;_this setVariable ["JTK_Jump_Status","red"];
		sleep JTK_HALO_JumpStatus_dly_RED;_this setVariable ["JTK_Jump_Status","green"];
		JTK_HALO_JumpStatus_dly_WHITE = nil;
	};

	//Wait till Status Red
	WaitUntil {((_static getVariable "JTK_Jump_Status") == "red")};
	_unit spawn {sleep 5;_this setVariable ["HALO_GPS_Mode","COORDS"]};

	//Wait till Status Green
	WaitUntil {((_static getVariable "JTK_Jump_Status") == "green")};

	//Define all units including player
	_HALO_Units = _AI_HALO_Units + [_unit];

	if (_static animationPhase "ramp_top" != 1) then {
		_static animate ["ramp_bottom",1];
		_static animate ["ramp_Top",1];
		sleep 3;
	};
	//Check if Vehicle Is Being Dropped
	if (_vehDrop) then {[_static,side _unit,_aircraft] spawn JTK_HALO_Release_Veh; sleep 10};
	
	if (count _AI_HALO_Units > 0) then {
		//Define Point AI Jumper if Required
		JTK_AI_PointJmpr = _AI_HALO_Units select 0;
		
		_array_1 = [_RP,0.85,count _AI_HALO_Units] call JTK_AI_GetDestinations;
		_array_2 = [_RP,15,count _AI_HALO_Units] call JTK_AI_GetDestinations;
		for "_i" from 0 to (count _array_1 - 1) do {
			(_AI_HALO_Units select _i) setVariable ["JTK_HALO_AI_RP_Vars",[(_array_1 select _i),(_array_2 select _i)]];
		};
		_array_1 = [_AI_HALO_Units,"STAGGERED"] call JTK_Get_AI_Formation_Offsets;
		_array_2 = [_AI_HALO_Units,"DOUBLE COLUMN"] call JTK_Get_AI_Formation_Offsets;
		if (typeName _array_1 == "ARRAY") then {
			for "_i" from 0 to (count _array_1 - 1) do {
				(_AI_HALO_Units select (_i + 1)) setVariable ["JTK_AI_Formation",[(_array_1 select _i),(_array_2  select _i)]];
			};
		};
		sleep 1.5;
		if (side _unit == west) then {_unit say3d "JTK_Move"};
		sleep 0.25;
		for "_i" from 0 to (count _HALO_Units - 1) do {
			_HALO_unit = _HALO_Units select _i;
			if (isPlayer _HALO_unit) then {
				_HALO_unit enableSimulation true; 
				WaitUntil{simulationEnabled _HALO_unit}; 
				sleep 0.5;
			}else{sleep 0.1};
			
			for "_i" from 1 to 3 do {_HALO_unit playmove _animation};
			if (!isPlayer _HALO_unit) then {
				[_HALO_unit,_i,_static,(count(_HALO_Units) - 1),_RP] spawn {
					_unit = _this select 0;
					_index = _this select 1;
					_static = _this select 2;
					_unit_count = _this select 3;
					_RP = _this select 4;
					
					if ((typeof _static) == "C130J_static_EP1") then {
						WaitUntil{((([_unit,(_static modelToWorld [0,5.4,-3.5])] call BIS_fnc_distance2D) <= 1.5) AND (_unit distance _static > 7.5)) OR (getposASL _unit select 2 < getposASL _static select 2)};
					}else{
						WaitUntil {(_unit distance (_static modelToWorld [0,-4,-2]) < 1.0) OR (getposASL _unit select 2 < getposASL _static select  2)};
					};
					detach _unit;
					[_unit,_index,_RP,JTK_AI_PointJmpr,_static] execFSM (JTK_HALO_Path+"fsms\AI.fsm");
				};
			};
		};
	}else{
		_unit enableSimulation true; 
		WaitUntil{simulationEnabled _unit}; 
		sleep 3;
		for "_i" from 1 to 3 do {_unit playmove _animation};
	};
};

_vObj = if (isMultiplayer AND JTK_ACE_Detected) then {_helper}else{_unit};

//========================================================================================================				 		
//========================================================================================================	
//========================================================================================================	
if (_aircraft getVariable "is a C130") then {
	WaitUntil{((([_unit,(_static modelToWorld [0,5.4,-3.5])] call BIS_fnc_distance2D) <= 1.5) AND (_unit distance _static  > 7.5))};
}else{
	_vehToHide = if (isMultiplayer)then{_dummy}else{_static};
	WaitUntil {(_unit distance (_static modelToWorld [0,-4,-2]) < 1.0)};
	_vehToHide hideobject true;	
};
if (_vObj == _unit) then {deleteVehicle _helper};

_unit switchmove "HaloFreeFall_non"; 
JTK_Call_PVEH = [_unit,(compile "_this switchmove 'HaloFreeFall_non'")]; 
publicVariable "JTK_Call_PVEH"; 
_vObj setVelocity ([_static,JTK_HALO_Player_ExitSpeed] call JTK_GetExitSpeed);

if (isMultiplayer) then {
	if (JTK_ACE_Detected)then {
		playSound "JTK_SkyDiveWind";
		[_unit,_helper] spawn {
			sleep 0.25;
			_v = velocity (_this select 1); 
			deleteVehicle (_this select 1);
			(_this select 0) setVelocity _v; 
			(_this select 0) execVM "x\ace\addons\sys_eject\jumpout_cord.sqf";
		};
	}else{
		_unit setVariable ["JTK_HALO_Chute_Status","Primary"];
		[_unit] call JTK_HALO_Freefall;
	};
}else{
	_unit setVariable ["JTK_HALO_Chute_Status","Primary"];
	[_unit] call JTK_HALO_Freefall;
};
_unit allowDammage true;
["HIDE"] call JTK_CinemaBorder;
_unit switchCamera (_unit getVariable "last cammera view");

//Check for NVGs then add back if applicable
if ("NVGoggles" in ((_unit getVariable "JTK_Save_Gear") select 1)) then {_unit addweapon "NVGoggles"};
if (_unit hasWeapon "NVGoggles") then {_unit spawn JTK_HALO_Monitor_NVGs}; 

