//by Kempco
/*
	INPUT:ARRAY 
		0: REQUIRED: POSITION 
		1: OPTIONAL: DINSTANCE INCREMENT (Lower the distance increment the longer the check will take).
		2: OPTIONAL: DEGREES TO SCAN PER CHECK (Lower the number the degrees the longer the check will take. Must be between 0 and 360)  
	OUTPUT: NUMBER
	
	Calulates the nearest distance to land from the input position array. 
	
	EX: [position player] call JTK_DirStringToDir;
	returns: 50
*/	
_pos = _this select 0;
_dist_inc = if (count _this > 1) then {_this select 1}else{25};
_deg_inc =  if (count _this > 2) then {_this select 2}else{10};
	
private ["_nearestLand"];	
scopeName "main";
for "_i" from 1 to 100 do {
	_radius = _dist_inc*_i;
	_dist_array = [];
	for "_j" from 1 to (360/_deg_inc) do {
		_dir = _j*_deg_inc;
		_x = (_pos select 0)+(sin(_dir)*_radius);
		_y = (_pos select 1)+(cos(_dir)*_radius);
		if !(surfaceIsWater [_x,_y]) then{
			_dist = _pos distance [_x,_y,0];
			_dist_array = _dist_array + [_dist]
		};
	};
	if (count _dist_array > 0) then {
		_nearestLand = _dist_array call BIS_fnc_lowestNum;
		breakto "main";
	};
};
_nearestLand


