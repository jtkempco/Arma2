private ["_new_mode"];

if (player getVariable 'HALO_GPS_Mode' == "COORDS") then {
	_new_mode = "MAP";
}else{_new_mode = "COORDS"};

player setVariable ['HALO_GPS_Mode',_new_mode];

playsound "JTK_GPS_On";

