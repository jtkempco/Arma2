//by Kempco
//Did it this way because the AI team Icons were still showing orange after was successfully added back
	
_unit = _this select 0;
_rp_vars = _unit getVariable "JTK_HALO_AI_RP_Vars";
_domovepos = _rp_vars select 0;
_dowatchpos = _rp_vars select 1;
_identities = if (JTK_AI_CanChangeID) then {(_unit getVariable "JTK_Identities")}else{nil};

private ["_gear"];

_index = ((player getVariable "JTK_HALO_AI_Gear") select 0) find _unit;
if (_index != -1) then {
	_gear = ((player getVariable "JTK_HALO_AI_Gear") select 1) select _index;
}else{_gear = nil};
   
_hasname = false;
_unitname = vehicleVarName _unit;
if (isNil _unitname) then {_hasname = false}else{_hasname = true};

_unitPos = unitPos _unit;
_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;

_new_unit = (group player) createUnit [_type,[0,0,0],[],_dir,"NONE"];
if !(surfaceIsWater (position _new_unit)) then {_new_unit switchMove "amovPpnemstpsnonwnondnon"};
_new_unit setDir _dir;
_new_unit setPosASL _position;
_new_unit setDir _dir;
if (!isNil "_identities") then {
	_new_unit setVariable ["JTK_Identities",_identities];
	_new_unit setIdentity (_identities select 0);
};

	
deletevehicle _unit;
WaitUntil {isNull _unit};

if (_hasname) then {
	_new_unit setVehicleInit format ["%1 = this; this setVehicleVarName ""%1""",_unitname];
	processInitCommands;
};
removeAllWeapons _new_unit;
if !(surfaceIsWater (position _new_unit)) then {[_new_unit,_gear] spawn JTK_AI_RestoreGear};
_new_unit stop true;
_new_unit setUnitPos "middle";
sleep 3;
if !(surfaceIsWater (position _new_unit)) then {
	_new_unit stop false;
	_new_unit setUnitPos "Up";
	_new_unit domove _domovepos;
	While {(alive _new_unit) AND (currentCommand _new_unit == "MOVE")} do {sleep 2};
	Waituntil {currentCommand _new_unit != "MOVE"};
	if ((alive _new_unit) AND (_new_unit distance  _domovepos <= 10)) then {
		_new_unit dowatch _dowatchpos;
		_new_unit setUnitPos "middle";
		While {(alive _new_unit) AND (currentCommand _new_unit != "MOVE") AND (_new_unit distance _domovepos <= 5)} do {sleep 2};
		_new_unit setUnitPos "Auto";
		_new_unit dowatch objNull;
	};
}else{
	_veh = player getVariable "JTK_HALO_Vehicle";
	if (!isNil "_veh") then {
		WaitUntil {getPosASL _veh select 2 < 1};
		_new_unit stop false;
		_new_unit domove (position _veh);
		WaitUntil {(!alive _new_unit) OR (_new_unit distance _veh <= 7)};
		if (!alive _new_unit) exitWith {};
		_new_unit attachTo [_veh,[0,0,2000]];
		[_new_unit,_gear] spawn JTK_AI_RestoreGear;
		_t = time + 5;
		WaitUntil {(primaryWeapon _new_unit != "") OR (time > _t)};
		if (primaryWeapon _new_unit != "") then {
			_new_unit selectWeapon (primaryWeapon _new_unit);
			WaitUntil {currentWeapon _new_unit == primaryWeapon _new_unit};
			sleep 1.75
		};
		detach _new_unit;
		_new_unit assignAsCargo _veh;
		While {!(_new_unit in _veh)} do {
			_new_unit moveInCargo _veh;
			if (_new_unit in _veh) exitWith {};
			sleep 0.01;
		};	
	};
};	



