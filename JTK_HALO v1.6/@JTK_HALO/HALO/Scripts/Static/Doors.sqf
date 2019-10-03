//by Kempco
	
_unit 		= _this select 0;
_static 	= _this select 1;
_light_array 	= _this select 2;
_Jump_Light 	= (_light_array select 0) select 0; 
_Light 		= (_light_array select 1) select 0;
_brightness 	= (_light_array select 1) select 1; 
_Jump_status	= _static getVariable "JTK_Jump_Status";
_sound 	= if (typeof _static == "C130J_static_EP1") then{"JTK_C130_Doors"}else{"JTK_MV22_doors"};
_dly		= if (typeof _static == "C130J_static_EP1") then{2.9}else{1.5};

_Jump_Lights = [];
for "_i" from 0 to (count _light_array - 1) do {_Jump_Lights = _Jump_Lights + [(_light_array select _i) select 0]};

_red = [1,0,0];
_green = [0,1,0];
if ((_static animationPhase "ramp_top" != 0) OR (_static animationPhase "ramp_bottom" != 0)) then {
	_static animate ["ramp_bottom",0];
	_static animate ["ramp_Top",0];
	_static setVariable ["JTK_Static_DoorStatus","Closed"]; 
}; 
While {(_static getVariable "JTK_Jump_Status") == "white"} do {sleep 1};	
sleep 2;
//(_Jump_Lights select 0) setLightColor _red;
for "_i" from 0 to (count _Jump_Lights - 1) do {(_Jump_Lights select _i) setLightColor _red};
//for "_i" from 1 to (count _Jump_Lights - 1) do {(_Jump_Lights select _i) setLightBrightness 0};
While {true} do {
	if (_static animationPhase "ramp_top" != 0) exitWith {};
	sleep 0.02;
};
 _static say3D _sound;
sleep _dly;
//(_Jump_Lights select 0) setLightColor _green;
for "_i" from 0 to (count _Jump_Lights - 1) do {(_Jump_Lights select _i) setLightColor _green};
[_unit,_static,_Jump_Lights] spawn {
	_unit = _this select 0;
	_static = _this select 1;
	_Jump_Lights = _this select 2;
	WaitUntil {((_unit getVariable "JTK_HALO_Status") == "FREEFALL")};
	for "_i" from 0 to (count _Jump_Lights - 1) do {(_Jump_Lights select _i) setLightBrightness 0};
	for "_i" from 0 to (count _Jump_Lights - 1) do {
		LightDetachObject (_Jump_Lights select _i);
		(_Jump_Lights select _i) setpos [0,-90000,0];
		(_Jump_Lights select _i) spawn {sleep 3; deleteVehicle _this};
	};
};











