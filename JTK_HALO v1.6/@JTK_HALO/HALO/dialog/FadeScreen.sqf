//by Kempco

#include "Definitions.sqf"
disableSerialization;

_request = _this select 0;
_delay = _this select 1;


createDialog "JTK_FadeScreen";
WaitUntil{dialog};
_display = findDisplay FadeScreen_IDD;
_control = _display displayCtrl JTK_FadeScreen_idc;

private ["_startColor","_endColor","_inc"];

switch (_request) do {
	case "BLACK IN":{
		_startColor = [0,0,0,1];
		_endColor = [0,0,0,0];
		_inc = (1/_delay)*-1;
	};
	case "BLACK OUT":{
		_startColor = [0,0,0,0];
		_endColor = [0,0,0,1];
		_inc = (1/_delay);
	};
};

_delay spawn {
	_t = 0;
	While {time < time + _this} do {
		sleep 1;
		_t = _t + 1;
		hint format["%1s",_t];
	};
};

_control ctrlSetBackgroundColor _startColor;

_color = _startColor; 

for "_i" from 1 to _delay do {
	_color = [(_color select 0),(_color select 1),(_color select 2),(_color select 3) + _inc];
	_control ctrlSetBackgroundColor _color;
	sleep _inc;
};
	
	
 

