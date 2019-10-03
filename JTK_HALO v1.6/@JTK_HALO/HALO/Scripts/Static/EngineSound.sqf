//by Kempco
	
_unit = _this select 0;
_static = _this select 1;

WaitUntil {_unit distance _static < 300};
While {true} do {
	[_unit,_static] spawn {
		_unit = _this select 0;
		_static = _this select 1;
		sleep 4.25;
		While {_unit distance _static <= 300} do {
			_static say3D "int_engine_low";
			sleep 8.5;
			if (_unit Distance _static > 300) exitWith {};
		};
	};
	_static say3D "int_engine_low";
	Sleep 8.5; 
	if (_unit Distance _static > 300) exitWith {};
};


