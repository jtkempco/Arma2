/*
	From Bis Advanced Hints Functions by Bohemian Interactive. Segment count modified by Kempco
*/

private ["_elapsed","_max","_line","_char","_i","_segments","_segmentsElapsed","_segmentsRemaining"];

_elapsed = _this select 0;

if (count(_this) > 1) then {
	_max = _this select 1;
};	
if isNil("_max") then {
	_max = 10;
};

//number of countdown segments
_segments = 36;//<============================================Initially 20. Increased count in to increase size of status bar.Kempco

_segmentsElapsed = round(_elapsed/_max * _segments);
_segmentsRemaining = _segments - _segmentsElapsed;

if (_segmentsElapsed > _segments) then {
	_segmentsElapsed = _segments;
	_segmentsRemaining = 0;
};

_char = "|";

_line = "<t color='#E9DFA0'>";

for "_i" from 1 to _segmentsElapsed do 
{
	_line = _line + _char;
};
_line = _line + "</t>";

if (_segmentsRemaining > 0) then {
	_line = _line + "<t color='#000000'>";
	for "_i" from 1 to _segmentsRemaining do 
	{
		_line = _line + _char;
	};
	_line = _line + "</t>";
};

_line



