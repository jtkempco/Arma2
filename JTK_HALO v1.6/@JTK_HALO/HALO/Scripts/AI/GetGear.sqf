//by Kempco
/*
	INPUT: UNIT
	OUTPUT: ARRAY 
		[_Weapons,_mags,_ruck,_ruckCargo]
*/

//Save AI Gear
private ["_ruck","_ruckCargo"];
_Weapons = weapons _this;
_mags = magazines _this;

//Handle Backpacks
if (JTK_ACE_Detected) then {
	_ruck = _this call JTK_GetRuck
}else{
	_ruck = typeof(unitBackpack _this);
	if (_ruck != "") then {
		//BackPack Magazines
		_ruck_mags = getMagazineCargo (unitBackpack _this);
		if (count(_ruck_mags select 0) == 0) then {_ruck_mags = false}; 
		//BackPack Weapons
		_ruck_weaps = getWeaponCargo (unitBackpack _this);
		if (count(_ruck_weaps select 0) == 0) then {_ruck_weaps = false};
		_ruckCargo = [_ruck_mags,_ruck_weaps];
		removeBackpack _this;
	}else{
		_ruck = nil;
		_ruckCargo = false;
	};
};
removeAllWeapons _this;	
_this addBackPack "US_Backpack_EP1";
//if (JTK_ACE_Detected) then {_this addWeapon "ACE_ParachutePack"}else{_this addBackPack "US_Backpack_EP1"};
[_Weapons,_mags,_ruck,_ruckCargo]





