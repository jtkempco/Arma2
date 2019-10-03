//by Kempco
/*
INPUT: Unit
OUTPUT: BOOL
	returns true if current units weapon is a pistol, otherwise false.

EX: 
	_isPistol = [player] call JTK_CheckIsPistol;
*/
	
_unit = _this select 0;

private ["_pistol"];
{if ((getNumber (configFile >> "CfgWeapons" >> _x >> "Type")) == 2) exitWith {_pistol = _x}} forEach (weapons _unit);
if (isNil "_pistol") exitWith {false};
_isPistol = if (currentWeapon _unit == _pistol) then {true}else{false};
_isPistol


