//by Kempco
//Spawn Vehicle and attach to C130

_aircraft = _this select 0;
_veh_type =_this select 1;
_pilot = _this select 2;
_isC130 = _aircraft getVariable "is a C130";
_static = _aircraft getVariable "JTK_HALO_STATIC";

if (!isServer) exitwith {};

private ["_veh_offset","_hlpr_offset","_dir"];

_vUp_hlpr = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
_hlpr = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
WaitUntil {(!isNull _hlpr) AND (!isNull _vUp_hlpr)};
{_x hideObject true} foreach [_hlpr,_vUp_hlpr];
JTK_Call_PVEH = [[_hlpr,_vUp_hlpr],compile "{_x hideObject true} foreach _this;"]; publicVariable "JTK_Call_PVEH";

if (_isC130) then {
	_veh_offset = [0,0,-0.2];
	_hlpr_offset = [0,0,-3.5];
	_dir = direction _static; 
}else{
	_veh_offset = [0,0,0];
	_hlpr_offset = [0,-1,-1.25];
	_anchor = _static getVariable "anchor"; 
	_dir = if (direction _anchor < 0) then {(direction _anchor) + 360}else{(direction _anchor)};	
};

_veh = createVehicle[_veh_type,[0,0,1000],[],0,"NONE"];
WaitUntil {!isNull _veh};
_veh lock true;
if (_isC130) then {
	_hlpr attachto[_static,_hlpr_offset];
	WaitUntil {_hlpr distance _static < 5};
	_veh attachTo [_hlpr,_veh_offset];
	_hlpr spawn {sleep 2; detach _this};
}else{
	_hlpr attachto[_static,_hlpr_offset]; 
	WaitUntil {_hlpr distance _static < 5};
	detach _hlpr;
	sleep 2;
	_hlpr setDir _dir; 
	_veh attachTo [_hlpr,_veh_offset];
};

_attachPos = if (_isC130) then {[0,2.4,-0.425]}else{[0,4.4,-0.425]};
_vUp_hlpr attachTo [_veh,_attachPos];
_vUp_hlpr spawn {sleep 2; detach _this};

_veh setVariable ["JTK_HALO_Veh_Helpers",[_hlpr,_vUp_hlpr,(currentVisionMode _pilot)]];
_static setVariable ["JTK_HALO_Vehicle",_veh,true];

//Save so you can refference to order AI to get in once they land.
if !(isMultiplayer) then {player setVariable ["JTK_HALO_Vehicle",_veh]};


