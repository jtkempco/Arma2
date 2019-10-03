//by Kempco
/*
	Takeoff Action is added only to the player who setup the Insertion. 
	If that unit DCs before Takeoff, then delegate action to all units 
	that are in or enter the aircraft.
*/

_unit 	= _this select 0;
_aircraft	= _this select 1;
_isC130 	= _aircraft getVariable "is a C130";
_actn_txt = if (_isC130) then {"-Clear for Takeoff-"}else{"-Clear for Dustoff-"};


private ["_Takeoff_Action","_TakeCommand_Action"];

if (!(_unit in _aircraft) OR (!local _unit) OR (!isPlayer _unit)) exitWith {};

if (isMultiplayer) then {
	if (JTK_HALO_ByPass) then {
		if (JTK_ACE_Detected) then {titleText ["Action Wheel Updated", "PLAIN"];3 spawn {sleep _this; titleFadeOut 5}};
		if (_unit getVariable "JTK_HALO_Setup_Access") then {
			_Takeoff_Action = _aircraft addaction ['<t color="#fadfbe">' + _actn_txt + '</t>',(JTK_HALO_Path+"scripts\Actions\TakeOff.sqf"),[],4,true,true,"","(player in _target)"];
			WaitUntil {!(_unit in _aircraft) OR (_aircraft getVariable "JTK_HALO_Takeoff")};
			_aircraft removeAction _Takeoff_Action;
		};
	}else{
		_comandUnit = _aircraft getVariable "JTK_HALO_Command_Unit";
		if (_unit == _comandUnit) then {
			if (JTK_ACE_Detected) then {titleText ["Action Wheel Updated", "PLAIN"];3 spawn {sleep _this; titleFadeOut 5}};
			_Takeoff_Action = _aircraft addaction ['<t color="#fadfbe">' + _actn_txt + '</t>',(JTK_HALO_Path+"scripts\Actions\TakeOff.sqf"),[],4,true,true,"","((player == (_target getVariable 'JTK_HALO_Command_Unit')) AND (player in _target))"];
			While {(!isNil "_comandUnit") AND (_unit in _aircraft) AND !(_aircraft getVariable "JTK_HALO_Takeoff")} do {
				sleep 1;
				_comandUnit = _aircraft getVariable "JTK_HALO_Command_Unit";
			};
		}else{
			While {(_unit in _aircraft) AND !(_aircraft getVariable "JTK_HALO_Takeoff") AND (!isNil "_comandUnit")} do {
				sleep 1;
				_comandUnit = _aircraft getVariable "JTK_HALO_Command_Unit";
			};
			if (isNil "_comandUnit") then {
				titleText ["BE ADVISED: HALO Leader Undefined\n(Action Wheel Updated)", "PLAIN"];
				3 spawn {sleep _this; titleFadeOut 5};
				_aircraft removeAction _Takeoff_Action;
				_TakeCommand_Action = _aircraft addaction ['<t color="#fadfbe">' + "-Take Command-" + '</t>',(JTK_HALO_Path+"scripts\Actions\TakeCommand.sqf"),[_aircraft],4,true,true,"",""];	
				While {(_unit in _aircraft) AND !(_aircraft getVariable "JTK_HALO_Takeoff") AND (isNil "_comandUnit")} do {
					sleep 1;
					_comandUnit = _aircraft getVariable "JTK_HALO_Command_Unit";
				};
				_aircraft removeAction _TakeCommand_Action;
				if (_unit == (_aircraft getVariable "JTK_HALO_Command_Unit")) then {
					_Takeoff_Action = _aircraft addaction ['<t color="#fadfbe">' + _actn_txt + '</t>',(JTK_HALO_Path+"scripts\Actions\TakeOff.sqf"),[],4,true,true,"","((player == (_target getVariable 'JTK_HALO_Command_Unit')) AND (player in _target))"];
				};
			};
		};
		waitUntil {!(_unit in _aircraft) OR (_aircraft getVariable "JTK_HALO_Takeoff")};
		_aircraft removeAction _Takeoff_Action;
		_aircraft removeAction _TakeCommand_Action;
		titleFadeOut 0;
	};
}else{
	if ((!isplayer _unit) OR !(_unit in _aircraft) OR (_unit != leader group _unit)) exitWith {};
	_static = _aircraft getVariable "JTK_HALO_STATIC";
	if (!isNil "JTK_Takeoff_Action") then {_aircraft removeAction JTK_Takeoff_Action};
	JTK_Takeoff_Action = _aircraft addaction ['<t color="#fadfbe">' + _actn_txt + '</t>',(JTK_HALO_Path+"scripts\Actions\TakeOff.sqf"),[],4,true,true,"","(player in _target)"];
	While {!(_aircraft getVariable "JTK_HALO_Takeoff") AND !(_aircraft getVariable "JTK_HALO_Cancelled") AND (player in _aircraft)} do {
		if (_unit != player) then {
			_aircraft removeAction JTK_Takeoff_Action;
			waitUntil {(_aircraft getVariable "JTK_HALO_Takeoff") OR (_aircraft getVariable "JTK_HALO_Cancelled") OR (player == _unit) OR !(player in _aircraft)};
			if ((_aircraft getVariable "JTK_HALO_Cancelled") OR (_aircraft getVariable "JTK_HALO_Cancelled") OR !(player in _aircraft)) exitWith {};
			if (player == _unit) then {
				JTK_Takeoff_Action = _aircraft addaction ['<t color="#fadfbe">' + _actn_txt + '</t>',(JTK_HALO_Path+"scripts\Actions\TakeOff.sqf"),[],4,true,true,"","(player in _target)"];
			};
		};
		sleep 1;
	};
};

	

