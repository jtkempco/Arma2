//by Kempco

_static = _this select 0;
_mltplr = _this select 1;

_Static_Window = _static modelToWorld [_mltplr*(1.5),2.25,-3.45];
_Static_Window_OverShoot = _static modelToWorld [_mltplr*(-30),-2,-3.35];
_Static_Cabin_Rear = _static modelToWorld [0,-8,-3.45];
_JumpLeader = if (isMultiplayer) then {_static modelToWorld [0,-1.5,-3.2]}else{player modelToWorld [0,0,1.75]};

[_Static_Window,_Static_Window_OverShoot,_Static_Cabin_Rear,_JumpLeader]




