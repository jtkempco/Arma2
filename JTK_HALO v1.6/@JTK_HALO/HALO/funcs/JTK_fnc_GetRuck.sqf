//by Kempco

_unit = _this;

private ["_rucktype"];

_HasRuck = [_unit] call ACE_fnc_HasRuck;
if (_HasRuck) then {
	_ruckName = [_unit] call ACE_fnc_FindRuck;
	_rucktype = _ruckName;
}else{
	_rucktype = Nil;
};

_rucktype

