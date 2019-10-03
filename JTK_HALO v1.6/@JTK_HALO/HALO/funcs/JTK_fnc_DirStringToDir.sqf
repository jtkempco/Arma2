//by Kempco
/*
	INPUT: STRING 
	OUTPUT: NUMBER 
	
	EX: "SOUTH" call JTK_DirStringToDir;
	returns: 180
*/
private ["_dir","_multiplier"];

switch (_this) do {
	case "NORTH":{_multiplier = 0};
	case "NORTHEAST":{_multiplier = 1};
	case "EAST":{_multiplier = 2};
	case "SOUTHEAST":{_multiplier = 3};
	case "SOUTH":{_multiplier = 4};
	case "SOUTHWEST":{_multiplier = 5};
	case "WEST":{_multiplier = 6};
	case "NORTHWEST":{_multiplier = 7};
};
	
_dir = _multiplier*45;

_dir


