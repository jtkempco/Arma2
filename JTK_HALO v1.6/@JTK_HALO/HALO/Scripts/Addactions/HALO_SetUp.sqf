//by Kempco
_unit = _this select 0;
_aircraft = _this select 1;
_dist = 25;

_CanRequestHALO = _unit getVariable "JTK_HALO_Setup_Access";

if ((!isMultiplayer) AND (_unit != leader group _unit)) exitWith {};

if ((!local _unit) OR (!_CanRequestHALO)) exitWith {};

_atcn = _unit addaction ['<t color="#fadfbe">' + "-HALO Setup-" + '</t>',(JTK_HALO_Path+"dialog\Open_dlg.sqf"),["MAIN",_aircraft],4,true,true,"",""];	

if (isMultiplayer) then {
	waitUntil {(_unit distance _aircraft > _dist) OR (_aircraft animationPhase "ramp_top" != 0)};
	_unit removeAction _atcn;
}else{
	While {(_unit distance _aircraft <= _dist) AND (_aircraft animationPhase "ramp_top" == 0)} do {
		if (_unit != player) then {
			_unit removeAction _atcn;
			waitUntil {(_unit distance _aircraft > _dist) OR (_aircraft animationPhase "ramp_top" != 0) OR (player == _unit)};
			if (player == _unit) then {
				_atcn = _unit addaction ['<t color="#fadfbe">' + "-HALO Setup-" + '</t>',(JTK_HALO_Path+"dialog\Open_dlg.sqf"),["MAIN",_aircraft],4,true,true,"",""];	
			};
		};
		sleep 0.25;
	};
	_unit removeAction _atcn;
};
	
	