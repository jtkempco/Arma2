//by Kempco

#include "\ca\editor\Data\Scripts\dikCodes.h"

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];
_target =  _this select 0;
_params = _this select 1;

_CanUse_Assualt_Rifles 	= player getVariable "JTK_Can_Use_AssualtRifle_Suppressors";
_CanUse_Sniper_Rifles  	= player getVariable "JTK_Can_Use_SniperRifle_Suppressors";

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

player setVariable ["JTK_Current_Weapon", (currentweapon player)];
_isPistol = [player] call JTK_SIL_CheckIsPistol;

if (_isPistol) then {
	JTK_SIL_Array = (currentweapon player) call JTK_SIL_GetPistols;	
}else{
	if (_CanUse_Assualt_Rifles) then {
		JTK_SIL_Array = (currentweapon player) call JTK_SIL_GetAssualtRifles;	
	};
	if ((isNil "JTK_SIL_Array") AND (_CanUse_Sniper_Rifles)) then {
		JTK_SIL_Array = (currentweapon player) call JTK_SIL_GetSniperRifles;
	};
};
	
If (isNil "JTK_SIL_Array") exitWith {};
_name = JTK_SIL_Array select 2;

_menus = [
 	[["main", "", "popup"],[
 		[format["%1 - (Remove suppressor)",_name],{JTK_SIL_Array spawn JTK_SIL_ACE_actn},"", "", "",-1, 1, (currentweapon player == JTK_SIL_Array select 1) AND (player == vehicle player)],
 		[format["%1 - (Equip suppressor)",_name], {JTK_SIL_Array spawn JTK_SIL_ACE_actn},"", "", "",- 1, 1,(currentweapon player == JTK_SIL_Array select 0) AND (player == vehicle player)]
  	]
 ]];

_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef // return value






