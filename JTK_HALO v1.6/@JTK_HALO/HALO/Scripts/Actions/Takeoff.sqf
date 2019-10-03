//by Kempco
_aircraft = _this select 0;
_unit = _this select 1;
_actn_id = _this select 2;

_aircraft removeAction _actn_id;
_commandUnit = _aircraft getVariable "JTK_HALO_Command_Unit";
if (isNil "_commandUnit") then {
	_aircraft setVariable ["JTK_HALO_Command_Unit",_unit,true];
	_unit setVariable ["JTK_HALO_Command_Unit",_aircraft,true];
};
_aircraft setVariable ["JTK_HALO_Takeoff",true,true];

	

