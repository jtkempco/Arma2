//by Kempco
_aircraft 	= _this select 0;
_DZ 		= _this select 1;
_side		= _this select 2;

_dropZoneMarker = _aircraft getVariable "JTK_HALO_DropZoneMarker";
deleteMarker _dropZoneMarker;//Delete Just in case Old One Is Still Active
_name = format["JTK_HALO_DZ_Marker_%1",_aircraft];
_m = createMarker [_name,_DZ];
_m setMarkerColor "COLORGreen";
_m setmarkerType "mil_end";
_m setMarkerSize [0.7,0.7];
_aircraft setVariable ["JTK_HALO_DropZoneMarker",_m,true];

if (typeName(_aircraft getVariable "JTK_HALO_VehDrop") != "BOOL") then {
	_m setmarkerText "";
	_m setMarkerColor "ColorBlue";
};

[_aircraft] spawn {
	_aircraft = _this select 0;
	WaitUntil {(_aircraft getVariable "JTK_HALO_Takeoff") OR (_aircraft getVariable "JTK_HALO_Cancelled")};
	if (_aircraft getVariable "JTK_HALO_Takeoff") then {
		sleep 5;
		if (isMultiplayer) then {
			_players = _aircraft getVariable "HALO Players";
			{Waituntil {_x getVariable "JTK_HALO_Player_Ready"}} foreach _players;
			{Waituntil {(_x getVariable "JTK_HALO_Status") == "DONE"}} foreach _players;
		}else{
			if (count (player getVariable "HALO Units") > 0) then { 
				{Waituntil {!alive _x}} foreach (player getVariable "HALO Units"); 
			};
			WaitUntil {((player getVariable "JTK_HALO_Status") == "DONE")};
		};
	};	
	sleep 10;
	_m = _aircraft getVariable "JTK_HALO_DropZoneMarker";
	if (!isNil "_m") then {deletemarker _m};
};

