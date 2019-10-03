//by Kempco
#include "Definitions.sqf"
disableSerialization;

_dialog = findDisplay JTK_HALO_IDD;
_altitude = if (_this select 4) then {JTK_HALO_Water_Insertion_Altitude}else{parseNumber(ctrlText JTK_HALO_ALT_IDC)};
_isWater = if (_this select 4) then {"yes"}else{"no"};
_wasWater = if (_altitude == JTK_HALO_Water_Insertion_Altitude) then {true}else{false};
_bttns = [(_dialog displayCtrl JTK_IncreaseAltitude_IDC),(_dialog displayCtrl JTK_DecreaseAltitude_IDC)];
_LZ_pos = [round((_this select 0) select 0),round((_this select 0) select 1),0];
_static_pos = [round((_this select 3) select 0),round((_this select 3) select 1),_altitude];


JTK_HALO_GetCaptureTxt = {
	_txt = "";
  	_str = "<t valign='Top'><t align='center'><t size='1.5'><t color='#00ff00'><t shadow='2'shadowColor='#000000'>Data Captured:</t><br/><br/>";_txt = _txt + _str;
  	_str = "<t color='#ffffff'><t align='left'><t valign='Top'><t size='1.2'>-Data coppied to <t underline='true'>clipboard<t underline='false'>.</t><br/><br/>";_txt = _txt + _str;
  	_str = "<t underline='false'><t align='left'><t valign='bottom'><t size='1.2'>-Paste into the aircraft's initialization line.</t><br/>";_txt = _txt + _str;
  	_txt 	
};

if (_isWater == "no") then {
	if (_wasWater) then {
		ctrlSetText [JTK_HALO_ALT_IDC,str (JTK_MIN_HaloAltitude + 500) + "m"];
		(_dialog displayCtrl JTK_HALO_ALT_IDC) ctrlSetTextColor JTK_Color_Common;
		(JTK_MIN_HaloAltitude + 500) call JTK_AdjustDistance;
	};
	{_x ctrlSetTextColor JTK_Color_Common} foreach _bttns;
}else{
	{_x ctrlSetTextColor JTK_Bttn_Blue} foreach _bttns;
	JTK_MIN_HaloAltitude call JTK_AdjustDistance;
	ctrlSetText [JTK_HALO_ALT_IDC,str JTK_HALO_Water_Insertion_Altitude + "m"];
	(_dialog displayCtrl JTK_HALO_ALT_IDC) ctrlSetTextColor JTK_Txt_Blue;
};

_txt = "";
//_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#FF594D'>CAPTURE MODE:</t><br/><t align='left'><t color='#ffffff'><br/><br/>";
_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#ffffff'>Capture Values:</t><br/><t align='left'><br/>";
//_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#ffffff'>CAPTURE MODE:</t><br/><t align='left'><t color='#ffffff'><br/><br/>";
_txt = _txt + _str;
_str = "<t size='1.4'>AirCraft C130:</t><br/>";
_txt = _txt + _str;
_str = format["<t size='1.2'>     Position: %1</t><br/>",_static_pos];
_txt = _txt + _str;
_str = format["<t size='1.2'>     Direction: %1</t><br/>",((_this select 1) call JTK_DirStringToDir)];
_txt = _txt + _str;
_str = format["<t size='1.2'>     Altitude: %1</t><br/><br/>",round(_static_pos select 2)];
_txt = _txt + _str;
_str = "<t size='1.4'>Rallypoint:</t><br/>";
_txt = _txt + _str;
_str = format["<t size='1.2'>     Position: %1</t><br/>",_LZ_pos];
_txt = _txt + _str;
_str = format["<t size='1.2'>     Is Water: %1</t><br/><br/>",_isWater];
_txt = _txt + _str;
if (round(_this select 2) >= JTK_Bailout_02_Altitude) then {
	_str = "<br/><t underline='false'><t align='center'><t size='1.5'><t color='#666600'>Oxygen Required</t><br/>";
	_txt = _txt + _str;
};
(_dialog displayCtrl JTK_Instructuions_IDC) ctrlSetStructuredText parseText _txt;


