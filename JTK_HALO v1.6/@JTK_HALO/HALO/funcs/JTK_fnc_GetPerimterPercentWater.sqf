//by Kempco
/*
	INPUT: ARRAY
		0: Position of Center 
		1: Radius (Number)
		2: Limit of land allowed (Value must be between 0 and 1)
		3: OPTIONAL Number of positions around radius to check.
				 
	OUTPUT: BOOL
	
	EX: [getMarkerPos "TEST",150,0.1,50] call JTK_AreaIsWater;
	returns: True (If less than 10 percent of radius is land). 
*/
	
	
_center = _this select 0;
_radius = _this select 1;
_limit = _this select 2;
_checks = if (count _this > 3) then {_this select 3}else{50};

if !(surfaceIsWater _center) exitWith{false};

_step = 360/_checks; 
_waterpositions = 0;
_landPositions = 0;
for "_i" from 1 to _checks do {
	_dir = _step * _i;
	_x = (_center select 0)+(sin(_dir)*_radius);
	_y = (_center select 1)+(cos(_dir)*_radius);
	if !(surfaceIsWater [_x,_y]) then{
		_landPositions = _landPositions + 1
	}else{_waterpositions = _waterpositions + 1};
};
_percentLand = _landPositions/_checks;
_IsWater = if (_percentLand < _limit) then{true}else{false};
_IsWater	



