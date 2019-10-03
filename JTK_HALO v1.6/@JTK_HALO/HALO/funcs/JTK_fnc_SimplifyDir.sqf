//by Kempco, derived from CBA_fnc_simplifyAngle by Vigilante, courtesy by -=ACE=- of Simcentric
/*
	INPUT: NUMBER 
	OUTPUT: NUMBER 
	
	EX: -45 call JTK_SimplifyDir;
	returns: 315
*/

_dir = _this;
if (_dir < 0) then {
	While {_dir < 0} do {_dir = _dir + 360};
};
if (_dir > 360) then {_dir = _dir mod 360};

_dir


