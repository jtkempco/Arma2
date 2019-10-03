//by Kempco
//Common RSC scripts

JTK_HALO_GPS_Monitor_Addaction = {
	
	private ["_Actn","_Actn_Veh"];
	While {(alive _this) AND ((_this getVariable "HALO_GPS_Status") == "ON") AND (getPosATL _this select 2 > 1)} do {
		if ((_this getVariable "JTK_HALO_Status" == "IN CHUTE") AND (JTK_ACE_Detected)) then {
			_Actn_Veh = (vehicle _this) addaction ["<t color='#FAB909'>-GPS: Toggle Display Mode-</t>",(JTK_HALO_Path+"rsc\Actn_ToggleGPSMode.sqf"),[],4,false,true,"",""];
			While {(alive _this) AND (_this getVariable "JTK_HALO_Status" == "IN CHUTE") AND((_this getVariable "HALO_GPS_Status") == "ON")} do {sleep 0.05};
			(vehicle _this) removeaction _Actn_Veh;
		};
		if (player getVariable "JTK_HALO_Status" == "FREEFALL") then {
			_Actn = _this addaction ["<t color='#FAB909'>-GPS: Toggle Display Mode-</t>",(JTK_HALO_Path+"rsc\Actn_ToggleGPSMode.sqf"),[],4,false,true,"",""];
			While {(alive _this) AND (_this getVariable "JTK_HALO_Status" == "FREEFALL") AND((_this getVariable "HALO_GPS_Status") == "ON")} do {sleep 0.05};
			_this removeaction _Actn;
		};
		sleep 0.05;
	};
	_this removeaction _Actn;
	(vehicle _this) removeaction _Actn_Veh;
};


JTK_GetHALOMapZoom = {
	_unit = _this select 0;
	_max_zoom = 0.65;
	_min_zoom = 0.15;
	_bfr = abs((speed _unit)/175);
	_zoom = (_max_zoom * _bfr) + _min_zoom; 
	
	_zoom
};


JTK_GPS_Player_Marker = {
	_mrkN = format ["GPS_Marker_%1",_this];
	_m1 = createMarkerlocal [_mrkN,getPos _this];
	_m1 setMarkertypelocal "empty";
	_m1 setMarkerColorlocal "ColorBlue";
	_m1 setMarkersizelocal [0.375,0.75];
	
	_m1
};

JTK_HALO_Player_RSCs = {
	_handleKeyPress = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call JTK_HALO_KeyPressed"];
	_handleScrollWheel = (finddisplay 46) displayaddeventhandler ["mousezchanged","_this call JTK_HALO_ScrollWheel"];
	
	While {(alive _this) AND ((_this getVariable "JTK_HALO_Status") != "DONE") AND ((_this getVariable "JTK_HALO_Status") != "SWIMMING")} do {sleep 0.1};
	
	(findDisplay 46) displayRemoveEventHandler ["KeyDown",_handleKeyPress];
	(findDisplay 46) displayRemoveEventHandler ["mousezchanged",_handleScrollWheel];
	JTK_HALO_GPS_Layer cutRsc ['default', 'Plain'];
	JTK_HALO_Mask_Layer cutRsc ['default', 'Plain'];
	JTK_HALO_GPS_Load_Layer cutRsc ['default', 'Plain'];
};


RSC_Scripts_Compiled = true;




