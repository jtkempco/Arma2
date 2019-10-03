//by Kempco
			
_this spawn {
	disableSerialization;
	_unit = _this select 0;
	
	JTK_HALO_Action_Layer cutRsc ['JTK_HALO_ACTION_WHEEL_RSC', 'Plain'];
	_display = uiNamespace getVariable "JTK_HALO_Action_Wheel";
	WaitUntil {!isNil "_display"};
	_ctrl_0 = _display displayCtrl 0; 
	_ctrl_t0 = "<t shadow='2'><t color='#FAB909'><t size='1.75'><t valign='middle'>-GPS: Toggle Display Mode-</t>";
	
	if ((_unit getVariable "HALO_GPS_Status") == "ON") then {
		_ctrl_0 ctrlSetStructuredText parseText _ctrl_t0;
		_ctrl_0 ctrlSetBackgroundColor [0.322,0.667,0.118,0.475];
		_ctrl_0 ctrlShow true;
	};
	
	While {(alive _unit) AND ((_unit getVariable "JTK_HALO_Status") != "DONE") AND ((_unit getVariable "JTK_HALO_Status") != "SWIMMING")} do {
		if (_unit != vehicle _unit) then {
			_EH_Button_0 = (finddisplay 46) displayaddeventhandler ["MouseButtonDown","_this call JTK_HALO_ActionWheel_MouseButton"];
			_EH_Wheel_0 = (finddisplay 46) displayaddeventhandler ["mousezchanged","_this call JTK_HALO_ActionWheel_MouseWheel"]; 
			[["MouseButtonDown",_EH_Button_0],["mousezchanged",_EH_Wheel_0]] spawn {
				WaitUntil {(vehicle player == player)};
				(finddisplay 46) displayremoveeventhandler (_this select 0);
				(finddisplay 46) displayremoveeventhandler (_this select 1);
			};
			While {_unit != vehicle _unit} do {
				if((_unit getVariable "HALO_GPS_Status") == "OFF") then{
					_ctrl_0 ctrlShow false;
					While {(_unit != vehicle _unit) AND ((_unit getVariable "HALO_GPS_Status") == "OFF")} do {sleep 0.1};
				};
				if((_unit getVariable "HALO_GPS_Status") == "ON") then{
					_ctrl_0 ctrlShow true;
					While {(_unit != vehicle _unit) AND ((_unit getVariable "HALO_GPS_Status") == "ON")} do {sleep 0.1};
				};
				if ((alive _unit) OR (getPosATL _unit select 2 <= 50) AND (_unit == vehicle _unit)) exitWith {};
			};
		};
		sleep 0.01;
	};
	JTK_HALO_Action_Layer cutRsc ['default', 'Plain'];	
};





