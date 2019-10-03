//by Kempco
#include "definitions.sqf"
disableSerialization;

_aircraft = player getVariable "JTK_HALO_Aircraft";
_Dist2MarkBuffer = _aircraft getVariable "Dist2MarkBuffer";
_min_alt = (_aircraft getVariable "altitude limits") select 0;
_min_radius = JTK_HALO_RP_Min_Radius;

_alt = if (player getVariable "JTK_HALO_Water_Insertion") then {_min_alt}else{(_this select 0)};

_markers = (player getVariable "JTK_Halo_Markers");
_m1 = _markers select 0;
_m2 = _markers select 1;
_m3 = _markers select 2;

_m1_radius = if (typeName(_this select 1) == "STRING") then {
	if ((_this select 1) == "Up")then {
		(markerSize _m1 select 0) + (0.1*_min_radius); 
	}else{
		if ((markerSize _m1 select 0) - (0.1*_min_radius) <= 0) then {
			_min_radius
		}else{
			(markerSize _m1 select 0) - (0.1*_min_radius)
		};
	};
}else{(_this select 1)};

_dist = [_alt,_Dist2MarkBuffer] call JTK_AdjustDistToMarker;
_m1 setmarkerSizelocal [_m1_radius,_m1_radius];

_m2_offset = [(markerpos _m1), _dist, (markerDir _m2)] call BIS_fnc_relPos;
_m3_offset = [(markerpos _m1),(_dist/2), (markerDir _m2)] call BIS_fnc_relPos;

_m2 setmarkerPoslocal _m2_offset;
_m3 setmarkerPoslocal _m3_offset;
_m3 setmarkerSizelocal [5,((markerpos _m1) distance (markerpos _m2))/2];







