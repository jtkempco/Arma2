//by Kempco	
disableSerialization;
_display = _this select 0;
_mode = _this select 1;

_gray_BG = [0.05,0.05,0.05,0.7];
_gray_txt = [0.075,0.075,0.075,1];
_olive = [0.408333,0.447222,0.316667,1];
_NONE = [0,0,0,0];
_map_cntrl = _display displayCtrl 14;
_map_initial = (player getVariable "JTK_GPS_Map_Sizes") select 0;
_map_new = (player getVariable "JTK_GPS_Map_Sizes") select 1;

if (count _this == 2) then {
	if (_mode == "MAP") then {
	
		(_display displayCtrl 4)ctrlSetTextColor _gray_txt;
		(_display displayCtrl 4)ctrlSetbackgroundColor _olive;
		(_display displayCtrl 6) ctrlSetTextColor _gray_BG;

		(_display displayCtrl 3) ctrlSetTextColor _olive;
		(_display displayCtrl 3) ctrlSetbackgroundColor _gray_BG;
		(_display displayCtrl 5) ctrlSetTextColor _olive;
		sleep 0.5;
		_map_cntrl ctrlShow true;
		sleep 0.3;
		_map_cntrl ctrlSetPosition _map_initial;
		_map_cntrl ctrlCommit 0.35;
		WaitUntil {ctrlCommitted _map_cntrl};
		
	}else{
		_map_cntrl ctrlSetPosition _map_new;
		_map_cntrl ctrlCommit 0.35;
		WaitUntil {ctrlCommitted _map_cntrl};

		sleep 0.5;
		
		(_display displayCtrl 3) ctrlSetTextColor _gray_txt;
		(_display displayCtrl 3) ctrlSetbackgroundColor _olive;
		(_display displayCtrl 5) ctrlSetTextColor _gray_BG;
		
		(_display displayCtrl 4) ctrlSetTextColor _olive;
		(_display displayCtrl 4) ctrlSetbackgroundColor _gray_BG;
		(_display displayCtrl 6) ctrlSetTextColor _olive;
		sleep 0.3;
		
		_map_cntrl ctrlShow false;
	};
};


	
	
	





