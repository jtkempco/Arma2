//by Kempco
	
_unit = _this select 0;

_speed = abs(speed _unit);
_heading = direction _unit;
_GPS_ZoomOffsetDir = 180;

_max_zoom = 0.45;
_min_zoom = 0.15;
_bfr = abs(_speed/175);
_zoom = (_max_zoom * _bfr) + _min_zoom; 

if (_speed > 0) then {_GPS_ZoomOffsetDir = _GPS_ZoomOffsetDir - 180};

_offset = [position _unit,_zoom,(_heading + _GPS_ZoomOffsetDir)] call BIS_fnc_relPos;

_offset

