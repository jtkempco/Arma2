//By Kempco

_this spawn {
	disableSerialization;
	_static = _this select 0;
	
	JTK_ClientSyncStatus_Layer cutRsc ['JTK_CLIENTSYNC_PROGRESS_BAR_RSC','Plain'];
	_display = uiNamespace getVariable "JTK_ClientSyncStatus";

	_SyncBar = _display displayCtrl 1;	
	_w_max = (ctrlPosition (_display displayCtrl 0)) select 2;
	_txt = "<t shadow='2'><t color='#ffffff'><t size='1.65'><t valign='middle'><t align='center'>Syncing Clients...</t>";
	(_display displayCtrl 2) ctrlSetStructuredText parseText _txt;
	
	_total_Players = count((_static getVariable "JTK_Player_Status") select 1);
	
	_inc = (_w_max/_total_Players);
	
	_limit_t = time + 30;
		
	_w = 0.0001;
	While {_w < _w_max} do {
		_Players_Ready = count((_static getVariable "JTK_Player_Status") select 0);
		_w = _Players_Ready * _inc;
		_SyncBar ctrlSetPosition [ctrlPosition _SyncBar select 0,ctrlPosition _SyncBar select 1,_w,ctrlPosition _SyncBar select 3];
		_SyncBar ctrlCommit 0;
		_w = (ctrlPosition _SyncBar) select 2;
		sleep 1;
		if (time > _limit_t) exitWith {
			_txt = "<t shadow='2'><t color='#ffffff'><t size='1.65'><t valign='middle'><t align='center'>TIMED OUT</t>";
			(_display displayCtrl 2) ctrlSetStructuredText parseText _txt;
			sleep 1.5;
		};
		 
	};
	if (_w >= _w_max) then {
		_txt = "<t shadow='2'><t color='#ffffff'><t size='1.65'><t valign='middle'><t align='center'>Clients Synced</t>";
		(_display displayCtrl 2) ctrlSetStructuredText parseText _txt;
		sleep 1.5;
	};
		
		
	sleep 0.7;
	JTK_ClientSyncStatus_Layer cutRsc ["default", "Plain"];
};
	 


