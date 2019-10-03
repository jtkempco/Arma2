//by Kempco

_isSilenced = _this select 0;
_STAN = _this select 1;
_SD = _this select 2;

private ["_mag_size","_bullets","_full_mags","_partial_mags"];

_unit    = player;
_current = currentweapon _unit;
_all_mags = [];
_mags_to_remove = [];
_mags_to_add = [];

_SD_mags = getArray(configFile >> "CfgWeapons" >> _SD >> "magazines");
_STAN_mags = getArray(configFile >> "CfgWeapons" >> _STAN >> "magazines");
_array = if (_isSilenced) then {_STAN_mags}else{_SD_mags};

{_all_mags = _all_mags + [tolower _x]} foreach _SD_mags;
{_all_mags = _all_mags + [tolower _x]} foreach _STAN_mags;

for "_i" from 0 to (count (magazines _unit) - 1) do {
	_mag = tolower(magazines _unit select _i);
	if (_mag in _all_mags) then {_mags_to_remove = _mags_to_remove + [_mag]};
};

for "_i" from 0 to (count _mags_to_remove - 1) do {
    	_mag = _mags_to_remove select _i;
    	_mag_capacity = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
    	player removemagazine _mag;
    	_unit addmagazine [(_array select 0),_mag_capacity];
};



