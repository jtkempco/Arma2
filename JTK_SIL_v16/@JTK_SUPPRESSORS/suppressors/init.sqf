/*
by Kempco 
JTK Suppressors Script v1.6 
----------------------------------------------Changelog------------------------------------------------
version 1.6
Added: ACR DLC Weapons (NOT Added to Weapons Crate. CgfPatch Reffernce needed). 
Fixed: (ACE version) "ACE_AKMS" and "ACE_AKMS_SD".
Fixed: (ACE version) Option would be available while player was in a vehicle.

version 1.5
Changed: (Addon version only) CBA is required 
Changed: (Addon version only) Module disables the use of suppressors instead of enabling them.
Added: (Script version only) Script will terminate if it detects player has addon version running.
Added: Bis weapons in ammo crate are added according to DLCs detected.

version 1.4
New:   No Addons required!
New:   Pistols are now supported
New:   Sound effects (Idea courtesy of st-alpha)  
New:   Script version now requires sound config be defined in Description.
New:   Demo mission included for both the addon and script versions.
New:   Addon version now requires a (JTK) Suppressors Module be placed on the map. 
New:   JTK SF Weapons Crate/Script: Includes unsuppressed versions of all suppressable weapons according to your addons. 
Added: RH Pistol pack Remake (by Robbert Hammer) 
Added: RH SMG pack (by Robbert Hammer) 
Added: "ace_akms_sd","ace_ak74m_sd","ace_ak74m_sd_kobra_f","ace_aks74_un" 

version 1.2
Added: ACE progress bar (Idea courtesy of st-alpha)
Added: Mod Version added (signiturs not included.)
Added: UFK Weapons Pack v1.1 (by the UKForces Team)
Added: L119A1 Pack v2.01 (by Lennard)
Added: FHQ Remington Weapon Pack v1.1 (by Alwarren)

version 1.1
Added: Design mastery M4s (by Hogthar & Mlacix)
Added: 10 sec initialization delay. (Prevent conflicts with addons using the ACE self-interaction menu).	
--------------------------------------------------------------------------------------------------------	
*/


//Key pressed for no ace version input here.
//Left_Windows = 219
//Right_Windows = 220
JTK_SL_Key = 219;


if (isdedicated) exitWith {};

WaitUntil{!isNull player};
_dly = if (isClass(configFile>>"CfgPatches">>"ace_main")) then {10}else{5};
sleep _dly;


_terminate = [false,""];
if !(_terminate select 0) then {
	if (isClass(configFile>>"CfgPatches">>"jtk_suppressors")) exitwith {_terminate = [true,"Addon Version already running."]};
	if (!isnil "JTK_Disable_Suppressors") then {
		if (JTK_Disable_Suppressors) exitWith {_terminate = [true,"Disabled by mission maker"]}
	};
};
if (_terminate select 0) exitWith {
	_dly = if (isMultiplayer) then {20}else{5};
	sleep _dly;
	_txt_0 = "----------------------JTK DEBUG----------------------";
	_txt_1 = "JTK Suppressor Script Terminated.";
	_txt_2 = format ["REASON: %1",(_terminate select 1)];
	{[playerSide,"HQ"] commandChat format ["%1",_x]} foreach [_txt_0,_txt_1,_txt_2,_txt_0];
};

#include "common.sqf"

//JTK_SIL_Path = "jtk_suppressors\";
JTK_SIL_Path = "jtk\suppressors\";

JTK_SIL_GetUnitStance 		= Compile PreprocessFile (JTK_SIL_Path+"funcs\GetUnitStance.sqf");
JTK_SIL_GetAssualtRifles 	=  Compile PreprocessFile (JTK_SIL_Path+"funcs\getAssualtRifles.sqf");
JTK_SIL_GetSniperRifles		=  Compile PreprocessFile (JTK_SIL_Path+"funcs\getSniperRifles.sqf");
JTK_SIL_GetPistols		=  Compile PreprocessFile (JTK_SIL_Path+"funcs\getPistols.sqf");
JTK_SIL_CheckIsPistol  		=  Compile PreprocessFile (JTK_SIL_Path+"funcs\CheckIsPistol.sqf");
JTK_SIL_ACE_actn 		=  Compile PreprocessFile (JTK_SIL_Path+"scripts\ACE_actn.sqf");
JTK_SIL_getActn			=  Compile PreprocessFile (JTK_SIL_Path+"scripts\getActn.sqf");
JTK_SIL_handleMags		=  Compile PreprocessFile (JTK_SIL_Path+"scripts\handleMags.sqf");
JTK_SIL_PlaySound 		=  Compile PreprocessFile (JTK_SIL_Path+"scripts\PlaySound.sqf");
JTK_SIL_LoadCrate		=  Compile PreprocessFile (JTK_SIL_Path+"scripts\WeaponsCrate.sqf");



JTK_FHQ_Fix			=  Compile PreprocessFile (JTK_SIL_Path+"funcs\FHQ_fix.sqf");

JTK_SIL_Progressbar		=  Compile PreprocessFile (JTK_SIL_Path+"funcs\ProgressBar.sqf");
JTK_SIL_BlockInput		={disableUserInput true; 0.05 spawn {sleep _this; disableUserInput false};true};
JTK_BIS_CreateCounDownLine	=  Compile PreprocessFile (JTK_SIL_Path+"funcs\BIS_createCountdownLine.sqf");



if (isClass(configFile>>"CfgPatches">>"ace_main")) then {
	["player",[ace_sys_interaction_key_self],3,[(JTK_SIL_Path+"scripts\InteractionMenu_add.sqf"),"main"]] call  CBA_ui_fnc_add;
}else{
	[player] execFSM (JTK_SIL_Path+"MonitorCurrentWeapon.fsm");
	_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call JTK_SIL_KeyDown_EH"];
	_EH = (findDisplay 46) displayAddEventHandler ["KeyUp","_this call JTK_SIL_KeyUp_EH"]; 
};

if (!isNil "JTK_Suppressor_Units") then {
	if (player in JTK_Suppressor_Units) then {
		player setVariable ["JTK_Can_Use_AssualtRifle_Suppressors",true];
		player setVariable ["JTK_Can_Use_SniperRifle_Suppressors",true];
	}else{
		player setVariable ["JTK_Can_Use_AssualtRifle_Suppressors",false];
		player setVariable ["JTK_Can_Use_SniperRifle_Suppressors",false];
	};
}else{	 
	if (!isNil "JTK_Sniper_Rifle_Suppressors_Restriced_To") then {
		if (((typeof player) in JTK_Sniper_Rifle_Suppressors_Restriced_To) OR (player in  JTK_Sniper_Rifle_Suppressors_Restriced_To)) then {
			player setVariable ["JTK_Can_Use_SniperRifle_Suppressors",true]	
		}else{
			player setVariable ["JTK_Can_Use_SniperRifle_Suppressors",false]
		};
	}else{player setVariable ["JTK_Can_Use_SniperRifle_Suppressors",true]};

	if (!isNil "JTK_Assualt_Rifle_Suppressors_Restriced_To") then {
		if (((typeof player) in JTK_Assualt_Rifle_Suppressors_Restriced_To) OR (player in  JTK_Assualt_Rifle_Suppressors_Restriced_To)) then {
			player setVariable ["JTK_Can_Use_AssualtRifle_Suppressors",true]
		}else{
			player setVariable ["JTK_Can_Use_AssualtRifle_Suppressors",false]
		};
	}else{player setVariable ["JTK_Can_Use_AssualtRifle_Suppressors",true]};
};

JTK_Suppressors_Init_Done = true;






 




