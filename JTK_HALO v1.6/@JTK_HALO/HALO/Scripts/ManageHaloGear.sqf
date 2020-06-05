 //by Kempco

/*	
	Lot of screwing around here to ensure that once the player gets his weapons back, a throwable exsplosive (if he has one) is NOT
	set to his current weapon. NOT GOOD! First shot fired once primary is selected may be a grenade!!

	Priamary mags are tracked and one is added to player at 50m above the ground. This ensures that once 
	primary weapon is added it is loaded.

	NOTE: Primary weapon was determined as follows: 
	primaryweapon > pistol > secondaryweapon
	
*/

_unit = _this select 0;
_static = _this select 1;
_C130 = _this select 2;

if (!isNil "JTK_HALO_InC130") exitWith {};

private ["_ruck","_ruckCargo"];

JTK_HALO_In_Aircraft = true;//Used to Break out of fsm Loop

_Weapons = weapons _unit;
_mags = magazines _unit;

//Handle Backpacks
if (JTK_ACE_Detected) then {
	_ruck = _unit call JTK_GetRuck
}else{
	_ruck = typeof(unitBackpack _unit);
	if (_ruck != "") then {
		//BackPack Magazines
		_ruck_mags = getMagazineCargo (unitBackpack _unit);
		if (count(_ruck_mags select 0) == 0) then {_ruck_mags = false}; 
		//BackPack Weapons
		_ruck_weaps = getWeaponCargo (unitBackpack _unit);
		if (count(_ruck_weaps select 0) == 0) then {_ruck_weaps = false};
		_ruckCargo = [_ruck_mags,_ruck_weaps];
		removeBackpack _unit;
	}else{
		_ruck = nil;
		_ruckCargo = false;
	};
};
	
_primary_weapon_mags = [];
_other_mags = [];
_primary_weapon = "";

if (JTK_ACE_Detected) then {
	_pistol = [_unit] call CBA_fnc_getPistol;

	if (primaryWeapon _unit != "") then {
		_primary_weapon = primaryWeapon _unit
	}else{
		if ((primaryWeapon _unit == "") AND (_pistol != "")) then {//Give Pistol Priority over launcher
			_primary_weapon = _pistol
		}else{
			if ((primaryWeapon _unit == "") AND (_pistol == "") AND (secondaryWeapon _unit != "")) then {
				_primary_weapon = secondaryWeapon _unit;
			}else{
				hint "No Weapons found!";
			};
		};
	};
}else{_primary_weapon = primaryWeapon _unit};

//Save NVGs as Var to be added back during jump
if (_unit hasweapon "NVGoggles") then {
	_unit setVariable ["JTK_HasNVGs",true];
}else{_unit setVariable ["JTK_HasNVGs",false]};

removeAllWeapons _unit;

_WeaponsAllowed = ["ItemGPS","ACE_DAGR","ItemMap"];
_MagsAllowed = [
	"ACE_Knicklicht_B","ACE_Knicklicht_G","ACE_Knicklicht_R",
	"ACE_Knicklicht_W","ACE_Knicklicht_Y","ACE_Knicklicht_IR",
	"ACE_IRStrobe","IRStrobe","ACE_VIP_IRStrobe"
];


JTK_ACE_Goggles = [
	"ACE_GlassesBalaklava",
	"ACE_GlassesBalaklavaGray",
	"ACE_GlassesBalaklavaOlive",
	"ACE_GlassesRedSun",
	"ACE_GlassesGreenSun",
	"ACE_GlassesBlackSun",
	"ACE_GlassesBlueSun",
	"ACE_GlassesGasMask_RU",
	"ACE_GlassesGasMask_US",
	"ACE_GlassesLHD_glasses",
	"ACE_GlassesSunglasses",
	"ACE_GlassesTactical"
];


if (JTK_ACE_Detected) then {
	_unit setIdentity "ACE_Original_Identity";
	if (isMultiplayer) then {JTK_Call_PVEH = [[_unit,"ACE_Original_Identity"], compile "(_this select 0) setIdentity (_this select 1)"]; publicVariable "JTK_Call_PVEH"};
};
		

//Remove Any AceGoggles To Avoid Conflicts with Breathing Mask
if (JTK_ACE_Detected) then {
	_Goggles = [];
	for "_i" from 0 to (count JTK_ACE_Goggles - 1) do {
		_eyewear = JTK_ACE_Goggles select _i;
		if (_unit hasweapon _eyewear) then {_unit removeWeapon _eyewear;_Goggles = _Goggles + [_eyewear]};
	};
};

_MagsToAddBack = [];
for "_i" from 0 to (count _MagsAllowed - 1) do {
	_mag = _MagsAllowed select _i;
	if (({_x==_mag} count _mags) > 0)then {
		for "_j" from 1 to ({_x==_mag} count _MagsAllowed) do {
			_MagsToAddBack = _MagsToAddBack + [_mag]
		};
	};
};

if ((count _MagsToAddBack) > 0) then {
	{_mags = _mags - [_x]}foreach _MagsToAddBack;
	{_unit addMagazine _x} foreach _MagsToAddBack; 
};

{if (_x in _WeaponsAllowed) then {_unit addweapon _x; _Weapons = _Weapons - [_x]}} foreach _Weapons;

if (_primary_weapon != "") then {
	_magazine_array = getArray (configFile >> "CfgWeapons" >> _primary_weapon >> "magazines");
	for "_i" from 0 to (count _mags - 1) do {
		_magazine = _mags select _i;
		if (_magazine in _magazine_array) then {
			_primary_weapon_mags = _primary_weapon_mags + [_magazine]
		}else{_other_mags = _other_mags + [_magazine]};	
	};
};

//Save Gear incase player is killed during jump. If Not killed reset to nil as to not overide ACE_Module
if (JTK_ACE_Detected) then {
	_unit setVariable ["JTK_Save_Gear",[_mags,_Weapons,_ruck,_Goggles,_WOB]];
}else{_unit setVariable ["JTK_Save_Gear",[_mags,_Weapons,_ruck,_ruckCargo]]};


//Add Parachute
if (JTK_ACE_Detected) then {
	if (isMultiplayer) then {_unit addWeapon "ACE_ParachutePack"}else{_unit addBackPack "US_Backpack_Specops_EP1"};
	[] spawn {[2.5,["Stowing Gear..."],false,false] spawn ace_progressbar};
}else{
	[2.5,"Stowing Gear..."] call JTK_ProgressBar;
	_unit addBackPack "US_Backpack_Specops_EP1";
};


2.5 spawn {sleep _this; player enableSimulation true};

WaitUntil {(!alive _unit) OR !(_unit in _C130)};
if (_C130 getVariable "JTK_HALO_Takeoff") then {
	WaitUntil {(_unit distance _static < 50) OR (!alive _unit)};
	if (_unit distance _static < 50) then {
		WaitUntil {(getPos _unit select 2 <= 50) OR (!alive _unit)};//<=================== Add Refference Mag
		if (count _primary_weapon_mags > 0) then {
			_ref_mag = _primary_weapon_mags select 0;
			_unit addmagazine _ref_mag; 
		};
		WaitUntil{(_unit getVariable "JTK_HALO_Status" == "DONE")};//<============WaitUntil Jump Status == "DONE"
	};
}else{
	if (JTK_ACE_Detected) then {
		if (isMultiplayer) then {_unit removeWeapon "ACE_ParachutePack"}else{removeBackPack _unit};
	}else{removeBackPack _unit};
	
	if (count _primary_weapon_mags > 0) then {
		_ref_mag = _primary_weapon_mags select 0;
		_unit addmagazine _ref_mag; 
	};
};
if (!alive _unit) exitWith {};
	
_dly = 2 + random 2;
if (_unit distance _static > 20) then {
	WaitUntil {vehicle _unit == _unit};
	sleep 1;
	if (speed _unit > 0) then {WaitUntil {speed _unit == 0}};
};


//Remove Chute if Reserve not deployed
if (JTK_ACE_Detected) then {
	if (_unit hasWeapon "ACE_ParachutePack") then{_unit removeWeapon "ACE_ParachutePack"};
	if !(surfaceIsWater (position _unit)) then {sleep 1.75;_dly spawn {[_this,["Unpacking Gear..."],false,false] spawn ace_progressbar}};//Progress bar
}else{
	if !(surfaceIsWater (position _unit)) then {[_dly,"Unpacking Gear..."] call JTK_ProgressBar};  
	removeBackpack _unit;
};
	

if (_primary_weapon != "") then {
	_unit addweapon _primary_weapon;
	WaitUntil {_unit hasWeapon _primary_weapon};
	_weapons = _weapons - [_primary_weapon];
};

//Select Preffered Weapon and muzzle
sleep 1;
_unit action ["SwitchWeapon",_unit, _unit, 0];
_unit action ["SwitchMagazine",_unit,_unit, 0];
sleep 1;

if (count _primary_weapon_mags == 0) then {
	{_unit addmagazine _x} foreach _mags;
	{_unit addWeapon _x} foreach _weapons;
}else{
	for "_i" from 1 to (count _primary_weapon_mags - 1) do {_unit addmagazine ((_primary_weapon_mags) select _i)};  
	{_unit addmagazine _x} foreach _other_mags;
	{_unit addWeapon _x} foreach _weapons;
};

//Restore Backpack and Backpack cargo (NO ACE)
if !(JTK_ACE_Detected) then {
	reload _unit;
	sleep 1;
	if (!isNil "_ruck") then {
		_unit addBackpack _ruck;
		_ruck_mags = _ruckCargo select 0;
		_ruck_weaps = _ruckCargo select 1;
		if ((typeName _ruck_mags) == "ARRAY") then {
			for "_i" from 0 to (count(_ruck_mags select 0) - 1) do {
				_type = (_ruck_mags select 0) select _i;
				_qnty = (_ruck_mags select 1) select _i;
				(unitBackpack _unit) addmagazineCargo [_type,_qnty];
			};

		};
		if ((typeName _ruck_weaps) == "ARRAY") then {
			for "_i" from 0 to (count (_ruck_weaps select 0) - 1) do {
				_type = (_ruck_weaps select 0) select _i;
				_qnty = (_ruck_weaps select 1) select _i;
				(unitBackpack _unit) addWeaponCargo [_type,_qnty]; 
			};
		};
	};
};
if (JTK_ACE_Detected) then {{_unit addWeapon _x} foreach _Goggles};//(ACE) Handle Goggles

if (alive _unit) then {_unit setVariable ["JTK_Save_Gear",nil]};
JTK_HALO_In_Aircraft = nil;
















