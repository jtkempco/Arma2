/*
	PUROPOSE: To Match Rate of Descent for unit during single player HALO jumps.
	INPUT: 
		UNIT_1 unit that needs to be synced.
		UNIT_2 unit that is being synced to.
	OUTPUT: Absolute value of the units new velocity.
	
	by Kempco
	
*/

_unit_1 = _this select 0;
_unit_2 = _this select 1;

if ((isplayer _unit_2) AND ((abs((velocity player) select 2)) < 10)) exitWith {abs(velocity _unit_1 select 2)};
if ((isplayer _unit_2) AND ((_unit_2 getVariable "JTK_HALO_Status") == "WAITING")) exitWith {abs(velocity _unit_1 select 2)};
if ((isplayer _unit_2) AND ((_unit_2 getVariable "JTK_HALO_Status") == "IN CHUTE")) exitWith {abs(velocity _unit_1 select 2)};
if (!(isplayer _unit_2) AND ((abs((velocity _unit_1) select 2)) < 20)) exitWith {abs(velocity _unit_1 select 2)};
	
_delta_z = ((position _unit_1 select 2) - (position _unit_2 select 2));
_dir = if (_delta_z <= 0) then {-1}else{1};

if (_delta_z > 15) exitWith {abs(velocity _unit_2 select 2) + (3*_dir)};
if ((_delta_z <= 15) AND (_delta_z > 5)) exitWith {abs(velocity _unit_2 select 2) + (2*_dir)};
if ((_delta_z <= 5) AND (_delta_z > 1.1)) exitWith {abs(velocity _unit_2 select 2) + (1*_dir)};
if ((_delta_z <= 1.1) AND (_delta_z > 0.51)) exitWith {abs(velocity _unit_2 select 2) + (0.5*_dir)};
if ((_delta_z <= 0.51) AND (_delta_z > 0.1)) exitWith {abs(velocity _unit_2 select 2) + (0.25*_dir)};
if (_delta_z <= 0.25) exitWith {abs(velocity _unit_2 select 2) + (0.1*_dir)};

