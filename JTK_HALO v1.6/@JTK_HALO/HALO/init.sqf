/*
JTK HALO v1.6

by Kempco
*/
//==========================OPTIONS===============================//
//----------------------------------------------------------------//

JTK_HALO_Path = "JTK\HALO\";

//Halo Setup Restrictions 
JTK_HALO_Command_Unit = leader group player; 

//Minimum HALO Altitude
JTK_HALO_min_alt_C130 = 2000;
JTK_HALO_min_alt_MV22 = 1000;

//Maximum HALO Altitude
JTK_HALO_max_alt_C130 = 10000;
JTK_HALO_max_alt_MV22 = 5000;

//Minimum Altitude Requiring Oxygen 
JTK_Bailout_02_Altitude = 6000;

//Air speed used to determine the velocity of a unit upon exiting the C130
JTK_HALO_air_speed_C130 = 300;
JTK_HALO_air_speed_MV22 = 175;

//Altitude AI will Deploy Chutes
JTK_HALO_AI_DeployChuteAlt = 250;

//Margin of Error For JTK Jump computer Altimeter 
JTK_GPS_Altitude_Error_Margin = 0;

//Class Name for Oxygen Mask ID
JTK_Oxygen_Mask_ID = "Pilot_Mask_v";

//Define Pilot classes 
JTK_HALO_Pilot_Type_West = "US_Soldier_Pilot_EP1"; //West
JTK_HALO_Pilot_Type_East = "TK_Soldier_Pilot_EP1"; //EAST

//Allow JTK Identities (Ignore if using ACE).
JTK_Use_Identity_Config = true;

//JTK Idenetites with cammo faces (requires JTK_Use_Identity_Config is true.Ignore if using ACE).  
JTK_Cammo_Faces = true;

//Altitude for Water Insertions
JTK_HALO_Water_Insertion_Altitude = 500;

//Minimum Distance From Land For Water Insertion
JTK_HALO_Water_Insertion_MinDistToLand = 350;

//Show arrow that indicate boarding positions on the aircraft.
JTK_HALO_Show_Boarding_Arrows = true;

//HALO Cooldown Delay (al values below 60 will be ignored).
JTK_HALO_Cooldown = 60;

//--------------ACE Options-----------------//
//Disable ACE Altimeter.
JTK_HALO_Disable_ACE_Altimeter = true;

//Disable JTK Jump Computer When Using ACE
JTK_HALO_Disable_Jump_Computer = false;

//Chute Backpack Model Used in Single Player to simulate Parachute. (NOTE: Do NOT use the "ACE_ParachutePack").
JTK_ACE_HALO_CHUTE = "ACE_Backpack_US";

//WIP: Set to true to copy And Paste HALO position to clipboard, you can then use that to bypass HALO setup.
_Capture = false;

//WIP: Execute ByPass Here
_ByPass = false;
//-----------------------------------------------------------------------------//

//==============================YOU ARE DONE===================================//
//-----------------------------------------------------------------------------//
//=============================================================================//


JTK_HALO_Capture = if (!isNil "JTK_HALO_Capture") then {JTK_HALO_Capture}else{_Capture};
JTK_HALO_ByPass  = if (!isNil "JTK_HALO_ByPass") then {JTK_HALO_ByPass}else{_ByPass};

if (isserver) then {execVM "JTK\HALO\init_server.sqf"}else{execVM "JTK\HALO\init_client.sqf"};







