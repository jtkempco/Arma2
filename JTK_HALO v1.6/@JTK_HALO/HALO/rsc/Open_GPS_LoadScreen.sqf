//by Kempco

_this spawn {
	_unit = _this select 0;
	_static = _this select 1;

	0.35 spawn{sleep _this;playsound "JTK_GPS_On_Loud"};

	disableSerialization;
	JTK_HALO_GPS_Load_Layer cutRsc ['JTK_HALO_GPS_LOAD_SCREEN_RSC', 'Plain'];
	_display = uiNamespace getVariable "JTK_HALO_GPS_Loadscreen";
	WaitUntil {!isNil "_display"};

	_Load_Screen = _display displayCtrl 0;
	_status_frame = _display displayCtrl 4;
	_status_bar = _display displayCtrl 5;
	_sync = _display displayCtrl 7;
	_delay = 1.5;
	_inc_t = 0.05;

	_cntrl_array = [
		_display displayCtrl 2,
		_display displayCtrl 3,
		_display displayCtrl 4,
		_display displayCtrl 5,
		_display displayCtrl 6
		
	];

	if (isMultiplayer) then {
		{_x ctrlShow false}foreach _cntrl_array;
		_t = time + 20;
		While {true} do {
			_Players_Ready = (_static getVariable "JTK_Player_Status") select 0;
			_HALO_Units = (_static getVariable "JTK_Player_Status") select 1;
			_txt = "";
			_str = "<t size='1.75'><t align='center'><t color='#191919'>Syncing with clients...</t><br/>";
			_txt = _txt + _str;
			_str = format["<t size='1.75'><t align='center'><t color='#191919'>Players Ready: %1/%2</t><br/>",count _Players_Ready,count _HALO_Units];
			_txt = _txt + _str;
			
			if (time > _t) exitWith {
				_txt = "<t size='2.0'><t align='center'><t color='#3C0000'>TIMED OUT</t><br/>";
				_sync ctrlSetStructuredText parseText _txt;
				sleep 1.5;
			};
			_sync ctrlSetStructuredText parseText _txt;
			if (count _Players_Ready == count _HALO_Units) exitwith {//Synced
				sleep 2;
				_txt = "<t size='2.0'><t align='center'><t color='#191919'>COMPLETE</t><br/>";
				_sync ctrlSetStructuredText parseText _txt;
				sleep 1.5;
			};
		};
		_sync ctrlShow false;
		sleep 0.1;
	}else{
		_width = (ctrlPosition _status_frame) select 2;
		_delay = _delay/_inc_t;
		_inc = _width/_delay;
		_t = time + _delay;
		While {_t > time} do {
			_status = ctrlPosition _status_bar select 2;
			_status = _status + _inc;
			if (_status > _width) exitWith {
				_status_bar ctrlSetPosition [ctrlPosition _status_bar select 0,ctrlPosition _status_bar select 1,_width,ctrlPosition _status_bar select 3];
				_status_bar ctrlCommit _inc_t;
			}; 
			_status_bar ctrlSetPosition [ctrlPosition _status_bar select 0,ctrlPosition _status_bar select 1,_status,ctrlPosition _status_bar select 3];
			_status_bar ctrlCommit _inc_t;
			WaitUntil {ctrlCommitted _status_bar}; 
		};
		{_x ctrlShow false}foreach _cntrl_array;
		sleep 0.1;
	};

	_fade = 1;
	_fade_delay = 3.5;
	_fade_inc = 0.05;
	_fade_delay = _fade_delay/_fade_inc;

	_t = time + _fade_delay;
	While {_t > time} do {
		_fade = _fade - 0.05;
		_Notes_hint ctrlsetTextColor [0.075,0.075,0.075,_fade];  
		_Load_Screen ctrlsetBackgroundColor [0.408333,0.447222,0.316667,_fade];
		sleep _fade_inc;
		if (_fade <= 0) exitWith {};
	}; 

	sleep 0.1;
	JTK_HALO_GPS_Load_Layer cutRsc ['Default', 'Plain'];
};


