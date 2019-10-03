//by Kempco
//Common Event Handlers	
JTK_Aircraft_GetOut_EH = {
 	_aircraft = (_this select 0);
 	_unit = (_this select 2);

	if (isplayer _unit) then {
 		_BoardedatRear = _unit getVariable 'JTK_Boarded_At_Rear';
 		if (_BoardedatRear) then {
 			_dir = direction _C130;
 			_offset = if ((typeof _aircraft == "C130J") OR (typeof _aircraft == "C130J_US_EP1")) then {[0,-11,-5]}else{[0,-8,-5]};
 
 			_pos = _aircraft modelToWorld _offset;
 			_dir = (_dir - 180);
 
	 		_unit setdir _dir;
 	 		_unit setPos _pos;
 			_unit setVariable ['JTK_Boarded_At_Rear',false];
 		};
	};
};

JTK_Aircraft_GetIn_EH = {
 	_aircraft = _this select 0;
 	_position = _this select 1;
 	_unit = _this select 2;
 		
	_Eject = [_unit,_position] call JTK_EjectUnitCheck;
	WaitUntil {!isNil "_Eject"};
	if (_Eject) then {
		_unit action ['GetOut',_aircraft];
		if (isplayer (leader group _unit)) then {
			[leader group _unit] call JTK_AI_MP_Eject_Hint;
			JTK_Call_PVEH = [[leader group _unit],JTK_AI_MP_Eject_Hint]; publicVariable "JTK_Call_PVEH"; 
		};
	};
};

JTK_Zodiac_GetIn_EH = {
 	_veh 		= _this select 0;
 	_position 	= _this select 1;
 	_unit 	= _this select 2;
 	_var 		= _unit getVariable "JTK_Save_Gear";
 	
 	if ((surfaceIsWater (position _unit)) AND ((animationState _unit) == "para_pilot")) exitWith {};
 
	if (_position != "driver") then {
		_veh lockDriver true;
		[_veh,_unit] spawn {WaitUntil {!((_this select 1) in (_this select 0)) OR (!alive (_this select 1))};(_this select 0) lockDriver false};
	};	
 	
 	if (!isNil "_var") then {
		if (_position == "driver") then {
			_veh spawn {
				_pos = (_this getVariable "JTK_Veh_Info") select 0; 
				_dir = (_this getVariable "JTK_Veh_Info") select 1; 
				While {true} do {
					_this setDir _dir;
					_this setPosASL _pos;
					sleep 0.1;
					if (!(isNull driver _this) AND (_this distance _pos <= 50)) exitWith {};
				};
			};
		};
		
	 	titleText ["Unpacking Gear\nStandby...", "BLACK FADED"];
		_unit action ["Eject",_veh];
	 	WaitUntil {_unit == vehicle _unit};
 		_backUp = getPosASL _unit;
		 _unit setPos (getMarkerPos (format["Respawn_%1",side _unit]));
		While {true} do {
			_var = _unit getVariable "JTK_Save_Gear";
			if (isNil "_var") exitWith {};
			sleep 0.01;
		};
		for "_i" from 1 to 50 do {
			if (_unit in _veh) exitWith {};
			if (_position == "driver") then {_unit moveInDriver _veh}else{_unit moveInCargo _veh};
		};
		if !(_unit in _veh) then {_unit setPosASL _backup};
		titleFadeOut 2.5;
	};
};

JTK_HALO_Common_EHs_Compiled = true;


