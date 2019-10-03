//by Kempco
_unit = _this select 0;
_aircraft = _this select 1;
_sel = if ((random 1) < 0.5) then{-1}else{1};

private ["_array"];

if (typeof _aircraft == "C130J") then {
	if (_sel == -1) then {
		_Target = "Sign_sphere10cm_EP1" createVehicle ((vehicle _unit) modelToWorld [0,-2000,-4]);
		WaitUntil {!isNull _Target};
		_Target setPos ((vehicle _unit) modelToWorld [0,-1000,-4]); 
		WaitUntil {_Target distance (vehicle _unit) < 1050};
		_FOV = 1.15;
		_pos = [0,-2,-3.5];
		_array = [_pos,_FOV,_Target,true];
	}else{
		_pos = [0,-10,-5];
		_FOV = 0.7;
		_array = [_pos,_FOV,(vehicle _unit)];
	};
}else{
	_pos = [0,0.5,0];
	_FOV = 0.7;
	_array = [_pos,_FOV,_unit];
};
	
_array


