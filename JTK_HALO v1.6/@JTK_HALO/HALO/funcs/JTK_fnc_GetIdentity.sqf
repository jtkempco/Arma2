//by Kempco

_ids = [];
for "_i" from 1 to 25 do {
	_standard = format["%1_%2",_this,_i];
	_goggles = format["%1_G%2",_this,_i];
	_id = [_standard,_goggles];
	_ids = _ids + [_id];
};
_ids call bis_fnc_selectrandom



