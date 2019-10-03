//by Kempco
/*
	Manages the magazine type switch when switching from silenced weapons to non silenced when using FHQ weapons. 
	ex: 68 tracers become 68 tracers SD and son.
*/
	
_isSilenced = _this select 0;
_SD = _this select 1;
_STAN = _this select 2;
		
_SD_mags = getArray (configFile >> "CfgWeapons" >> _SD >> "magazines");
_all_mags = getArray (configFile >> "CfgWeapons" >> _STAN >> "magazines");

_STAN_mags = [];
for "_i" from 0 to (count _all_mags - 1) do {
	_mag = _all_mags select _i;
	if !(_mag in _SD_mags) then {_STAN_mags = _STAN_mags + [_mag]};
};
_mags = magazines player;
for "_i" from 0 to (count _mags - 1) do {
	_mag = _mags select _i;
	if (_mag in _all_mags) then {
		_array = if (!_isSilenced) then {_SD_mags}else{_STAN_mags};
		_index = if (!_isSilenced) then {_STAN_mags find _mag}else{_SD_mags find _mag}; 	
		player removeMagazine _mag;
		player addmagazine (_array select _index);
	};
	[] spawn {sleep 0.5; reload player};
};


