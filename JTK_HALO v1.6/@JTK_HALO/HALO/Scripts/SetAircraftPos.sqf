//by Kempco

if (!isserver) exitWith {};

_unit 		= if (typeName(_this select 0) == "OBJECT") then {_this select 0}else{nil};
_side 		= if (isNil  "_unit") then {_this select 0}else{side _unit};
_aircraft	= _this select 1;
_DZ_pos		= _this select 2;
_aircraft_pos 	= _this select 3;
_aircraft_dir 	= _this select 4;
_m_dir 		= _this select 5;

_uid 		=  if (!isNil "_unit") then {getPlayerUID _unit};
_alt 		= _aircraft_pos select 2;
_static 	= _aircraft getVariable "JTK_HALO_STATIC";
_isC130 	= _aircraft getVariable "is a C130";

if (!isNil "_uid" AND !JTK_HALO_Bypass) then {
	_aircraft setVariable ["JTK_HALO_Command_Unit",_unit,true];
	_unit setVariable ["JTK_HALO_Command_Unit",true,true];
};

//Limit Cargo if nessccary for Veh Drops
if (count _this > 6) then {
	_type = (_this select 6) select 0;
	_cargo = (_this select 6) select 1; 
	_aircraft setVariable ["JTK_HALO_VehDrop",[_type,_cargo],true];
}else{_aircraft setVariable ["JTK_HALO_VehDrop",false,true]};

_aircraft setVariable ["JTK_HALO_Cancelled",false,true];

if (_isC130) then {
	_static setDir _aircraft_dir;
	_static setPos _aircraft_pos;
}else{
	_anchor = _static getVariable "anchor";
	_anchor setDir _aircraft_dir; 
	_anchor setPos [_aircraft_pos select 0,_aircraft_pos select 1,-25];
	_static attachTo[_anchor,[0,0,_alt + 25]];
};

//Set to 999999 so it dosnt return true WIP
if (_alt >=  JTK_Bailout_02_Altitude) then {_aircraft setVariable ["JTK_02_Required",true,true]}else{_aircraft setVariable ["JTK_02_Required",false,true]};
_aircraft setVariable ["Static_Set",true];
	
//Command Chat for Halo Command
if (isMultiplayer) then {
	if (!isNil "_unit") then {
		_a = "HALO INSERTION REGISTERED WITH COMMAND.";
		_b = format ["HALO COMMANDER =======> %1.",name _unit];
		_txt = [_a,_b];
		[_side, _txt] call JTK_HALO_InsertionSetTxt; 
		JTK_Call_PVEH = [[_side, _txt],JTK_HALO_InsertionSetTxt]; publicVariable "JTK_Call_PVEH";
	};
};
//Mark Drop Zone
if !(JTK_HALO_Capture) then {[_aircraft,_DZ_pos,_side] call JTK_MarkDropZone};



















