 //by Kempco
 /*
 	INPUT: ARRAY
 	OUTPUT: NUMBER
 	
 	Purpose: 
 		Takes the units give offset relative to the C130 then determines
 		which window to pass through during the animation based on the side of 
 		the aircraft the unit is on. If the unit is "JUMP COMMANDER" then the value 
 		is determined randomly.
 */
_x = _this select 0;

private ["_mltplr"];

if (_x == 0)then{
	_mltplr = if (random 1 > 0.5)then{-1}else{1};
}else{_mltplr = if (_x < 0) then {-1}else{1}};
_mltplr	

