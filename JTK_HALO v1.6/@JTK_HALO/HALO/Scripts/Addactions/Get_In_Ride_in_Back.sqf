//by Kempco
_unit 	= _this select 0;
_aircraft 	= _this select 1;
_BoardPos	= _this select 2;
_vehDrop	= _this select 3;
_isC130 	= _aircraft getVariable "is a C130";
_limit  	= if (_vehDrop) then {6}else{if (_isC130) then {15}else{10}};
_name 	= getText(configFile >> "cfgVehicles" >> (typeof _aircraft) >> "displayname");

_unit setVariable ['JTK_Boarded_At_Rear',true];
if ((!local _unit) OR (_unit in _aircraft) OR (count crew _aircraft >= _limit)) exitWith {
	if (count crew _aircraft >= _limit) then {
		_txt = format ["Negative: %1 is Full",_name]; 
		(driver _aircraft) sidechat format ["%1",_txt];
	};
};
_actn = _unit addaction [format["Get In %1 Ride in Back",_name],(JTK_HALO_Path+"Scripts\Actions\GetIn.sqf"),[_aircraft]];		
waitUntil {(_unit distance _BoardPos  > 4.25) OR (_unit in _aircraft) OR (count crew _aircraft >= _limit)};
if ((_unit distance _BoardPos  > 4.25) AND !(_unit in _aircraft)) then {_unit setVariable ['JTK_Boarded_At_Rear',false]};
_unit removeAction _Actn;

