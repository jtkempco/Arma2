//by Kempco
disableSerialization;

_sel = _this select 0;

JTK_HALO_Cinema_Border_Layer cutRsc ['JTK_HALO_CINEMA_BORDER_RSC', 'Plain'];
_display = uiNamespace getVariable "JTK_CinemaBorder";
WaitUntil {!isNil "_display"};

if (_sel == "SHOW") then {
	_txt = "<t shadow='2'><t color='#FFFF00'><t size='2.25'><t valign='middle'><t align='center'>*Player Input Disabled</t>";
	(_display displayCtrl 2) ctrlSetStructuredText parseText _txt;
}else{
	if (_sel == "HIDE") then {
		JTK_HALO_Cinema_Border_Layer cutRsc ['Default', 'Plain'];
	};
};


