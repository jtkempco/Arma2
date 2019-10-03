//by Kempco

_unit 	= _this select 0;
_aircraft 	= _this select 1;
_dist		= _this select 2;

if ((!local _unit) OR (!JTK_HALO_Capture) OR (!isNil "JTK_Capture_Action")) exitWith {};

JTK_Capture_Action = _unit addaction ['<t color="#fadfbe">' + "---HALO Capture---" + '</t>',(JTK_HALO_Path+"dialog\Open_dlg.sqf"),["CAPTURE",_aircraft],4,true,true,"",""];
waitUntil {_unit distance _aircraft > _dist};
_unit removeAction JTK_Capture_Action;
JTK_Capture_Action = nil;




