//by Kempco
_mapsize = _this select 0;

_Size_stndrd = 235.93;
_zoom_stndrd = 0.05;

private ["_zoom","_mltplr"];

_add = true;
_percnt = (_mapsize/_Size_stndrd);
if (_percnt  > 1) then {_percnt = _percnt mod 1;_add = false};
_percntof = 1 - (_percnt);
_zoom_dif = _percntof*_zoom_stndrd;
if !(_add) then {
	_zoom = _zoom_stndrd - _zoom_dif; 
}else{
	_zoom = _zoom_dif + _zoom_stndrd; 
};

if (_zoom > 0.095) then {
	_zoom = 0.25
}else{
	if (_zoom == 0) then {
		_zoom = _zoom + _zoom_stndrd
	}else{
		if (_zoom < 0) then {_zoom = 0};
	};		
};

_zoom

