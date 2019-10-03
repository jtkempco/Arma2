//by Kempco
	
_unit = _this select 0;
_cam = _this select 1;
_static = _this select 2;
_Fade_Out_Delay = _this select 3;
_mltplr = _this select 4;
_mltplr_2 = if (random 1 > 0.5)then{-1}else{1};//Not required for continuity, unlike the rest in trasition 2.

[_unit,_static] spawn {
	sleep 0.5;
	_JumpLight_Array = [(_this select 0),(_this select 1)] call JTK_Static_Lights;
	Waituntil {!isNil "_JumpLight_Array"};
	[(_this select 0),(_this select 1),_JumpLight_Array] spawn JTK_Static_Doors;
};

if (typeof _static == "MV22") then {
	
	_cam camSetPos (_static modelToWorld [_mltplr_2*(50),1000,0]);
	_cam camSetTarget _static;
	_cam cameraEffect ["internal", "BACK"];
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	showCinemaBorder true;	

	_text = ["1 minute out"];
	[_text,3.75] spawn JTK_InfoText;
	cutText ["","BLACK IN",3.5];

	_cam camSetPos (_static modelToWorld [_mltplr_2*(15),0,0]);
	_cam camCommit 5;
	waitUntil {camCommitted _cam};

	cutText ["","BLACK FADED",2];
	0.2 spawn {sleep _this; cutText ["","BLACK IN",_this]};

	_cam camSetPos (_static modelToWorld [0,-25,-4]);
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	
	_cam camSetPos (_static modelToWorld [0,-3.5,-1.5]);
	_cam camCommit 7;
	sleep 4;
};
if (typeof _static == "C130J_static_EP1") then {
	
	_CamPosArray = [_static,_mltplr] call JTK_GetCamPosArray;

	_cam camSetPos (_static modelToWorld [_mltplr_2*(100),-2000,-2]);
	_cam camSetTarget _static;
	_cam cameraEffect ["internal", "BACK"];
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	showCinemaBorder true;	

	_text = ["1 minute out"];
	[_text,3.75] spawn JTK_InfoText;

	cutText ["","BLACK IN",3.5];
	_cam camSetPos (_static modelToWorld [_mltplr*(50),0,0]);
	_cam camCommit 8;
	waitUntil {camCommitted _cam};

	cutText ["","BLACK FADED",2];
	0.2 spawn {sleep _this; cutText ["","BLACK IN",_this]};
	_cam camSetPos (_static modelToWorld [0,50,-6]);
	_cam camCommit 0;
	waitUntil {camCommitted _cam};

	_cam camSetPos (_static modelToWorld [0,20,-6]);
	_cam camCommit 5;
	waitUntil {camCommitted _cam};

	_cam camSetPos (_static modelToWorld [_mltplr*(6.25),2.5,-3.55]);
	_cam camSetTarget (_CamPosArray select 0);
	_cam camCommit 4.5;
	waitUntil {camCommitted _cam};
	
	_cam camSetTarget (_CamPosArray select 1);
	_cam camCommit 0;
	waitUntil {camCommitted _cam};

	_cam camSetPos (_static modelToWorld [_mltplr*(1.1),2,-3.55]);
	_cam camCommit 3;
	sleep 2;
	_cam camSetTarget (_CamPosArray select 2);
	_cam camSetPos (_static modelToWorld [0,2,-3.55]);
	_cam camCommit 2;
	waitUntil {camCommitted _cam};

	sleep 0.25;
	_cam camSetTarget [(_CamPosArray select 2) select 0,(_CamPosArray select 2) select 1,((_CamPosArray select 3) select 2) + 0.35];
	_cam camSetPos (_CamPosArray select 3);
	_cam camCommit 5.25;
	sleep 3.5;
};

cutText ["","BLACK OUT",1.2];
sleep 1;
cutText ["","BLACK FADED",100];
_cam cameraEffect ["terminate","FRONT"];
_cam camCommit 0;
_unit switchCamera "Internal";
_dly = if ((typeof _static) == "MV22") then {8}else{5};
_dly spawn {sleep (_this/2); cutText ["","BLACK IN",_this]};
waitUntil {camCommitted _cam};
camDestroy _cam;

true

