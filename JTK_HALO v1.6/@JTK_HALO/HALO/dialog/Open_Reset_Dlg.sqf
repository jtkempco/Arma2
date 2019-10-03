//by Kempco
private ["_warning","_warning_text"];

_unit = _this select 0;
_aircraft = _this select 1;

hint format ["%1\n%2",_unit,_aircraft];

_unit setVariable ["JTK_HALO_Aircraft_To_Cancel",_aircraft];

if !(isMultiplayer) then {
	_crew = crew _aircraft - [driver _aircraft];
	_warning = if (count _crew > 0) then {"NEGATIVE"}else{"RESET"};
}else{_warning = "RESET"};

if (!(isMultiplayer) AND (_warning == "RESET")) exitWith {_aircraft setVariable ["JTK_HALO_Cancelled",true,true]};

#include "Definitions.sqf"
disableSerialization;
createDialog "JTK_HALO_Reset_Dlg";
WaitUntil{dialog};
_dialog = findDisplay JTK_Reset_Dlg_IDD;



if (_warning == "NEGATIVE") then {
	if (isNil "JTK_Reset_Warning_2") then {
		_txt = "";
		_str = "<br/><t align='center'><t size='2.0'><t shadow='2'><t color='#FF594D'>NEGATIVE:</t><br/><t align='left'><br/>"; _txt = _txt + _str;
		_str = "<t size='1.7'><t color='#E9DFA0'><t shadow='2'>Script cannot reset while AI units are in the aircraft. Order your squad to disembark then try again.</t><br/>";_txt = _txt + _str;
		JTK_Reset_Warning_2 = _txt;
	};
	(_dialog displayCtrl JTK_Reset_Bttn_IDC) ctrlEnable false;
	_warning_text = JTK_Reset_Warning_2;
};
if (_warning == "RESET") then {
	if (isNil "JTK_Reset_Warning_1") then {
		_txt = "";
		_str = "<br/><t align='center'><t size='2.0'><t shadow='2'><t color='#E9DFA0'>BE ADVISED:</t><br/><t align='left'><br/>"; _txt = _txt + _str;
		_str = "<t size='1.7'><t color='#E9DFA0'><t shadow='2'>Cancelling will eject all players from the C130 then reset the script. To confirm click 'Reset'. to Cancel click 'Close'.</t><br/>";_txt = _txt + _str;
		JTK_Reset_Warning_1 = _txt;
	};
	_warning_text = JTK_Reset_Warning_1;
};

(_dialog displayCtrl JTK_Reset_Text_IDC) ctrlSetStructuredText parseText _warning_text;	
WaitUntil {!dialog};
sleep 1;
_unit setVariable ["JTK_HALO_Aircraft_To_Cancel",nil];	
	


