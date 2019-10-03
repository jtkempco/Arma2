//by Kempco


_unit 		= _this select 0;
_static 	= _this select 1;
_cam 		= _this select 2;
_Fade_Out_Delay = _this select 3;
_mltplr 	= _this select 4;
_aircraft	= vehicle _unit;

showCinemaBorder true;
_cam camCommit 0;
waitUntil {camCommitted _cam};

if (typeof _aircraft == "MV22") then {
	_R_rotor = (_aircraft modelToWorld [7,3,2]);
	_L_rotor = (_aircraft modelToWorld [-7,3,2]);
	//_cockpit_cntr = (_aircraft modelToWorld [0,5,-1]);
	//_pilot = (_aircraft modelToWorld [-0.75,5,-1.5]);
	_doors = (_aircraft modelToWorld [0,-6.5,-3]);
	//_front = (_aircraft modelToWorld [0,3.5,-1.5]);
	
	_zpos = getpos _aircraft select 2;
	
	_cam camSetTarget _doors;
	_cam camSetPos _front;
	_cam camCommit 0;
	
	waitUntil {(isEngineOn _aircraft) AND (camCommitted _cam)};
	
	_cam camSetPos (_aircraft modelToWorld [-5,5,-3]);
	_cam camSetTarget _L_rotor;
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	
	sleep 1.5;
	_cam camSetPos (_aircraft modelToWorld [5,-5,5]);
	_cam camSetTarget _R_rotor;
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	
	sleep 1.5;
	_cam camSetPos (_aircraft modelToWorld [0,6,1]);
	_cam camSetTarget _aircraft;
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	
	_cam camSetPos (_aircraft modelToWorld [0,15,-3.5]);
	_cam camCommit 8;
}else{
	sleep 3;
	_cam camSetFov 0.7;
	_cam camSetPos (_aircraft modelToWorld [0,15,0]);//Transition to see Engines turn on
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	sleep 2;
	// smoothly move the camera to its new position in 6 seconds
	_cam camSetPos (_aircraft modelToWorld [0,25,-5]);
	_cam camCommit 8;
	sleep 1;
};

[["En Route To Insertion..."],3] spawn JTK_InfoText;
cutText ["","BLACK OUT",5];
sleep 5;
cutText ["","BLACK FADED",100];
_cam camSetPos(_aircraft modelToWorld [0,0,3000]);
_cam camCommit _Fade_Out_Delay;
waitUntil {camCommitted _cam};
	
true


