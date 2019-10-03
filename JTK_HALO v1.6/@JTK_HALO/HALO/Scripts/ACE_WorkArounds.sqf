//by Kempco
/*
	Workarounds for Using JTK Freefall with ACE. 
*/

JTK_ACE_OverRide = {
	_unit = _this select 0;
	if (typeName(_unit getVariable "JTK_HALO_Chute_Status") != "BOOL") then {
		if (_debug) then {player globalChat "started"};
		
		_unit spawn {
			_debug = false;
			[_this] spawn JTK_ACE_RemoveChute;
			if (_debug) then {_this globalChat "Chute Removal Done"};
			
			WaitUntil {(!alive _this) OR ((_this getVariable "JTK_HALO_Status") ==  "FREEFALL")};
			if (_debug) then {_this globalChat "CHUTE CUT"};
			_chuteStatus = _this getVariable "JTK_HALO_Chute_Status";
			switch (_chuteStatus) do {
				case "Primary":{_this setVariable ["JTK_HALO_Chute_Status","Reserve"]};
				case "Reserve":{_this setVariable ["JTK_HALO_Chute_Status",false]};
			};
			if (typeName(_this getVariable "JTK_HALO_Chute_Status") != "BOOL") then {
				_this addWeapon JTK_ACE_HALO_CHUTE;
				[_this] call JTK_HALO_Freefall;
			}else{
				if (_this hasWeapon JTK_ACE_HALO_CHUTE) then {_this removeWeapon JTK_ACE_HALO_CHUTE};
			};	
		};
	};
};


JTK_ACE_RemoveChute = {	
	_unit = _this select 0;
	_chute_removed = false;
	_unit removeWeapon JTK_ACE_HALO_CHUTE;
	WaitUntil {!(_unit hasWeapon JTK_ACE_HALO_CHUTE)};
	for "_i" from 1 to 10 do {
		if (_unit hasWeapon "ACE_ParachutePack") then {
			_unit removeWeapon "ACE_ParachutePack";
			_chute_removed = true;
		};
		if (_chute_removed) exitWith {};
		sleep 1;
	};
};


JTK_ACE_WorkArounds_Done = true;