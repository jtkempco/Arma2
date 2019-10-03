//by Kempco
_unit = player;

_unit spawn {
	sleep 120;
	hideBody _this;
	sleep 3;
	deleteVehicle _this;
};

if ((animationState _unit) in JTK_HALO_Freefall_Animations) then {
	_unit setVelocity [0,0,0];
	_unit switchMove "AdthPercMstpSnonWnonDnon_1";
	if (ismultiplayer) then {JTK_Call_PVEH = [[_unit,"AdthPercMstpSnonWnonDnon_1"], compile "(_this select 0) switchMove (_this select 1)"]; publicVariable "JTK_Call_PVEH"};
};


 	
WaitUntil{alive _unit};
_GearSaved = _unit getVariable "JTK_Save_Gear";
disableUserInput false;

if (JTK_CanChangeID) then {
	_id = if (JTK_ACE_Detected) then {"ACE_Original_Identity"}else{(_unit getVariable "JTK_Identities") select 0};
	_unit setIdentity _id;
	if (ismultiplayer) then {JTK_Call_PVEH = [[_unit,_id], compile "(_this select 0) setIdentity (_this select 1)"]; publicVariable "JTK_Call_PVEH"};
};

if (isNil "_GearSaved") exitWith {};

_mags 	= _GearSaved select 0;
_Weapons 	= _GearSaved select 1;
_ruck 	= _GearSaved select 2;

removeAllWeapons _unit;

if (JTK_ACE_Detected) then {
	_goggles = _GearSaved select 3;
	if (_unit hasWeapon "ACE_ParachutePack") then {_unit removeWeapon "ACE_ParachutePack"};
	{_unit addweapon _x} foreach _goggles; 
}else{removeBackpack _unit};

//Restore Weapons and mags
{_unit addMagazine _x} foreach _mags;
{_unit addweapon _x} foreach _weapons; 

//Restore NVGs
if ((_unit getVariable "JTK_HasNVGs") AND !(_unit hasWeapon "NVGoggles")) then {_unit addweapon "NVGoggles"};

//Restore Map
if (_unit getVariable "JTK_HasMap") then {
	if (JTK_ACE_Detected) then {
		_unit addWeapon "ACE_Map";
	}else{_unit removeWeapon "ItemMap"};
};

//Restore Backpack and Backpack Cargo (NON ACE)
if !(JTK_ACE_Detected) then {
	_ruckCargo = _GearSaved select 3;
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
	

if (true) exitWith {_unit setVariable ["JTK_Save_Gear",nil]};


