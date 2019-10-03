//by Kempco
//Used to monitor marker visability in single player
//Only Aplicable in Single Player

_prev_side = side(_this select 0);
_current_side = side(_this select 1);

if (_prev_side != _current_side) then {
	_markersToHide = if (_prev_side == west) then {jtk_MrkrsW}else{jtk_MrkrsE};
	_markersToShow = if (_prev_side == west) then {jtk_MrkrsE}else{jtk_MrkrsW};
	_markerType = if (_current_side == west) then {"b_Plane"}else{"o_Plane"}; 
	for "_i" from 0 to (count _markersToHide - 1) do {(_markersToHide select _i) setmarkerType "empty"}; 
	for "_i" from 0 to (count _markersToShow - 1) do {(_markersToShow select _i) setmarkerType _markerType}; 
};
	
if (true) exitWith {};

	


