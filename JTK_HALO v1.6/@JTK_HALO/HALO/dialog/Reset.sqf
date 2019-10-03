//by Kempco
_aircraft = player getVariable "JTK_HALO_Aircraft";
CloseDialog 0;
WaitUntil {!dialog};
_aircraft setVariable ["JTK_HALO_Cancelled",true,true];

_line_1 = format ["HALO INSERTION CANCELLED BY %1",name player];
_line_2 = "ALL UNITS ARE ORDERED TO EXIT THE AIRCRAFT IMMEDIATELY.";
_txt =[_line_1,_line_2];

[playerSide,'HQ'] commandChat _line_1;
[playerSide,'HQ'] commandChat _line_2;
if (isMultiplayer) then {JTK_Call_PVEH = [[_aircraft,_txt],JTK_C130_Eject_Players]; publicVariable "JTK_Call_PVEH"};
	
_markers = player getVariable "JTK_Halo_Markers";
if (!isNil "_markers") then {{deleteMarker _x} foreach _markers};

WaitUntil {count crew _aircraft == 0};
_aircraft setVariable ["JTK_HALO_CommandUnit",nil,true];
WaitUntil {!(_aircraft getVariable "JTK_HALO_Cancelled")};

hintSilent "HALO Reset";
[] spawn {sleep 7; HintSilent ""};

