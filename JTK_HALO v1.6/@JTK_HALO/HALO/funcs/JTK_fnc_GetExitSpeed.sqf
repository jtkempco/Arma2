//by Kempco
/*
	INPUT: [Static Aircraft,Speed]
	OUTPUT: velocity (ARAY)
*/

_dir = if ((typeName (_this select 0)) == "OBJECT") then {direction (_this select 0)}else{_this select 0};
_speed = _this select 1;
_vel_z = if (count _this > 2) then {_this select 2}else{0};


_s_dir = _dir call JTK_SimplifyDir;
_dir = if((typeof _static) == "C130J_static_EP1") then{_s_dir}else{if (_s_dir > 180) then {(_s_dir -  180)}else{(_s_dir + 180)}};	
[sin(_dir)*_speed, cos(_dir)*_speed,_vel_z]


