//by Kempco
_unit 	= _this select 0;	
_static 	= _this select 1;
_aircraft	= _this select 2;
_isC130 	= _aircraft getVariable "is a C130";
_side = civilian;

	
_dummy = ([[-10000 + (random 5000),-10000 + (random 5000),5000 + (random 10000)],0,typeof _aircraft,_side] call bis_fnc_spawnvehicle) select 0;
WaitUntil {!isNull _dummy};

if (_isC130) then {
	_dummy hideobject true;
	//_dummy enableSimulation false;
	JTK_Call_PVEH = [_dummy,compile "_this hideObject true"];
	publicVariable "JTK_Call_PVEH"; 
}else{
	
	_static setVariable ["JTK_HALO_OpenDoors",false,true];
	_anchor = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
	WaitUntil {!isNull _anchor};
	
	_dummy attachTo [_anchor,[0,0,5000 + (random 5000)]];
	{_dummy animate [_x,1]} foreach JTK_MV22_Animations;
	_dummy setVariable ["anchor",_anchor];
	
	//hide locally
	_static hideObject true;
	_anchor hideObject true;
	
	//hide Globally 
	JTK_Call_PVEH = [[_anchor,_dummy],compile "{_x hideObject true} foreach _this"];
	publicVariable "JTK_Call_PVEH"; 	
};
_dummy




