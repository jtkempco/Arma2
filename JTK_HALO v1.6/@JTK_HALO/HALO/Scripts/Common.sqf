/* 
by Kempco 

Includes following common code snippets:
	2.  JTK_HALO_Freefall_PPE
	3.  JTK_Static_Reset_Doors
	4.  JTK_Create_C130_Light
	5.  JTK_Create_Jumplight
	6.  JTK_HALO_MP_Sync
	7.  JTK_GetSpeed
	8.  JTK_HALO_DetachPulloutChute
	9.  JTK_AI_GetDestinations
	10. JTK_Get_AI_Formation_Offsets
	12. JTK_AI_VerifySquadSize
	13. JTK_AI_GetWaterInsertOffset
	14. JTK_AI_GetAnim
	15. JTK_Egress_Decoy_Doors
	16. JTK_SP_MonitorExitSpeed
	17. JTK_HALO_Monitor_NVGs
	18. /////JTK_HALO_ResetStatic////
	19. JTK_HALO_GetVarsByStaticType
*/

JTK_HALO_Freefall_PPE = {
	_Dynamic = ppeffectcreate ["DynamicBlur",464];
	_Dynamic ppEffectEnable true;
	_Dynamic ppEffectAdjust [5.0];
	_Dynamic ppEffectCommit 0;
	_Dynamic ppEffectAdjust [0.0];
	_Dynamic ppEffectCommit 2;
	_Dynamic ppEffectEnable true;
	_Dynamic

};

JTK_Static_Reset_Doors = {
	_static = _this select 0;
	_state = _this select 1;
	
	_static animate ["ramp_bottom",_state]; 
	_static animate ["ramp_Top",_state];
};

JTK_Static_Lights = {
	_unit = _this select 0;
	_static = _this select 1;
	
	_JumpLight_Array = [];
	_color = [102/255, 204/255, 255/255];
	
	_Light_Points = if (typeof _static == "C130J_static_EP1") then {
		[[0,6,-1.5],[0,-6,-1.5]];
	}else{[[0,0,-0.6],[0,-3,-0.6],[0,3,-0.6]]};
		
	for "_i" from 0 to (count _Light_Points - 1)  do {
		_array = [_static,_color,(_Light_Points select _i)] call JTK_Create_Jumplight;
		_JumpLight_Array = _JumpLight_Array + [_array];
	};
	_JumpLight_Array
};

//Light For Static Plane
JTK_HALO_Boarding_Aircraft_Lights = {
	_aircraft = _this select 0;
	_isC130 = _aircraft getVariable "is a C130";
	_lights = [];
	_Light_Points = if (_isC130) then {
		[[0,12,-1.75],[0,6,-1.5],[0,-6,-1.5]];
	}else{[[-0.5,5.1,-0.6],[0,-3,-0.6],[0,0,-0.6],[0,3,-0.6]]};
	for "_i" from 0 to (count _Light_Points - 1)  do {
		_light = "#lightpoint" createVehicle getpos _aircraft;    
		_light setLightAmbient [0,0,0];      
		_light setLightColor [102/255, 204/255, 255/255];
		if (_isC130) then {
			_light setLightBrightness 0.04;
		}else{if (_i == (count _Light_Points - 1)) then {_light setLightBrightness 0.04}else{_light setLightBrightness 0.02}}; 
		_light attachTo [_aircraft,(_Light_Points select _i)];
		_lights = _lights + [_light];
	};
	//_aircraft setVariable ["JTK_HALO_Boarding_Aircraft_Lights",_lights,true];
};


JTK_Create_Jumplight = {
	private ["_br"];
	_static = _this select 0;
	_color = _this select 1;
	_pos = _this select 2;
	
	
	_zpos = getpos _static select 2;
	_buffer = _zpos/2500;
	_br = _buffer*25;

	_L = "#lightpoint" createVehiclelocal [0,0,0];    
	_L setLightAmbient [0,0,0];      
	_L setLightColor _color;
	_L setLightBrightness _br; 
	_L attachTo [_static,_pos];

	[_L,_br]
}; 

JTK_HALO_MP_Sync = {
	_static = _this select 0;
	_HALO_units = _this select 1;

	_startCountDown = false;
	_t_max = time + 60;	
	_static setVariable ["JTK_Player_Status",[0,_HALO_units],true];
		
	While {(!_startCountDown) AND (_t_max > time)} do {
		_HALO_Player_Units = [];
		{if (isPlayer _x) then {_HALO_Player_Units = _HALO_Player_Units + [_x]}} foreach  _HALO_units; 
		if (count _HALO_Player_Units > 0) then {
			_HALO_Players_Ready = [];
			{if (_x getVariable "JTK_HALO_Player_Ready") then {_HALO_Players_Ready =  _HALO_Players_Ready + [_x]}} foreach _HALO_Player_Units;
			_static setVariable ["JTK_Player_Status", [_HALO_Players_Ready,_HALO_Player_Units],true];
			if ((count _HALO_Player_Units) == (count _HALO_Players_Ready)) then  {_startCountDown = true};
		};
		sleep 1;
	};
	JTK_HALO_MP_Sync_Complete = true;
};


JTK_GetSpeed = {
	_speed = abs(speed _this);
	_speed = _speed/3.6;
	_speed
};

JTK_HALO_DetachPulloutChute = {
	sleep 1.5; 
	detach _this; 
	_t = time + 3;
	While {_t > time} do {
		_this setVelocity [-15,12,35];
		sleep 0.01;
	};
	deleteVehicle _this;
};


JTK_AI_GetDestinations = {
	_center = _this select 0;
	_buffer = _this select 1;
	_AI_Unit_Count = _this select 2;
	
	_radius = if (_this select 1 > 25) then {_this select 1}else{_buffer*_AI_Unit_Count};
	_IsWaterInsert = if (surfaceIsWater _center) then {true}else{false};
	
	_step = 360/_AI_Unit_Count; 
	_DestArray = [];

	for "_i" from 0 to _AI_Unit_Count do {
		_dir = _step * _i;
		_x = (_center select 0)+(sin(_dir)*_radius);
		_y = (_center select 1)+(cos(_dir)*_radius);
		if !(_IsWaterInsert) then {
			if !(surfaceIsWater [_x,_y]) then{_DestArray = _DestArray + [[_x,_y,0]]};
		}else{_DestArray = _DestArray + [[_x,_y,0]]};
	};
	_DestArray
};

JTK_Get_AI_Formation_Offsets = {
	_units = _this select 0;
	_type = toUpper(_this select 1);
	_index = (count _units) - 2;
	
	if (_index < 0) exitWith {false};
	
	private ["_form_array"];
	
	switch (_type) do {
		case "STAGGERED":{_form_array = JTK_HALO_AI_Form_Staggered};
		case "V":{_form_array = JTK_HALO_AI_Form_V};
		case "DOUBLE COLUMN":{_form_array = JTK_HALO_AI_Form_DoubleColumn};
		default {player globalChat "ERROR: FORMATION TYPE BOT FOUND"};
	}; 
	_array = _form_array select _index;
	_array
};

JTK_AI_VerifySquadSize = {
	_var = player getVariable "JTK_HALO_Reduce_Squad_Size";
	if ((typeName _var) == "ARRAY") then {
		_limit = _var select 1;
		_units = units group player;
		_units_deleted = 0;
		for "_i" from 0 to (count _units - 1) do {
			if (_i > (_limit - 1)) then {
				[(_units select _i)] join GrpNull; 
				deleteVehicle (_units select _i);
				_units_deleted = _units_deleted + 1;
			}; 
		};
		player setVariable ["JTK_HALO_Reduce_Squad_Size",false];
		hintSilent format["%1 unit(s) deleted.",_units_deleted];
		[] spawn {sleep 7; hintSilent ""};
	};
};

JTK_AI_GetWaterInsertOffset = {	
	_RP = _this select 0;
	_static = _this select 1;
	
	_dummy = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
	WaitUntil {!isNull _dummy};
	_dummy setDir (getDir _static);
	_dummy setPos _RP; 
	WaitUntil {_dummy distance _RP <= 50};
	_pos = _dummy modelToWorld [0,7,0];
	deleteVehicle _dummy;
	_pos
}; 


JTK_AI_GetAnim = {
	_dist 	= _this select 0;
	_form	= _this select 1;
	
	if ((_dist > 2) AND (_form == "STAG")) exitWith {"HaloFreeFall_F"};
	if ((_dist > 2) AND (_form == "DC")) exitWith {"HaloFreeFall_B"};
	if (true) exitwith {"HaloFreeFall_non"};
};

JTK_Egress_Decoy_Doors = {
	private ["_simulation"];
	
	_Decoy = _this select 0;
	_state = _this select 1;
	if (_state == 1) then {_simulation = false}else{_simulation = true};
	_Decoy animate ["ramp_bottom",_state]; 
	_Decoy animate ["ramp_Top",_state];
	_Decoy enableSimulation _simulation;
};


JTK_SP_MonitorExitSpeed = {
	_unit 	= _this select 0;
	_static = _this select 1;

	_n = 5;
	_inc = 5;
	_limit = JTK_SP_AVG_SPEED - (_inc/_n);

	WaitUntil {(_unit getVariable "JTK_HALO_Status") == "FREEFALL"};

	_speed = _unit call JTK_GetSpeed;

	While {_speed >_limit} do {
		_speed = if (_speed > _limit) then {_speed - (_inc/_n)}else{[_avg_spd,true]};
		_unit setVelocity [(sin _dir*_speed),(cos _dir*_speed),(velocity _unit select 2)];
		sleep (1/_n);
	};
	_unit setVariable ["JTK_DONE_SLOWING",true];
};

JTK_HALO_Monitor_NVGs = {
	_NVGs_Lost = false;
	While {(alive _this) AND (getPosATL _this select 2 > 1) AND (_this hasweapon "NVGoggles")} do {
		if (((_this getVariable "JTK_HALO_Status") == "FREEFALL") AND (currentVisionMode _this == 1)) then {
			While {((_this getVariable "JTK_HALO_Status") == "FREEFALL") AND (_this hasweapon "NVGoggles")} do {
				if ((random 1 >= 0.95) AND ((_this getVariable "JTK_HALO_Status") == "FREEFALL")) then {
					_this removeWeapon "NVGoggles";
					_this GlobalChat "You lost Your NVGs!!";
				};
				sleep 1;
			};
		};
		sleep 1;
	};
};

/*
JTK_HALO_ResetStatic = {
	_static = _this select 0;
	_home = _this select 1;

	_static setdir 0; 
	_static setPos _home;
	if (local _static) then {
		_static animate ["ramp_bottom",0]; 
		_static animate ["ramp_Top",0];
		_static hideObject true;
	};
	JTK_Call_PVEH = [_static,compile "_this animate ['ramp_bottom',0];_this animate ['ramp_top',0]"]; 
	//JTK_Call_PVEH = [_static,compile "_this hideobject true;_this animate ['ramp_bottom',0];_this animate ['ramp_top',0]"]; 
	publicVariable "JTK_Call_PVEH";
};
*/

JTK_HALO_GetVarsByStaticType ={
	_static = _this select 0;
	private["_dir","_anim","_speed","_ROD"];
	if((typeof _static) == "C130J_static_EP1") then{
		_anim = "AmovPercMrunSnonWnonDf";
		_dir = (direction _static) call JTK_SimplifyDir;
		_speed = 5;
		_ROD = -0.1; 
	}else{
		_anim = "AmovPercMwlkSnonWnonDf";
		_dir  = if (((direction _static) call JTK_SimplifyDir) > 180) then {(((direction _static) call JTK_SimplifyDir) -  180)}else{(((direction _static) call JTK_SimplifyDir) + 180)};
		_speed = 2;
		_ROD = 0;
	};
	[_anim,_dir,[sin(_dir)*_speed,cos(_dir)*_speed,_ROD]]
};


Common_Scripts_Compiled = true;












