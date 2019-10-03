//by Kempco

_veh = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_veh removeAction _id;

_hlpr = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
WaitUntil {!isNull _hlpr};
_hlpr setDir (direction _veh);
_hlpr attachTo [_veh,[0,0,-15]];
WaitUntil {_hlpr distance _veh <= 16};
detach _hlpr;
_attachPos = [0,0,15];
_veh attachTo [_hlpr,_attachPos];
[-2, {_this lock true}, _veh] call CBA_fnc_globalExecute;
_t = time + 10;
While {_t > time} do {
	_attachPos = [_attachPos select 0,_attachpos select 1,(_attachPos select 2) - 0.01]; 
	_veh attachTo [_hlpr,_attachPos];
	sleep 0.05;
};

deleteVehicle _veh;
deleteVehicle _hlpr;





