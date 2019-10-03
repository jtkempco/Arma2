//by Kempco

_aircraft = _this select 0;
_unit = _this select 1;
_commandUnit = _aircraft getVariable "JTK_HALO_Command_Unit";

if (isNil "_commandUnit") then {
	_aircraft setVariable ["JTK_HALO_Command_Unit",_unit,true];
	_unit setVariable ["JTK_HALO_Command_Unit",true,true]; 
	_txt = format ["BE ADVISED: %1 IS THE NEW HALO COMMAND.",_unit];
	[playerSide,"HQ"] commandChat _txt;
	JTK_Call_PVEH = [_txt,compile "[playerSide,'HQ'] commandChat _this"];
	publicVariable "JTK_Call_PVEH";
};

	
	