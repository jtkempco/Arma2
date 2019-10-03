/*
	by Kempco
	INPUT: Current Map Zoom
	OUTPUT: Increamental Difference that the zoom will change per scroll
*/
private ["_inc"];
_this = round(_this*50)/50;

if (_this <= 0.1) then {_inc = 0.025};
if ((_this > 0.1) AND (_this <= 0.2)) then {_inc = 0.05}; 
if ((_this > 0.2) AND (_this <= 0.4)) then {_inc = 0.1};
if (_this > 0.4) then {_inc = 0.2};

_inc

