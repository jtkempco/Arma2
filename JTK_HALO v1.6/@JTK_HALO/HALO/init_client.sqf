//by Kempco

if (isDedicated) exitWith {};

WaitUntil{!isNull player};
if (isNil "JTK_HALO_Terminate") then {
	While {isNil "JTK_HALO_Terminate"} do {sleep 1};
};
if (JTK_HALO_Terminate) exitWith {player globalChat "JTK HALO Script Terminated"};

if (isNil "JTK_HALO_Funcs_Compiled") then {
	#include "CompileFunctions.sqf"
};

if (JTK_HALO_CreateCivCenter) then {createCenter civilian};//Create Civ center locally
	
if (!isMultiplayer) then {
	jtk_MrkrsW = [];
	jtk_MrkrsE = [];
	_aircraft_count = count(JTK_HALO_Aircraft select 0) + count(JTK_HALO_Aircraft select 1);
	
	for "_i" from 0 to (count JTK_HALO_Aircraft - 1) do { 
		for "_j" from 0 to (count (JTK_HALO_Aircraft select _i) - 1) do { 
			((JTK_HALO_Aircraft select _i) select _j) spawn {
				While {true} do { 
					sleep 3;
					if ((format ["%1",(_this getVariable "JTK_HALO_STATIC")]) != "<null>") exitWith {
						_static = _this getVariable "JTK_HALO_STATIC";
						_side = _this getVariable "side";
						_m = _this getVariable "JTK_HALO_DecoyMarker";
						
						[player,_this,_static] execFSM (JTK_HALO_Path+"fsms\MonitorCargo.fsm");
						if (_side == west) then {jtk_MrkrsW = jtk_MrkrsW + [_m]}else{jtk_MrkrsE = jtk_MrkrsE + [_m]};
					};
				};
			};
		};
	};
	WaitUntil {_aircraft_count == ((count jtk_MrkrsW) + (count jtk_MrkrsE))};
	//hint format ["Markers West: %1\nMarkers East: %2",count jtk_MrkrsW,count jtk_MrkrsE];	
	_markersToHide = if ((side player) == west) then {jtk_MrkrsE}else{jtk_MrkrsW};
	{_x setmarkerType "empty"} foreach _markersToHide;
}else{
	for "_i" from 0 to (count JTK_HALO_Aircraft - 1) do {
		for "_j" from 0 to (count (JTK_HALO_Aircraft select _i) - 1) do {
			((JTK_HALO_Aircraft select _i) select _j) spawn {
				While {true} do { 
					sleep 3;
					if ((format ["%1",(_this getVariable "JTK_HALO_STATIC")]) != "<null>") exitWith {
						_static = _this getVariable "JTK_HALO_STATIC";
						_side = _this getVariable "side";
						//_m = _this getVariable "JTK_HALO_DecoyMarker";
						
						if (_side == (side player)) then {
							[player,_this,_static] execFSM (JTK_HALO_Path+"fsms\MonitorCargo.fsm");
							[_this,"ON"] call JTK_HALO_Boarding_Aircraft_Lights
						}else{
							//_m setmarkerTypeLocal "empty";
						};
					};
				}; 
			};
		};
	};
}; 

//Check for ACE
JTK_ACE_Detected = if (isClass(configFile>>"CfgPatches">>"ace_main")) then {true}else{false};

JTK_HALO_Mask_Removal_Altitide = if (JTK_Bailout_02_Altitude >= 2000) then {JTK_Bailout_02_Altitude - 1000}else{JTK_Bailout_02_Altitude - 500};
//Distance Vars
JTK_HALO_RP_Min_Radius = 100;
JTK_HALO_Max_GPS_Zoom = 0.75;

JTK_HALO_Mask_Layer = 452;
JTK_HALO_Cinema_Border_Layer = 453;
JTK_HALO_GPS_Layer = 454;
JTK_HALO_GPS_Load_Layer = 455;
JTK_HALO_Action_Layer = 456; 
JTK_ProgressBar_Layer = 457; 
JTK_ClientSyncStatus_Layer = 1000;

JTK_Debug_Halo = false;

//Check if ACE ID set. If Not Disable ID switch in MP
if (JTK_ACE_Detected) then {
	_AceIdSet = configFile >> "CfgIdentities" >> "ACE_Original_Identity" >> "name";
	if ((getText(_AceIdSet) == "") OR (getText(_AceIdSet) != name player)) then {
		if (isMultiplayer) then {JTK_CanChangeID = false}else{JTK_CanChangeID = true};
	}else{JTK_CanChangeID = true};
}else{
	execVM (JTK_HALO_Path+"rsc\EHs.sqf"); 
}; 

//Team Switching In Singleplayer
if (!(isMultiplayer) AND (teamSwitchEnabled)) then {onTeamSwitch {[_from,_to] execVM (JTK_HALO_Path+"scripts\OnTeamSwitch.sqf")}};

//Killed EH to return gear if killed during jump 
player addEventHandler ["killed", {[] execVM (JTK_HALO_Path+"scripts\Player_Killed.sqf")}];

//Pass as PublicVariable to allow access if they change teams in mission
if (player == JTK_HALO_Command_Unit) then {player setVariable ["JTK_HALO_Setup_Access",true,true]};

//Define Variables For Calculating Min Zoom and Map Center
[player,false,true] execFSM (JTK_HALO_Path+"fsms\DefineMapVars.fsm");

//Handle Idenites
_faceType = if (JTK_Cammo_Faces) then {"JTK_Identity_Cammo"}else{"JTK_Identity"};
if (isMultiplayer) then {
	if ((!JTK_ACE_Detected) AND (JTK_Use_Identity_Config)) then {
		player setVariable ["JTK_Identities",_faceType call JTK_GetIdentity];
		player setIdentity ((player getVariable "JTK_Identities") select 0);
		if (ismultiplayer) then {JTK_Call_PVEH = [[player,((player getVariable "JTK_Identities") select 0)], compile "(_this select 0) setIdentity (_this select 1)"]; publicVariable  "JTK_Call_PVEH"}; 
		JTK_CanChangeID = true;
	};
}else{
	if ((!isMultiplayer) AND (JTK_Use_Identity_Config)) then {
		player setVariable ["JTK_Identities",_faceType call JTK_GetIdentity];
		player setIdentity ((player getVariable "JTK_Identities") select 0);
		JTK_CanChangeID = true;
		
		//Set IDs for AI Squad Members
		if (count units group player > 1) then {
			{_x setVariable ["JTK_Identities",_faceType call JTK_GetIdentity];_x setIdentity ((_x getVariable "JTK_Identities") select 0)} foreach (units group player -  [player]);
			JTK_AI_CanChangeID = true;
		}else{JTK_AI_CanChangeID = false}; 
	};
};

if (true) exitWith {};
