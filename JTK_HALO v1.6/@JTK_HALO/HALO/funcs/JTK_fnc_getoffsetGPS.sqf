//by Kempco
	
_unit = _this select 0;
_min_zoom = _this select 1;
_max_zoom = 0.45;

_speed = abs(speed _unit);
_heading = direction _unit;

_GPS_ZoomOffsetPos = (abs(speed(_unit))*2.5);
_GPS_ZoomOffsetDir = 180;

if (_speed > 0) then {_GPS_ZoomOffsetDir = _GPS_ZoomOffsetDir - 180};

_offset = [position _unit,_speed,(_heading + _GPS_ZoomOffsetDir)] call BIS_fnc_relPos;

_offset