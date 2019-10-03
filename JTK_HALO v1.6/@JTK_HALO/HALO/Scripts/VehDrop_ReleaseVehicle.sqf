//By Kempco
//Deploy Vehicles from C130

if (!isserver) exitWith {};

_static = _this select 0;
_side = _this select 1;
_aircraft = _this select 2;
_isC130 = _aircraft getVariable "is a C130";
_exitspeed = (_aircraft getVariable "speeds") select 0;
_deployChute_Alt = JTK_HALO_Water_Insertion_Altitude - 25;

_veh = _static getVariable "JTK_HALO_Vehicle"; 
_hlpr = (_veh getVariable "JTK_HALO_Veh_Helpers")select 0;
_vUp_hlpr = (_veh getVariable "JTK_HALO_Veh_Helpers")select 1;
_vissionMode = (_veh getVariable "JTK_HALO_Veh_Helpers")select 2;
_RP = (getmarkerPos(_aircraft getVariable "JTK_HALO_DropZoneMarker"));

_helpers = [_hlpr,_vUp_hlpr];

_track = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
WaitUntil {!isNull _track};
//Determine initial distance then calculate percentage using: (curent distance)/(max distance).
_max_dist = [_veh,_RP] call BIS_fnc_distance2D;

_v_dir = (direction _static);	
While {_v_dir < 0} do {_v_dir = _v_dir + 360};
if (_v_dir > 360) then {_v_dir = _v_dir mod 360};

_v_offset = if (_isC130) then {0}else{180};
_array = [_v_dir,_v_offset] call JTK_GetVectorUpAndDir;
_vUp_hlpr setDir (_array select 1);
_vUp_hlpr setVectorUp (_array select 0);
sleep 0.2;

_PullOutChute = createVehicle["ParachuteMediumWest_EP1",[0,0,300],[],0,"FLY"];
WaitUntil {!isNull _PullOutChute};
_PullOutChute hideObject true;
if (isMultiplayer) then {JTK_Spawn_PVEH = [_PullOutChute, compile "_this hideobject true; sleep 3.5;_this hideobject false"]; publicVariable "JTK_Spawn_PVEH"};
sleep 3.5;
_PullOutChute attachTo [_vUp_hlpr,[0,0,0]];
_PullOutChute hideObject false;

_dir = if (_isC130) then {
	direction _static
}else{
	if (direction(_static getVariable "anchor") < 0) then {
		(direction(_static getVariable "anchor")) + 360;
	}else{
		direction(_static getVariable "anchor");
	};
};

_speed_limit = (_exitspeed/3.6);
_speed = 0;
_offset = if (_isC130) then {[0,5.4,-3.5]}else{[0,-4,-2]};	


While {(_veh distance (_static modelToWorld _offset) > 1.0)} do {
	_speed = if (_speed < _speed_limit) then {_speed + (1/25)}else{_speed_limit};
	_hlpr setVelocity [(sin _dir*_speed),(cos _dir*_speed),(velocity _hlpr select 2)];
	_vUp_hlpr setVelocity [(sin _dir*_speed),(cos _dir*_speed),(velocity _hlpr select 2)];
	sleep 0.01;
};

//Detach Pullout Chute
_PullOutChute spawn JTK_HALO_DetachPulloutChute;

//_speed = (_exitspeed*1.5)/3.6;
_speed = _exitspeed/3.6;
_hlpr setVelocity [(sin _dir*_speed),(cos _dir*_speed),(velocity _hlpr select 2)];
_vUp_hlpr setVelocity (velocity _hlpr);

_speed_i = _speed;
_vz = 0;
While {((getPosASL _veh) select 2) > _deployChute_Alt} do {
	_dist = [_veh,_RP] call BIS_fnc_distance2D;
	_mltplr = _dist/_max_dist;
	_speed = _speed_i*_mltplr;
	_vz = if (_vz > -59) then {_vz - (9.8/100)}else{-60};
	_hlpr setVelocity [(sin _dir*_speed),(cos _dir*_speed),_vz];
	_vUp_hlpr setVelocity (velocity _hlpr);
	sleep 0.01;
};

_static setVariable ["JTK_HALO_Vehicle_Released",true,true];

_chute = createVehicle["ParachuteMediumWest_EP1", [0,0,100],[],0,"FLY"];
WaitUntil {!isNull _chute};  
_veh_pos = position _veh;
_veh_dir = direction _veh;

_chute setDir _veh_dir;
_chute setPos _veh_pos;

detach _veh;
_veh attachTo [_chute,[0,0,0.85]];
{deleteVehicle _x} foreach _helpers;

_track setPosASL [getPosASL _veh select 0,getPosASL _veh select 1,0];
_track setDir (direction _veh);

_ROD = 40;
_dist = [_veh,_RP] call BIS_fnc_distance2D;
_t = (getPosASL _veh select 2)/_ROD;
_speed = _dist/_t;

_attachPos = [0,0,getPosASL _veh select 2];
_chute enableSimulation false;
_chute attachTo [_track,_attachpos];

private ["_x","_y"];
_n= 100;
While {(getPosASL _veh select 2) > 2} do {
	_dist = [_veh,_RP] call BIS_fnc_distance2D;
	if(_dist < (_dist - 1)) then {
		_x = 0;
		_y = 0;
	}else{
		_x = (_speed/_n);
		_y = (_speed/_n);
	};
	_z = (_ROD/_n);
	_attachPos = [_attachPos select 0,(_attachPos select 1)+_y,(_attachPos select 2)-_z];
	_chute attachTo [_track,_attachPos];
	sleep(1/_n);
};

detach _veh;
deleteVehicle _chute;
_veh setVelocity [0,0,0];
_veh setPosASL [position _veh select 0,position _veh select 1,2];
_veh setVariable ["JTK_Veh_Info",[getPosASL _veh,direction _veh],true];
_veh lock false;
		
_veh setVehicleInit "
	this addEventHandler ['GetIn',{_this spawn JTK_Zodiac_GetIn_EH}];
	this addAction ['Scuttle CRRC',(JTK_HALO_Path+'Scripts\Actions\Scuttle_Boat.sqf'),[],-3,false,true,'','(count crew _target <= 0) AND !(surfaceIsWater (position _target))'];
";
processInitCommands;

sleep 2;

_veh spawn {
	_smoke = "smokeShellRed" createVehicle [0,0,0];
	WaitUntil {!isNull _smoke};
	_smoke attachTo [_this,[0,0,0]];
	_t = time + 60;
	WaitUntil {(time > _t) OR ((count crew _this) > 0)};
	detach _smoke;
	sleep 0.15;
	deleteVehicle _smoke;
};
	

if (!isMultiplayer) then {
	_pos = getPosASL _veh;
	while{isNull driver _veh} do {
		_veh setVelocity [0,0,0];
		if (_veh distance _pos > 10) then {_veh setPosASL _pos}; 
		sleep 0.01;
	};
}else{ 
	//Attach Boat to Anchor in SP, Incase it moves while AI are moving to it.
	//NOTE: Allow in MP: If player bumps the boat it will take off and not stop.
	//Ataching boat in MP causes to Boat to reset to [0,0,0] if player is not local. Maybe try golbal attach to.
	if (surfaceIsWater (position _veh)) then {
		_anchor = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
		WaitUntil {!isNull _anchor};
		_anchor setDir (direction _veh);
		_anchor setPos (_veh modelToWorld [0,0,0]);
		_veh attachTo [_anchor,[0,0,0]];
		_anchor hideObject true;
		JTK_Call_PVEH = [_anchor,compile "_this hideObject true"]; publicVariable "JTK_Call_PVEH"; 
		WaitUntil {!isNull (driver _veh)}; 
		detach _veh;
		sleep 3;
		deleteVehicle _anchor;
	};
};










