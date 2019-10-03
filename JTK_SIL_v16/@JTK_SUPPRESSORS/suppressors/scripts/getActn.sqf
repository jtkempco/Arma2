_unit = _this select 0;

private ["_PlayerWeaponArray"];

_CanUse_Assualt_Rifles 	= _unit getVariable "JTK_Can_Use_AssualtRifle_Suppressors";
_CanUse_Sniper_Rifles  	= _unit getVariable "JTK_Can_Use_SniperRifle_Suppressors";

if (!isNil "JTK_SIL_Actn") then {_unit removeAction JTK_SIL_Actn; JTK_SIL_Actn = nil};//Cleanup
_unit setVariable ["JTK_Current_Weapon", (currentweapon _unit)];

	
_isPistol = [_unit] call JTK_SIL_CheckIsPistol;

if (_isPistol) then {
	_PlayerWeaponArray = (_unit getVariable "JTK_Current_Weapon") call JTK_SIL_GetPistols;	
}else{
	if (_CanUse_Assualt_Rifles) then {
		_PlayerWeaponArray = (_unit getVariable "JTK_Current_Weapon") call JTK_SIL_GetAssualtRifles;	
	};
	if ((isNil "_PlayerWeaponArray") AND (_CanUse_Sniper_Rifles)) then {
		_PlayerWeaponArray = (_unit getVariable "JTK_Current_Weapon") call JTK_SIL_GetSniperRifles;
	};
};

if (!isNil "_PlayerWeaponArray") then { 

	_STAN = _PlayerWeaponArray select 0; 
	_SD = _PlayerWeaponArray select 1;
	_name = _PlayerWeaponArray select 2;
	  
	_sel = if (currentWeapon _unit == _STAN) then {"Equip"}else{"Remove"}; 

	if ((typeName _PlayerWeaponArray) == "ARRAY") then {
		JTK_SIL_Actn = _unit addaction [format["<t color='#E9DFA0'>> %1: (%2 suppressor)</t>",_name,_sel],(JTK_SIL_Path+"scripts\actn.sqf"),[_sel,_STAN,_SD,_isPistol],15,true,true,"","(JTK_SIL_KeyPressed) AND (speed player <= 0) AND (player == vehicle player) AND (currentweapon player) == (player getvariable 'JTK_Current_Weapon')"];	
	};
};