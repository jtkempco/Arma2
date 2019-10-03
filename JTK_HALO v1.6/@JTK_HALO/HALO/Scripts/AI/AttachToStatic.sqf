//by Kempco
	
_aircraft = _this select 0;
_static = _this select 1;
_AI_HALO_Units = _this select 2;

_array 	= [_static] call JTK_HALO_GetVarsByStaticType; 
_anim 	= _array select 0;
_dir 		= _array select 1;
_v 		= _array select 2;

_units_Ready = 0;
_total_units = count _AI_HALO_Units;
if (locked _aircraft) then {_aircraft lock false}; 
_AI_ldr = _AI_HALO_Units select 0; 

_gear_array = [];
_unit_array = [];

for "_i" from 0 to (count _AI_HALO_Units - 1) do {
	_unit = _AI_HALO_Units select _i;
	_AttachPos = JTK_AI_AttachPos_Array select _i; 
	if (!isNil "_gear") then {_gear = nil};
	[_unit] join GrpNull;
	While {_unit in _aircraft} do {
		_unit action ["eject",_aircraft];
		sleep 0.01;
	};
	_unit disableAI "MOVE";
	_unit attachto [_static,_AttachPos];
	WaitUntil {_unit distance _static < 15};
	_unit reveal _static;
	
	_helper = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
	WaitUntil{(!isNull _helper)};
	
	_helper setPos (_unit modelToWorld [0,0,0]);
	_helper setDir _dir;
	
	[_unit,_helper,_array] spawn {
		_unit = _this select 0;
		_hlpr = _this select 1;
		_anim = (_this select 2) select 0;
		_dir = (_this select 2) select 1;
		_v = (_this select 2) select 2;
		
		_hlpr setPos (_unit modelToWorld [0,0,0]);
		_unit attachTo [_hlpr,[0,0,0]];
		_hlpr setDir _dir;
		WaitUntil {animationState _unit == _anim};
		While {animationState _unit == _anim} do {
			_hlpr setVelocity _v;	
			sleep 0.01;
		};
		deleteVehicle _hlpr;
	};
	_units_Ready = _units_Ready + 1;
	player setVariable ["JTK_HALO_AI_Status",[_units_Ready,_total_units]];
	if (JTK_AI_CanChangeID) then {
		if (_aircraft getVariable "JTK_02_Required") then {
			_unit setIdentity JTK_Oxygen_Mask_ID;
		}else{_unit setIdentity ((_unit getVariable "JTK_Identities") select 1)};
	};
	//Save AI Gear
	_gear = _unit call JTK_AI_GetGear;
	WaitUntil {!isNil "_gear"};
	_unit_array = _unit_array + [_unit];
	_gear_array = _gear_array + [_gear];
	_unit spawn{sleep 3;_this disableAI "MOVE";_this enableSimulation false;sleep 1;_this enableSimulation true};
	_helper hideObject true;
};
player setVariable ["JTK_HALO_AI_Gear",[_unit_array,_gear_array]];
if !(locked _aircraft) then {_aircraft lock true};



