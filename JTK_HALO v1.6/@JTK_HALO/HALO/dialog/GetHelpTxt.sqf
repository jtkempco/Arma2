#include "Definitions.sqf"
disableSerialization;
_dialog = findDisplay JTK_HALO_IDD;

private ["_txt"];

_unit = _this select 0;

JTK_Color_Common = [,1,1,1];
JTK_MrkrBl = [0,0,1,1];
JTK_MrkrG = [0,0,1,1];
_isWaterInsert = _unit getVariable "JTK_HALO_Water_Insertion";

_help_txt = _dialog displayCtrl JTK_Instructuions_IDC;
_STs = [_dialog displayCtrl JTK_DZ_ST_IDC,_dialog displayCtrl JTK_JV_ST_IDC,_dialog displayCtrl JTK_C130_ST_IDC]; 
_Mrkrs = [_dialog displayCtrl JTK_DZ_Mrkr_IDC,_dialog displayCtrl JTK_JV_Mrkr_IDC,_dialog displayCtrl JTK_C130_Mrkr_IDC];
_Ls = = [_dialog displayCtrl JTK_DZ_L_IDC,_dialog displayCtrl JTK_JV_L_IDC,_dialog displayCtrl JTK_C130_L_IDC];


if (isNil "JTK_Help_Altitude") then {
	_txt = "";
	_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#E9DFA0'>CONTROLS:</t><br/><t align='left'><br/>"; _txt = _txt + _str;
	_str = "<t size='1.5'><t color='#E9DFA0'><t shadow='2'>UP:    Increase altitude.</t><br/>";_txt = _txt + _str;
	_str = "<t color='#E9DFA0'><t shadow='2'>DOWN: Decrease altitude.</t><br/>";_txt = _txt + _str;
	JTK_Help_Altitude = _txt;
};

if (isNil "JTK_Help_Ingress") then {
	_txt = "";
	_str = "<t size='1.5'><t align='left'><t color='#E9DFA0'><t shadow='2'>LEFT:  Rotate clockwise.</t><br/>";_txt = _txt + _str;
	_str = "<t align='left'><t color='#E9DFA0'><t shadow='2'>RIGHT: Rotate counter-clockwise.</t><br/><br/><br/><br/>";_txt = _txt + _str;
	_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#E9DFA0'>MARKERS:</t><br/><t align='left'><br/>"; _txt = _txt + _str;
	JTK_Help_Ingress = _txt;
};
if (isNil "JTK_Help_WaterInsert") then {
	_txt = "";
	_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#4D59FF'>WATER INSERTION:</t><t size='1.5'><br/><br/>";_txt = _txt + _str;
	_str = "<t align='left'><t color='#E9DFA0'><t shadow='2'>Limitations:</t><br/><br/>";_txt = _txt + _str;
	JTK_Help_WaterInsert = _txt;
};


_markers = _unit getVariable "JTK_Halo_Markers";
if (isNil "_markers") then {_txt = JTK_Help_Altitude};
if (!isNil "_markers") then {
	if (_isWaterInsert) then {_txt = JTK_Help_WaterInsert}else{_txt = JTK_Help_Altitude + JTK_Help_Ingress};
}; 
	
_help_txt ctrlSetStructuredText parseText _txt;

if ((!isNil "_markers") AND !(_waterInsert)) then {
	(_Mrkrs select 0) ctrlSetTextColor JTK_MrkrGrn;
	(_Mrkrs select 1) ctrlSetBackGroundColor JTK_MrkrBl;
	(_Mrkrs select 2) ctrlSetTextColor JTK_MrkrBl;
	{_x ctrlSetBackGroundColor JTK_Color_Common} foreach _Ls; 
	
	(_STs select 0) ctrlSetStructuredText parseText "<t size='1.5'><t shadow='2'><t color='#E9DFA0'>Drop Zone</t>";
	(_STs select 1) ctrlSetStructuredText parseText "<t size='1.5'><t shadow='2'><t color='#E9DFA0'>C130</t>";
	(_STs select 2) ctrlSetStructuredText parseText "<t size='1.5'><t shadow='2'><t color='#E9DFA0'>Flight Path</t>";
	

	_pos = ctrlPosition (_Mrkrs select 0);
	(_Mrkrs select 0) ctrlSetPosition [(_pos select 0)-(_pos select 2)*2,(_pos select 1)-(_pos select 3)*1.5,(_pos select 2)*5,(_pos select 3)*5];
	(_Mrkrs select 0) ctrlCommit 0;
	(_Mrkrs select 0) ctrlSetTextColor [0,1,0,0.55];

	_pos = ctrlPosition (_Mrkrs select 2);
	(_Mrkrs select 2) ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,(_pos select 3)*0.75];
	(_Mrkrs select 2) ctrlCommit 0;
	(_Mrkrs select 2) ctrlSetTextColor [0,0,1,1.0];

	(_Mrkrs select 0) ctrlSetText "\ca\ui\data\markers\gr_marker_dot_ca.paa"; 
	(_Mrkrs select 2) ctrlSetText "\ca\ui\data\markers\gr_arrow2_ca.paa";
};





