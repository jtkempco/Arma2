//by Kempco
/*
	INPUT: STRING 
	OUTPUT: STRING 
	
	EX: "SOUTHWEST" call JTK_DirStringToReverseDirString;
	returns: "NORTHEAST"
*/
private ["_reverseString"];

switch (_this) do {
	case "NORTH":{_reverseString = "SOUTH"};
	case "NORTHEAST":{_reverseString = "SOUTHWEST"};
	case "EAST":{_reverseString = "WEST"};
	case "SOUTHEAST":{_reverseString = "NORTHWEST"};
	case "SOUTH":{_reverseString = "NORTH"};
	case "SOUTHWEST":{_reverseString = "NORTHEAST"};
	case "WEST":{_reverseString = "EAST"};
	case "NORTHWEST":{_reverseString = "SOUTHEAST"};
};

_reverseString




