/*	
INPUT: ARRAY: [POSITION/OBJECT,POSITION/OBJECT]
OUTPUT: NUMBER: DIR FROM THE FIRST OBJECT/POSITION TO THE SECOND (NOTE: ANGLE IS SIMPLIFIED BETWEEN 0 AND 360	

Author: Kempco
*/
_a = _this select 0;
_b = _this select 1;
_dir = [_a,_b] call BIS_fnc_dirTo;
While {_dir < 0} do {_dir = _dir + 360};
if(_dir > 360) then {_dir = _dir mod 360};
_dir


