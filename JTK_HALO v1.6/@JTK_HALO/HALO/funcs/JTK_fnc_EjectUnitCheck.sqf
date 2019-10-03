//by Kempco
/*
	INPUT: [UNIT,VEH POSITION] 
	OUTPUT: BOOL 
*/

_unit = _this select 0;
_position = _this select 1;
		
if (!(isPlayer _unit) AND (side _unit ==  west) AND ((typeof _unit) != JTK_HALO_Pilot_Type_West)) exitWith {true};
if (!(isPlayer _unit) AND (side _unit ==  east) AND ((typeof _unit) != JTK_HALO_Pilot_Type_East)) exitWith {true};
if (!(isPlayer _unit) AND (count units group _unit) > 1) exitWith {true};
if ((!isPlayer _unit) AND (isPlayer (leader group _unit))) exitWith {true};
if ((!isPlayer _unit) AND (_position != 'driver')) exitWith {true};
if ((!isPlayer _unit) AND (_unit == (leader group _unit)) AND (_position == 'driver') AND ((count units group _unit) == 1)) exitWith {false};
	
if ((isPlayer _unit) AND (_position == 'driver')) exitWith {true};
if ((isPlayer _unit) AND (_position == 'cargo')) exitWith {false};


