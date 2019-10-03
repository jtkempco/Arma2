//by Kempco
//Precompile common funcs\Define Global Variable EHs\exec Common Scripts\Also contains some random snippets
_debug = false;
//funcs
JTK_GetExitSpeed = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_GetExitSpeed.sqf");
JTK_DirToDirString = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_DirToDirString.sqf");
JTK_DirStringToReverseDirString = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_DirStringToReverseDirString.sqf");
JTK_DirStringToDir = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_DirStringToDir.sqf");
JTK_DirStringToReverseDir = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_DirStringToReverseDir.sqf");
JTK_GetRuck = Compile PreprocessFile (JTK_HALO_Path+"Funcs\JTK_fnc_GetRuck.sqf");
JTK_GetAttachPos = Compile PreprocessFile (JTK_HALO_Path+"Funcs\JTK_fnc_GetAttachPos.sqf");
JTK_GetMultiplier = Compile PreprocessFile (JTK_HALO_Path+"Funcs\JTK_fnc_GetMultiplier.sqf");
JTK_GetDirToAndSimplify = Compile PreprocessFile (JTK_HALO_Path+"Funcs\JTK_fnc_GetDirToAndSimplify.sqf");
JTK_GetPerimterPercentWater = Compile PreprocessFile (JTK_HALO_Path+"Funcs\JTK_fnc_GetPerimterPercentWater.sqf");
JTK_GetVectorUpAndDir = Compile PreprocessFile (JTK_HALO_Path+"Funcs\JTK_fnc_GetVectorUpAndDir.sqf");
JTK_GetNearestLand = Compile PreprocessFile (JTK_HALO_Path+"Funcs\JTK_fnc_GetDistanceToNearestLand.sqf");
JTK_InfoText = Compile PreprocessFile (JTK_HALO_Path+"Funcs\JTK_fnc_infoText.sqf");
JTK_HALO_GetMapOffset = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_getMapOffset.sqf");
//JTK_HALO_MouseHold = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_MouseHold.sqf");
JTK_HALO_KeyPressed = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_KeyPressed.sqf");
JTK_HALO_ScrollWheel = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_ScrollWheel.sqf");
JTK_GetZoomIncreament = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_GetZoomIncreament.sqf");
JTK_EjectUnitCheck = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_EjectUnitCheck.sqf");
JTK_GetROD = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_GetROD.sqf");
JTK_GetVelocity = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_GetVelocity.sqf");
JTK_Kinematics_GetTime = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_Kinematics_GetTime.sqf");
JTK_GetIdentity = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_GetIdentity.sqf");
JTK_GetPlayerExitSpeed = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_GetPlayerExitSpeed.sqf");
JTK_SimplifyDir = Compile PreprocessFile (JTK_HALO_Path+"funcs\JTK_fnc_SimplifyDir.sqf");


//Back up Bis Functions just incase.
if (isnil "bis_fnc_init") then {
	BIS_fnc_selectrandom = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_selectRandom.sqf");
	BIS_fnc_randomInt = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_randomIndex.sqf");
	BIS_fnc_distance2Dsqr = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_distance2Dsqr.sqf");
	BIS_fnc_dirTo = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_dirTo.sqf");
	BIS_fnc_distance2D = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_distance2D.sqf");
	BIS_fnc_isInFrontOf = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_isInFrontOf.sqf");
	BIS_fnc_relativeDirTo = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_relativeDirTo.sqf");
	BIS_fnc_relPos = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_relPos.sqf");
	BIS_fnc_spawnCrew = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_spawnCrew.sqf");
	BIS_fnc_spawnvehicle = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_spawnVehicle.sqf");
	BIS_fnc_selectCrew = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_selectCrew.sqf"); 
	BIS_fnc_returnVehicleTurrets = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_returnVehicleTurrets.sqf"); 
	BIS_fnc_returnConfigEntry = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_returnConfigEntry.sqf"); 
	BIS_fnc_variablespaceremove = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_variableSpaceRemove.sqf");
	BIS_fnc_areEqual = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_areEqual.sqf"); 
	BIS_fnc_colorRGBtoHTML = Compile PreprocessFile (JTK_HALO_Path+"funcs\bis\fn_colorRGBtoHTML.sqf");  	
};


//Dialog
JTK_HALO_Enter = Compile PreprocessFile (JTK_HALO_Path+"Dialog\Enter.sqf");
JTK_HALO_Reset = Compile PreprocessFile (JTK_HALO_Path+"Dialog\Reset.sqf");
JTK_RotateHeading = Compile PreprocessFile (JTK_HALO_Path+"Dialog\Rotate.sqf");
JTK_AdjustAltitude = Compile PreprocessFile (JTK_HALO_Path+"Dialog\Altitude.sqf");
JTK_AdjustDistance = Compile PreprocessFile (JTK_HALO_Path+"Dialog\Distance.sqf");
JTK_AdjustDistToMarker = Compile PreprocessFile (JTK_HALO_Path+"Dialog\DistanceToMarker.sqf");
JTK_HelpTxt = Compile PreprocessFile (JTK_HALO_Path+"Dialog\HelpTxt.sqf");
JTK_CapTxt = Compile PreprocessFile (JTK_HALO_Path+"Dialog\CapTxt.sqf");
JTK_Reset_Dlg = Compile PreprocessFile (JTK_HALO_Path+"Dialog\Open_Reset_Dlg.sqf");

//Scripts
JTK_Aircraft_SetPos = Compile PreprocessFile (JTK_HALO_Path+"scripts\SetAircraftPos.sqf");
JTK_ManageHaloGear = Compile PreprocessFile (JTK_HALO_Path+"scripts\ManageHaloGear.sqf");
JTK_HALO_Spawn_Veh = Compile PreprocessFile (JTK_HALO_Path+"scripts\VehDrop_SpawnVehicle.sqf");
JTK_HALO_Release_Veh = Compile PreprocessFile (JTK_HALO_Path+"scripts\VehDrop_ReleaseVehicle.sqf");
JTK_MonitorJumpStatus = Compile PreprocessFile (JTK_HALO_Path+"scripts\MonitorJumpStatus.sqf");
JTK_ForceViewDistance = Compile PreprocessFile (JTK_HALO_Path+"scripts\ManageViewDistance.sqf");
JTK_SpawnRabbits = Compile PreprocessFile (JTK_HALO_Path+"scripts\AirTrafficContrlRabbits.sqf"); 
//JTK_MarkerSimulation = Compile PreprocessFile (JTK_HALO_Path+"scripts\SimulateMrkrMove.sqf"); 
JTK_MarkDropZone = Compile PreprocessFile (JTK_HALO_Path+"scripts\MarkDropZone.sqf"); 
JTK_Spawn_Decoy = Compile PreprocessFile (JTK_HALO_Path+"scripts\Spawn_Decoy.sqf");
JTK_HALO_PlayerExec =  Compile PreprocessFile (JTK_HALO_Path+"scripts\PlayerExec.sqf");
//JTK_Animate_MV22 =  Compile PreprocessFile (JTK_HALO_Path+"scripts\Animate_MV22.sqf");
JTK_Spawn_Dummy =  Compile PreprocessFile (JTK_HALO_Path+"scripts\SpawnDummy.sqf");

//AI Scripts
JTK_AI_RestoreUnit = Compile PreprocessFile (JTK_HALO_Path+"scripts\AI\RestoreUnit.sqf"); 
JTK_AI_AttachToStatic = Compile PreprocessFile (JTK_HALO_Path+"scripts\AI\AttachToStatic.sqf");
JTK_AI_RestoreGear = Compile PreprocessFile (JTK_HALO_Path+"scripts\AI\RestoreGear.sqf"); 
JTK_AI_AutoBoard = Compile PreprocessFile (JTK_HALO_Path+"scripts\AI\AutoBoard.sqf"); 
JTK_AI_GetGear = Compile PreprocessFile (JTK_HALO_Path+"scripts\AI\GetGear.sqf"); 
JTK_AI_RestoreSwitch = Compile PreprocessFile (JTK_HALO_Path+"scripts\AI\RestoreSwitch.sqf"); 


//Cammera Scripts and Funcs
JTK_GetCamPosArray = Compile PreprocessFile (JTK_HALO_Path+"Scripts\Cammera\JTK_fnc_GetPosArray.sqf");
JTK_GetCargoDoorAnim = Compile PreprocessFile (JTK_HALO_Path+"Scripts\Cammera\JTK_fnc_GetDoorAnim.sqf");
JTK_Camera_Transition_1 = Compile PreprocessFile (JTK_HALO_Path+"Scripts\Cammera\Transition_1.sqf");
JTK_Camera_Transition_2 = Compile PreprocessFile (JTK_HALO_Path+"Scripts\Cammera\Transition_2.sqf");

//Static Scripts
JTK_Static_Doors = Compile PreprocessFile (JTK_HALO_Path+"scripts\Static\Doors.sqf");
JTK_Static_Shake = Compile PreprocessFile (JTK_HALO_Path+"scripts\Static\Shake.sqf");
JTK_Static_EngineSound = Compile PreprocessFile (JTK_HALO_Path+"scripts\Static\EngineSound.sqf");    


//HALO Scripts
JTK_HALO_CloudEffects = Compile PreprocessFile (JTK_HALO_Path+"scripts\HALO\CloudEffects.sqf");
JTK_HALO_SoundLoop_1 = Compile PreprocessFile (JTK_HALO_Path+"scripts\HALO\SoundLoop_1.sqf");
JTK_HALO_SoundLoop_2 = Compile PreprocessFile (JTK_HALO_Path+"scripts\HALO\SoundLoop_2.sqf");
JTK_HALO_Freefall = Compile PreprocessFile (JTK_HALO_Path+"scripts\HALO\FreeFall.sqf");
JTK_HALO_Parachute = Compile PreprocessFile (JTK_HALO_Path+"scripts\HALO\Parachute.sqf");
JTK_HALO_AddChute = Compile PreprocessFile (JTK_HALO_Path+"scripts\HALO\AddChute.sqf");
JTK_HALO_Landing = Compile PreprocessFile (JTK_HALO_Path+"scripts\HALO\Landing.sqf");

//RSC
JTK_GPS_AnimateModeBttn	= Compile PreprocessFile (JTK_HALO_Path+"rsc\AnimateModeBttn.sqf");
JTK_ProgressBar = Compile PreprocessFile (JTK_HALO_Path+"rsc\ProgressBar.sqf");
JTK_Open_GPS = Compile PreprocessFile (JTK_HALO_Path+"rsc\Open_GPS.sqf");
JTK_CinemaBorder = Compile PreprocessFile (JTK_HALO_Path+"rsc\CinemaBorder.sqf");
JTK_GPS_LoadScreen = Compile PreprocessFile (JTK_HALO_Path+"rsc\Open_GPS_LoadScreen.sqf");

//Addactioins Executed via PVEHs
JTK_Setup_GetAddActn = Compile PreprocessFile (JTK_HALO_Path+"scripts\Addactions\HALO_SetUp.sqf");
JTK_GetIn_GetAddActn = Compile PreprocessFile (JTK_HALO_Path+"scripts\Addactions\Get_In_Ride_in_Back.sqf");
JTK_Takeoff_GetAddActn = Compile PreprocessFile (JTK_HALO_Path+"scripts\Addactions\Clear_For_Takeoff.sqf");
JTK_Reset_GetAddActn = Compile PreprocessFile (JTK_HALO_Path+"scripts\Addactions\Cancel_HALO.sqf");
JTK_Capture_GetAddActn = Compile PreprocessFile (JTK_HALO_Path+"scripts\Addactions\HALO_Capture.sqf");

#include "scripts\Common.sqf"
#include "scripts\Common_Text.sqf"
#include "scripts\Common_RSC.sqf"
#include "scripts\Common_Arrays.sqf"
#include "scripts\Common_EHs.sqf"
#include "scripts\ACE_WorkArounds.sqf"
#include "rsc\ActionWheel.sqf"

"JTK_Call_PVEH" addPublicVariableEventHandler {((_this select 1) select 0) call ((_this select 1) select 1)};
"JTK_Spawn_PVEH" addPublicVariableEventHandler {((_this select 1) select 0) spawn ((_this select 1) select 1)};

JTK_HALO_Funcs_Compiled = true;
if (_Debug) then {HintSilent "All Scripts Compiled"};







