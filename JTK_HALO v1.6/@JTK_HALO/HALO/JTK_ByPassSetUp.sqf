//by Kempco
//HALO CAPTURE and setup for mission makers.
sleep 5; 
//player globalChat "By Pass Started";
if (!isserver) exitWith {};
/*
STEP 1: PASTING THE DATA COLLECTED FROM THE CAPTURE:

	EX:
		_HALO_CAPTURE_DATA = CAPTURED DATA HERE
		_HALO_CAPTURE_DATA = [WEST,[5402.08,7234.54,7000],180,0,[5402.08,6459.54,0]];	 
*/
//Paste the data copied to clipboard from Capture here.

_HALO_CAPTURE_DATA = nil;

//-------------------------------------------------------------------------//
//=============================YOU ARE DONE================================//
//-------------------------------------------------------------------------//	

_CAPTURE_DATA = if ((isNil "JTK_HALO_CAPTURE_DATA") AND (!isNil "_HALO_CAPTURE_DATA")) then {_HALO_CAPTURE_DATA}else{JTK_HALO_CAPTURE_DATA};

if (isNil "_CAPTURE_DATA") exitWith {};

_side 		= _CAPTURE_DATA select 0;
_aircraft 		= _CAPTURE_DATA select 1;
_rallypoint 	= _CAPTURE_DATA select 2;
_pos 			= _CAPTURE_DATA select 3;
_dir 			= _CAPTURE_DATA select 4;
_dir2 		= _CAPTURE_DATA select 5;

JTK_Aircraft_ReadyToBoard = false;

_trig = createTrigger ["EmptyDetector",position _aircraft];
_trig setTriggerActivation [str(_side),"PRESENT",true];
_trig settriggerArea [25,25,0,false];
_trig setTriggerStatements ["this AND !JTK_Aircraft_ReadyToBoard","JTK_Aircraft_ReadyToBoard = true","JTK_Aircraft_ReadyToBoard = false"]; 
	
While {true} do {
	WaitUntil {(JTK_Aircraft_ReadyToBoard) AND !(_aircraft getVariable "JTK_HALO_Takeoff")};
	if !(isMultiplayer) then {player setVariable ["HALO_AI_RallyPoint",_rallypoint]};
	if (isServer) then{
		_CAPTURE_DATA spawn JTK_Aircraft_SetPos;
	}else{
		JTK_Spawn_PVEH = [_CAPTURE_DATA ,JTK_Aircraft_SetPos];
		publicVariable "JTK_Spawn_PVEH";
	};
	WaitUntil {!(JTK_Aircraft_ReadyToBoard) AND (_aircraft getVariable "JTK_HALO_Takeoff")};
};
