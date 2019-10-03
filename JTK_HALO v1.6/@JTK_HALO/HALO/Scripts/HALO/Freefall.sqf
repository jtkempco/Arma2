//by Kempco
/*
	Script runs while player is in freefall
*/
_this spawn {
	_unit = _this select 0;		
	private ["_array","_DeployChute_Actn","_inc"];
	_speed = speed _unit;
	_dir = direction _unit;
	
	[_unit] call JTK_HALO_CloudEffects; 

	JTK_ROD_Inc = 0;
	_min_speed = -10;
	_max_speed = 50;
	_ROD_min = 60;
	_ROD_max = 75;
	_dir_inc = if (isMultiplayer) then {1.25}else{0.85}; 
	_spd_inc_FWD = 0.05;
	_spd_inc_BCK = 0.1;
	JTK_Speed_Set = if (isMultiplayer) then {false}else{true};

	_unit setVariable ["JTK_ROD_Set",false];
	_unit switchmove "HaloFreeFall_non";
	if (isMultiplayer) then {JTK_Call_PVEH = [_unit,(compile "_this switchmove 'HaloFreeFall_non'")];publicVariable "JTK_Call_PVEH"};//Braodcast globally
	
	//Start Freefall Sound
	 call JTK_HALO_SoundLoop_1;
	_DeployChute_Actn = _unit addaction [format['<t color="#ff0000">' + "-Deploy Chute (%1)-" + '</t>',(_unit getVariable 'JTK_HALO_Chute_Status')],(JTK_HALO_Path+"Scripts\HALO\Actn_Deploy_Chute.sqf"),[],99,true,true,"",""];	
	
	_keydown_EH = (finddisplay 46) displayaddeventhandler ["keyDown","
		_button = _this select 1;
		_ROD = abs(velocity player select 2);
		_ROD_min = 60;
		_ROD_max = 75;
		if (player getVariable 'JTK_ROD_Set') then {
			if (_button in actionKeys 'HeliUp') exitWith {JTK_ROD_Inc = if (_ROD > _ROD_min) then{-0.15}else{0}};
			if (_button in actionKeys 'HeliDown') exitWith {JTK_ROD_Inc = if (_ROD < _ROD_max) then{0.05}else{0}};
		};
	"];
	_keyUp_EH = (finddisplay 46) displayaddeventhandler ["keyUp","
		_button = _this select 1;
		if (player getVariable 'JTK_ROD_Set') then {
			if ((_button in actionKeys 'HeliUp') AND (JTK_ROD_Inc < 0)) exitWith {JTK_ROD_Inc = 0};
			if ((_button in actionKeys 'HeliDown') AND (JTK_ROD_Inc > 0)) exitWith {JTK_ROD_Inc = 0};
		};
	"];
	_EHs = [["keyDown",_keydown_EH],["keyUp",_keyUp_EH]];
	_form_limit = 10;
	_form_inc = 0;
	_form_speed = 0;
	_vel = velocity _unit;
	
	_t = time + 3;
	_t spawn {WaitUntil {time > _this};JTK_Speed_Set = true};
	
	While {(_unit == vehicle _unit) AND (alive _unit)} do {
		
		_ROD = abs(velocity _unit select 2) + JTK_ROD_Inc; 
		if ((_ROD > _ROD_min) AND !(_unit getVariable "JTK_ROD_Set")) then {_unit setVariable ["JTK_ROD_Set",true]}; 
		
		if (inputAction "moveForward" == 1) then {
			_speed = _speed + _spd_inc_FWD;
			_anim = "_F";
			if ((inputAction "turnLeft" == 0) AND (inputAction "turnRight" == 0) OR (inputAction "turnLeft" == 1) AND (inputAction "turnRight" == 1)) exitWith {_array = [_speed,_anim,0]};
			if ((inputAction "turnLeft" == 1) AND (inputAction "turnRight" == 0)) exitWith {_array = [_speed,(_anim + "L"),-1]};
			if ((inputAction "turnLeft" == 0) AND (inputAction "turnRight" == 1)) exitWith {_array = [_speed,(_anim + "R"),1]};
		};
		if (inputAction "moveBack" == 1) then {
			_speed = _speed - _spd_inc_BCK;
			_anim = "_B";
			if ((inputAction "turnLeft" == 0) AND (inputAction "turnRight" == 0) OR (inputAction "turnLeft" == 1) AND (inputAction "turnRight" == 1)) exitWith {_array = [_speed,_anim,0]};
			if ((inputAction "turnLeft" == 1) AND (inputAction "turnRight" == 0)) exitWith {_array = [_speed,(_anim + "L"),-1]};
			if ((inputAction "turnLeft" == 0) AND (inputAction "turnRight" == 1)) exitWith {_array = [_speed,(_anim + "R"),1]};
		};
		if ((inputAction "moveBack" == 0) AND (inputAction "moveForward" == 0)) then {
			_speed = if ((isMultiplayer) AND (_speed > 0) AND ((random 1) >= 0.65) AND (JTK_Speed_Set)) then {_speed - (_spd_inc_BCK/4)}else{_speed};
			if ((inputAction "turnLeft" == 0) AND (inputAction "turnRight" == 0) OR (inputAction "turnLeft" == 1) AND (inputAction "turnRight" == 1)) exitWith {_array = [_speed,"_non",0]};
			if ((inputAction "turnLeft" == 1) AND (inputAction "turnRight" == 0)) exitWith {_array = [_speed,"_L",-1]};	
			if ((inputAction "turnLeft" == 0) AND (inputAction "turnRight" == 1)) exitWith {_array = [_speed,"_R",1]};
		};
		
		_speed = if ((isMultiplayer) AND (!JTK_Speed_Set) AND (_speed > (_max_speed/4))) then {_speed - (_spd_inc_BCK*10)}else{_array select 0};
		
		if (_speed > _max_speed AND JTK_Speed_Set) then {_speed = _max_speed};
		if (_speed < _min_speed) then {_speed = _min_speed};
		
		if (_unit getVariable "JTK_ROD_Set") then {
			if (_ROD > _ROD_max) then {_ROD = _ROD_max};
			if (_ROD < _ROD_min) then {_ROD = _ROD_min};
		};
		_unit playmoveNow "HaloFreeFall" + (_array select 1);
		_dir = (direction _unit) + (_dir_inc*(_array select 2));
		if ((direction _unit) != _dir) then {_unit setdir _dir};//Only set dir if directionis changed. Should help will "stutterering" during freefall.
		_unit setVelocity [sin(_dir)*_speed,cos(_dir)*_speed,-_ROD];
		if ((_unit != vehicle _unit) OR (!alive _unit)) exitWith {};
		sleep 0.01;
	};
	_unit removeAction _DeployChute_Actn;
	for "_i" from 0 to (count _EHs - 1) do {(finddisplay 46) DisplayRemoveEventHandler (_EHs select _i)};
	if (JTK_ACE_Detected) then {[_unit] call JTK_ACE_OverRide}; 
	JTK_ROD_Inc = nil;
};
