//by Kempco

_aircraft = _this select 0;
_static = _this select 1;
//_side = _this select 2;
_side = civilian;//so markers don't show up
_players = _this select 3;
_home = _this select 4;

_last_jumper = if (isMultiplayer) then {_players select (count _players - 1)}else{player};
_staticToReset = if (_aircraft getVariable "is a C130") then {_static}else{(_static getVariable "anchor")};

private ["_pos","_dir","_speed"];

if (!isDedicated) then {
	if (!isMultiplayer) then {
		WaitUntil {(player distance _static < 15)};
		sleep 5;
	}else{
		if (player in _players) then {
			WaitUntil {(player getVariable "JTK_HALO_Player_Ready")};
		};
	};
}; 

_type = if (_aircraft getVariable "is a C130") then {"C130J_US_EP1"}else{"MV22"};
if (_type == "C130J_US_EP1") then {
	_pos = _static modelToWorld [0,-10,3];
	_dir = if (((direction _static) call JTK_SimplifyDir) > 180) then {(((direction _static) call JTK_SimplifyDir) - 180)}else{(((direction _static) call JTK_SimplifyDir) + 180)};
	_speed = 300;
}else{
	_pos = _static modelToWorld [0,10,3];
	_dir = (direction _static) call JTK_SimplifyDir;
	_speed = 175;
};
	
_array = [[-20000,-20000,500],_dir,_type,_side] call bis_fnc_spawnvehicle;
_decoy = _array select 0;
WaitUntil {!isNull _decoy};

_decoy hideobject true;
_decoy animate ["ramp_bottom",1];
_decoy animate ["ramp_top",1];
_decoy setDir _dir; 
_decoy setPos _pos;
_decoy enableSimulation false;

if (isMultiplayer) then {
	JTK_Call_PVEH = [_decoy,compile "_this hideobject true;_this enableSimulation false;_this animate ['ramp_bottom',1];_this animate ['ramp_top',1]"];
	publicVariable "JTK_Call_PVEH";
};
WaitUntil{((_last_jumper getVariable "JTK_HALO_Status") == "FREEFALL")};

_staticToReset setdir 0; 
_staticToReset setPos _home;
if (!isDedicated) then {_static animate ["ramp_bottom",0]; _static animate ["ramp_Top",0]};
JTK_Call_PVEH = [_static,compile "_this animate ['ramp_bottom',0];_this animate ['ramp_top',0]"]; 
publicVariable "JTK_Call_PVEH";

_aircraft setVariable ["Static_Set",false];

_decoy enableSimulation true;
_decoy hideobject false;
_decoy animate ["ramp_bottom",0];
_decoy animate ["ramp_top",0];
JTK_Call_PVEH = [_decoy,compile "_this hideobject false;_this enableSimulation true; _this animate ['ramp_bottom',0]; _this animate ['ramp_top',0]"];
publicVariable "JTK_Call_PVEH";

_decoy setVelocity [sin(_dir)*_speed,cos(_dir)*_speed,0];

[_decoy,_aircraft] spawn {
	_decoy = _this select 0;
	_aircraft = _this select 1;
	sleep (JTK_HALO_Cooldown*0.9);
	_driver = driver _decoy;
	deleteVehicle _decoy;
	deleteVehicle _driver;
};

_decoy flyinHeight (position _decoy select 2);
_wpPos = _decoy modelToWorld [0,6000,0];
_wp = (group _decoy) addwaypoint [_wpPos,0];
_wp setWayPointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointSpeed "FULL";
_wp setWaypointStatements ["true","deleteVehicle (vehicle this); deleteVehicle this"];


