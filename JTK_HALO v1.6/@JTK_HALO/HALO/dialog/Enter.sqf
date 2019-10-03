//by Kempco

#include "Definitions.sqf"
disableSerialization;

_dialog = findDisplay JTK_HALO_IDD;
_unit = player;
_markers = _unit getVariable "JTK_Halo_Markers";
_aircraft = _unit getVariable "JTK_HALO_Aircraft";

_Array = [(parseNumber ctrlText (_dialog displayCtrl JTK_HALO_ALT_IDC)),_markers] call JTK_Get_EnterText;
_txt =  _Array select 0;
_AcceptRequest = _Array select 1;

if (!(_AcceptRequest) AND !(_unit getVariable "JTK_HALO_Water_Insertion")) exitWith {hintSilent parsetext _txt; player globalChat ""};

_m1 = _markers select 0;
_m2 = _markers select 1;
_m3 = _markers select 2;
	
_DropZone_pos = markerpos _m1;
_Altitude = parseNumber ctrlText (_dialog displayCtrl JTK_HALO_ALT_IDC);

_heading = ctrltext JTK_HALO_DIR_IDC;
_marker_dir = (ctrltext JTK_HALO_DIR_IDC) call JTK_DirStringToDir;

_aircraft_dir = (ctrltext JTK_HALO_DIR_IDC) call JTK_DirStringToReverseDir;
_aircraft_pos = [(markerpos _m2) select 0,(markerpos _m2) select 1,_Altitude];
_isWaterInsert = (_unit getVariable "JTK_HALO_Water_Insertion");
_array = if !(_isWaterInsert) then {[_unit,_aircraft,_DropZone_pos,_aircraft_pos,_aircraft_dir,_marker_dir]}else{[_unit,_aircraft,_DropZone_pos,_aircraft_pos,_aircraft_dir,_marker_dir,["Zodiac",6]]};

if (JTK_HALO_Capture) exitWith {
	_array set [0,side _unit];
	(_dialog displayCtrl JTK_Instructuions_IDC) ctrlSetStructuredText parseText (_array call JTK_HALO_GetCaptureTxt);
	copyToClipboard call Compile "(format ['JTK_HALO_ByPass = true; JTK_HALO_CAPTURE_DATA = %1',_array])";
};
if (!isMultiplayer) then {_unit call JTK_AI_VerifySquadSize}; 

if (isServer) then{
	_array spawn JTK_Aircraft_SetPos;
}else{
	JTK_Spawn_PVEH = [_array,JTK_Aircraft_SetPos];
	publicVariable "JTK_Spawn_PVEH";
};
if (true) exitWith {closeDialog 0};

