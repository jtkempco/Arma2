//by Kempco 
/*
	by Kempco
	Returns the stance of a unit as one of the following strings: "prone","kneel","stand".
	NOTE: Strings returned "NA" are vehicles and do not have stances.
	
	EX:
		_stance = _unit call JTK_SL_GetUnitStance; 
		returns: "prone"

*/

private ["_stance"];

_anim = toArray(toLower(animationState _this));

if ((vehicle _this) == _this) then {
	if (count(_anim) < 12) exitWith {};
	_stances = toString([_anim select 4, _anim select 5, _anim select 6, _anim select 7]);
	_stance = switch (_stances) do {
		case "ppne": {"prone"};
		case "pknl": {"kneel"};
		case "perc": {"stand"};
		default {"kneel"}; 
	};
}else{_stance = "NA"};
_stance

