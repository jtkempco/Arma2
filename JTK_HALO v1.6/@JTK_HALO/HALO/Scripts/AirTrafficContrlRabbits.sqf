//by Kempco

_pilot 	= _this select 0;
_aircraft 	= _this select 1;
_side = side _pilot;

_offsets = [_aircraft modelToWorld [0,20,0],_aircraft modelToWorld [0,15,0],_aircraft modelToWorld [-7.5,10,0],_aircraft modelToWorld [7.5,10,0]];

_grp = createGroup _side;
for "_i" from 0 to (count _offsets - 1) do {
	_pos = _offsets select _i;
	_rabbit = _grp createUnit ["Rabbit",[_pos select 0,_pos select 1,0], [], 0, "NONE"];
	WaitUntil {!isNull _rabbit};
	
	if (!isDedicated) then {_rabbit hideObject true};
	JTK_Call_PVEH = [_rabbit,compile "_this hideObject true"]; 
	publicVariable "JTK_Call_PVEH";
	
	_rabbit disableAI "move";
	_rabbit setPos [_pos select 0,_pos select 1,0];
	_pilot reveal _rabbit;
}; 

_t = time + 20;
While {alive _pilot} do {
	sleep 1;
	if (!alive _pilot) exitWith {};
	if (time > _t) then {
		_t = time + 20;
		{_pilot reveal _x} foreach units _grp;
	};
};
{deleteVehicle _x} foreach units _grp;

	

