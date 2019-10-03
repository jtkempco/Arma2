//by Kempco
/*
	INPUT: NUMBER (MUST BE A FACTOR OF 45) 
	OUTPUT: STRING 
	
	EX: 45 call JTK_DirToDirString;
	returns: "NORTHEAST"
*/
 
private ["_heading"];


if (_this < 0) then {_this = _this + 360};//Marker Directions given in range from 0-180,-180 to 0;
_this = round(_this*100)/100;//Round to prevent misreads from really small numbers approaching 0

Switch (_this) do {
	case 0:{_heading = "NORTH"};
	case 45:{_heading = "NORTHEAST"};
	case 90:{_heading = "EAST"};
	case 135:{_heading = "SOUTHEAST"};
	case 180:{_heading = "SOUTH"};
	case 225:{_heading = "SOUTHWEST"};
	case 270:{_heading = "WEST"};
	case 315:{_heading = "NORTHWEST"};
	case 360:{_heading = "NORTH"};
};
_heading		

