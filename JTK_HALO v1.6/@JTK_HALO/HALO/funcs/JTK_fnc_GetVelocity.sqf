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
private ["_vz","_v"];

if (true) then {
	if ((isplayer _unit_2) AND (_unit_2 getVariable "JTK_ROD_Set")) exitWith {_vz = abs(velocity _unit_1 select 2)};
	if ((isplayer _unit_2) AND ((abs((velocity player) select 2)) < 10)) exitWith {_vz = abs(velocity _unit_1 select 2)};
	if ((isplayer _unit_2) AND ((_unit_2 getVariable "JTK_HALO_Status") == "WAITING")) exitWith {_vz = abs(velocity _unit_1 select 2)};
	if ((isplayer _unit_2) AND ((_unit_2 getVariable "JTK_HALO_Status") == "IN CHUTE")) exitWith {_vz = abs(velocity _unit_1 select 2)};
	if (!(isplayer _unit_2) AND ((abs((velocity _unit_1) select 2)) < 20)) exitWith {_vz = abs(velocity _unit_1 select 2)};
	
	_delta_z = ((position _unit_1 select 2) - (position _unit_2 select 2));
	_dir = if (_delta_z <= 0) then {-1}else{1};

	if (_delta_z > 15) exitWith {_vz = (abs(velocity _unit_2 select 2) + (3*_dir))};
	if ((_delta_z <= 15) AND (_delta_z > 5)) exitWith {_vz = (abs(velocity _unit_2 select 2) + (2*_dir))};
	if ((_delta_z <= 5) AND (_delta_z > 1.1)) exitWith {_vz = (abs(velocity _unit_2 select 2) + (1*_dir))};
	if ((_delta_z <= 1.1) AND (_delta_z > 0.51)) exitWith {_vz = (abs(velocity _unit_2 select 2) + (0.5*_dir))};
	if ((_delta_z <= 0.51) AND (_delta_z > 0.1)) exitWith {_vz = (abs(velocity _unit_2 select 2) + (0.25*_dir))};
	if (_delta_z <= 0.25) exitWith {_vz = (abs(velocity _unit_2 select 2) + (0.1*_dir))};
};
if (true) then {
	_v = [velocity _unit_1 select 0,velocity _unit_1 select 1];
	//if (!(player getVariable "JTK_DONE_SLOWING") AND ((player getVariable "JTK_HALO_Status") == "WAITING")) exitWith {_v = [velocity _unit_1 select 0,velocity _unit_1 select 1]};
	//if (!(player getVariable "JTK_DONE_SLOWING") AND ((player getVariable "JTK_HALO_Status") != "WAITING")) exitWith {_v = [velocity _unit_2 select 0,velocity _unit_2 select 1]};
	//if ((player getVariable "JTK_DONE_SLOWING") AND ((player getVariable "JTK_HALO_Status") != "WAITING")) exitWith {_v = [velocity _unit_1 select 0,velocity _unit_1 select 1]};
};
[_v select 0,_v select 1,-_vz]


