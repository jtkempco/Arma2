//by Kempco
/*
	Returns the appropriate speed the player exits the aircraft according to the following factors:
		- Multiplayer or Single player
		- ACE Freefall or JTK_Freefall
*/


_aircraft = _this select 0;
_vehdrop = _this select 1;

_kph = (_aircraft getVariable "speeds") select 1;

_mps = (_kph/3.6);
_exitspeed = if (isMultiplayer) then {_mps}else{_mps*0.25}; 
if ((isMultiplayer) AND (_vehdrop)) then {_exitspeed = _exitspeed/2};
if ((JTK_ACE_Detected) AND (isMultiplayer)) then {_exitspeed = _exitspeed*2};
_exitspeed











