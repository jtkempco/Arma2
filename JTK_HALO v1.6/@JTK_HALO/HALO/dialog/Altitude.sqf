//by Kempco

#include "definitions.sqf"
disableSerialization;

_dialog = findDisplay JTK_HALO_IDD;

if (player getVariable "JTK_HALO_Water_Insertion") exitWith {hintSilent "NEGATIVE:\nAltitude CANNOT be aujusted for water insertions."};


_aircraft = player getVariable "JTK_HALO_Aircraft";
_displayName = getText(configFile >> "cfgVehicles" >> (typeof _aircraft) >> "displayname");
_alt = parseNumber ctrlText (_dialog displayCtrl JTK_HALO_ALT_IDC);
_alt_limits = _aircraft getVariable "altitude limits";
_min = _alt_limits select 0;
_max = _alt_limits select 1;

_adjustment = 500;
_str = "";

switch _this do {
	case "Up":{
		if (_alt >= _max) then {
			_name = getText(configFile >> "cfgVehicles" >> (typeof _aircraft) >> "displayname");
			_str = format["<t size='1.5'><t align='left'><t color='#FF594D'><t shadow='2'>Maximum Altitude for %1 is %2m</t><br/>",_displayName,_max];
		}else{_alt = _alt + _adjustment};
	};
	case "Down":{
		if (_alt <= _min) then {
			_name = getText(configFile >> "cfgVehicles" >> (typeof _aircraft) >> "displayname");
			_str = format["<t size='1.5'><t align='left'><t color='#FF594D'><t shadow='2'>Minimum Altitude for %1 is %2m</t><br/>",_displayName,_min];
		}else{_alt = _alt - _adjustment};
	};
};

_color = [_alt,_alt_limits] call JTK_Get_AltTextColor;
(_dialog displayCtrl JTK_HALO_ALT_IDC) ctrlSetTextColor _color;
ctrlSetText [JTK_HALO_ALT_IDC,str _alt + "m"];

//To Update text color in help text
_markers = player getVariable "JTK_Halo_Markers";
_mapClick = if (isNil "_markers") then {false}else{true};
if (!JTK_HALO_Capture) then {
	[player,false,_aircraft,_mapClick,_str] call JTK_HelpTxt;
}else{
	_markers = player getVariable "JTK_Halo_Markers";
	_str = [markerPos(_markers select 0),(ctrlText JTK_HALO_DIR_IDC),_alt,markerPos(_markers select 1),(player getVariable "JTK_HALO_Water_Insertion"),_aircraft] call JTK_CapTxt;
	(_dialog displayCtrl JTK_Instructuions_IDC) ctrlSetStructuredText parseText _str;
};

if ((_alt >= _max) OR (_alt <= _min)) exitWith {};
[_alt,_this] call JTK_AdjustDistance; 








