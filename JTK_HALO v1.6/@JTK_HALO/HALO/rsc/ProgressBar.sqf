//By Kempco

_this spawn {
	disableSerialization;
	_delay = _this select 0;
	_txt = _this select 1;
	
	JTK_ProgressBar_Layer cutRsc ['JTK_PROGRESS_BAR_RSC','Plain'];
	_display = uiNamespace getVariable "JTK_ProgressBar";

	_ProgressBar = _display displayCtrl 2;	
	_w_max = (ctrlPosition (_display displayCtrl 1)) select 2;
	_txt = format["<t shadow='2'><t color='#E9DFA0'><t size='1.65'><t valign='middle'><t align='center'>%1</t>",_txt];
	(_display displayCtrl 3) ctrlSetStructuredText parseText _txt;
	_inc = (_w_max/_delay)/40;
	_w = 0.0001;
	While {_w < _w_max} do {
		sleep 0.01;
		_w = _w + _inc;
		_ProgressBar ctrlSetPosition [ctrlPosition _ProgressBar select 0,ctrlPosition _ProgressBar select 1,_w,ctrlPosition _ProgressBar select 3];
		_ProgressBar ctrlCommit 0;
		_w = (ctrlPosition _ProgressBar) select 2; 
	};
	sleep 0.7;
	JTK_ProgressBar_Layer cutRsc ["default", "Plain"];
};
	 

