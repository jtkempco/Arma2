//by Kempco
	
_unit = _this select 0;
_gearStorage = _this select 1; 

if (isNil "_gearStorage") exitWith {
	player globalChat format ["JTK_HALO DEBUG: GEAR NOT RESTORED TO THE FOLLOWING UNIT: %1.",_unit];
	player globalChat format "JTK_HALO DEBUG: EQUIPMENT ARRAY WAS UNDEFINED.";
};

_Weapons = _gearStorage select 0;
_mags = _gearStorage select 1;
_ruck = _gearStorage select 2;

{_unit addmagazine _x} foreach _mags;
{_unit addWeapon _x} foreach _Weapons; 

if (JTK_ACE_Detected) then {	
	if (!isNil "_ruck") then {_unit addweapon _ruck};	
}else{
	//Restore Backpack and Backpack cargo (NO ACE)
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


