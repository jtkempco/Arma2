//by Kempco

_unit 		= _this select 0;
_aircraft 		= _this select 1;
_BoardPos 		= _aircraft modelToWorld [0,-5,-5];
_loopInPorgress = _unit getVariable "ResetAddaction_HALO";

//Condition added that aborts Cancel action if JTK_ByPassSetUp is set to true in the init conditions.
if (JTK_HALO_ByPass) exitWith {};

if ((!local _unit) OR (_unit in _aircraft) OR (_unit != (_aircraft getVariable "JTK_HALO_Command_Unit")) OR (!isNil "_loopInPorgress") OR (_aircraft getVariable "JTK_HALO_Cancelled")) exitWith {};

if (_unit getVariable "ResetAddaction_HALO") exitWith {};//Fixed issue of spamming action

_unit setVariable ["ResetAddaction_HALO",true];	

_actn = _unit addaction ['<t color="#ff0000">' + "-CANCEL HALO-" + '</t>',(JTK_HALO_Path+"dialog\Open_dlg.sqf"),["RESET",_aircraft],4,true,true,"",""];

While {!(_unit in _aircraft) AND !(_aircraft getVariable "JTK_HALO_Takeoff") AND (_unit distance _aircraft <= 25) AND !(_aircraft getVariable "JTK_HALO_Cancelled")} do {
	if (_unit distance _BoardPos <= 4.25) then {
		_unit removeAction _actn;
		While {!(_unit in _aircraft) AND !(_aircraft getVariable "JTK_HALO_Takeoff") AND (_unit distance _aircraft <= 25) AND (_unit distance _BoardPos <= 4.25) AND !(_aircraft getVariable "JTK_HALO_Cancelled")} do {sleep 0.01};
	};
	if (_unit distance _BoardPos > 4.25) then {
		_unit removeAction _actn;
		_actn = _unit addaction ['<t color="#ff0000">' + "-CANCEL HALO-" + '</t>',(JTK_HALO_Path+"dialog\Open_dlg.sqf"),["RESET",_aircraft],4,true,true,"",""];
		While {!(_unit in _aircraft) AND !(_aircraft getVariable "JTK_HALO_Takeoff") AND (_unit distance _aircraft <= 25) AND (_unit distance _BoardPos > 4.25) AND !(_aircraft getVariable "JTK_HALO_Cancelled")} do {sleep 0.01};
	};
};
_unit setVariable ["ResetAddaction_HALO",nil];
_unit removeAction _actn;




