//by Kempco

/*
	-Force view distance to better manage what the player can see during the cutscenes (i.e. prevent player from having a point of reference ==> kills the illusion).
	-Once condition is met, view distance will gradually be restored over the time period defined by the restore delay.
	-NOTE: ViewDistance will be updated by an increment of (1/_n) every (1/_n) seconds. To improve performance decrease then value of _n.
*/

_unit 			= _this select 0;
_original_viewDistance 	= _this select 1;
_reduced_viewDistance	= _this select 2;

WaitUntil {getPos _unit  select 2 > 200};
setViewDistance _reduced_viewDistance;

WaitUntil {(_unit getVariable "JTK_HALO_Status" == "FREEFALL") OR (!alive _unit)};
	
if (!alive _unit) exitWith {setViewDistance _original_viewDistance};
	
_inc = abs(_original_viewDistance - _reduced_viewDistance)/30;

While {viewDistance < _original_viewDistance} do {
	setViewDistance (viewDistance + _inc);
	sleep 1;
};



