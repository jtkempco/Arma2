//By Kempco

#include "definitions.sqf"
disableSerialization;

_IsWater = player getVariable "JTK_HALO_Water_Insertion";
_aircraft = player getVariable "JTK_HALO_Aircraft";
_Dist2MarkBuffer = _aircraft getVariable "Dist2MarkBuffer";

_dialog = findDisplay JTK_HALO_IDD;
_alt = parseNumber ctrlText (_dialog displayCtrl JTK_HALO_ALT_IDC);

_inc = 45;
if (_this == "left") then {_inc = _inc*-1};

_Dist2Marker = if (_IsWater) then {_Dist2MarkBuffer*(2/3)}else{_Dist2MarkBuffer};
_dist = [_alt,_Dist2MarkBuffer] call JTK_AdjustDistToMarker;

//Markers
_markers = (player getVariable "JTK_Halo_Markers");
_m1 = _markers select 0;
_m2 = _markers select 1;
_m3 = _markers select 2;

_old_dir = markerDir _m2;
_new_dir = _old_dir + _inc;

_m2_offset = [(markerpos _m1), _dist, (_new_dir)] call BIS_fnc_relPos;
_m3_offset = [(MarkerPos _m1), (_dist/2), (_new_dir)] call BIS_fnc_relPos; 

_m2 setmarkerTypelocal "empty";
_m2 setmarkerPoslocal _m2_offset;
_dir = [markerpos _m1, markerpos _m2] call BIS_fnc_dirTo;
_m2 setMarkerDirlocal _dir;
_m2 setMarkerTypelocal "mil_arrow2";

_m3 setMarkerDirlocal _dir;
_m3 setmarkerPoslocal _m3_offset;
_m3 setmarkerSizelocal [5,((markerpos _m1) distance (markerpos _m2))/2];

ctrlSetText [JTK_HALO_DIR_IDC,(_new_dir call JTK_DirToDirString)];

if (JTK_HALO_Capture) then {
	[markerPos _m1,(ctrlText JTK_HALO_DIR_IDC),parseNumber(ctrlText JTK_HALO_ALT_IDC),markerPos(_markers select 1),_IsWater] call JTK_CapTxt;
};


