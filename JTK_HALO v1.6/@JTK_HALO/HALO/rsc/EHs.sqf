JTK_HALO_ActionWheel_MouseWheel = {	
	disableSerialization;
	_scrollValue = _this select 1;
	
	_ctrl_0 = (uiNamespace getVariable 'JTK_HALO_Action_Wheel') displayCtrl 0; 
	if (!(ctrlShown _ctrl_0) AND ((player getVariable 'HALO_GPS_Status') == 'ON')) then {_ctrl_0 ctrlShow true};
};
 
JTK_HALO_ActionWheel_MouseButton = {
	disableSerialization;	
	_button = _this select 1;
	
	disableUserInput true;
	_ctrl_0 = (uiNamespace getVariable 'JTK_HALO_Action_Wheel') displayCtrl 0;
	if (_button == 0) then {[] execVM 'JTK_Scripts\HALO\rsc\Actn_ToggleGPSMode.sqf'};
	if (_button == 1) then {_ctrl_0 ctrlShow false};
	disableUserInput false;
};

RSC_EHs_Compiled = true;
