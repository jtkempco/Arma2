//by Kempco
disableSerialization;

_display = _this select 0;
_mask_Cntrl = _display displayCtrl 0; 
uiNamespace setVariable ["JTK_Halo_Bailout_Mask", _display];
_C130 = JTK_Server getVariable format["JTK_C130_%1",side player]; 
_static = _C130 getVariable "JTK_C130_STATIC";


//For Use with ACE self Interaction Key
if ((JTK_ACE_Detected) AND (isNil "JTK_02MaskAceMenuAdd")) then {
	JTK_02MaskAceMenuAdd = true;
	["player",[ace_sys_interaction_key_self],3,[(JTK_HALO_Path+"scripts\InterActionMenu_Add.sqf"),"main"]] call CBA_ui_fnc_add;
};


if (player hasWeapon "NVGoggles") then {
	player spawn {
		_NVGs_Lost = false;
		While {(alive _this) AND (getPosATL _this select 2 > 1) AND (_this hasweapon "NVGoggles")} do {
			_ROD = round(abs(velocity vehicle _this select 2));
			if ((_ROD > 40) AND (currentVisionMode _this == 1)) then {
				While {(_ROD > 40) AND (_this hasweapon "NVGoggles")} do {
					if ((random 1 >= 0.9) AND (_ROD > 40)) then {
						_this removeWeapon "NVGoggles";
						_this GlobalChat "You lost Your NVGs!!";
					};
					sleep 1;
				};
			};
			sleep 1;
		};
	};
};

//Exit if not needed but save uinamespace var
if !(_C130 getVariable "JTK_02_Required") exitWith {JTK_HALO_Mask_Layer CutRsc ["default", "plain down"]};

//Set ID if Aplicable
if (JTK_CanChangeID) then {["JTK_HALO_Bailout_Mask_Event",[player,JTK_Oxygen_Mask_ID]] call CBA_fnc_globalEvent};

//Must Have Mask Because they are wearing it
player setVariable ["JTK_HALO_HasOxygenMask",true];
	
//Create Sound Source (Used H pad so sound would terminate immedialty)
_soundSource = "HeliHEmpty" createVehicle position player;
_soundSource spawn {
	Waituntil {!isNull _this};
	_this attachTo [player,[0,0,0]];
	While {(format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No Display") AND (alive player)} do {
		_this say3d "JTK_Breathing";
		sleep 3.7;
	};
	deleteVehicle _this;
};	
			
//May need to retrive this outside of current script
player setVariable ["Halo_Breathing_FX_Source",_soundSource];

//Mask Removeal Loop
player spawn {
	While {(_this getVariable "JTK_HALO_HasOxygenMask") AND ((getPos _this select 2) > 2) AND (alive _this)} do {
		if (format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No Display") then {
			_this setVariable ["JTK_HALO_CanEquipMask",false];
			if (getposATL player select 2 < JTK_HALO_Mask_Removal_Altitide) then {
				_ROD = round(abs(velocity vehicle _this select 2));
				if (_ROD <= 15) then { 
					_this setVariable ["JTK_HALO_CanRemoveMask",true];
				};
			};
		};
		if (format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] == "No Display") exitWith {
			_this setVariable ["JTK_HALO_CanEquipMask",false];
		};
	
		if (format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] == "No Display") then {
			_this setVariable ["JTK_HALO_CanRemoveMask",false];
			_ROD = round(abs(velocity vehicle _this select 2));
			if (_ROD <= 15) then { 
				_this setVariable ["JTK_HALO_CanEquipMask",true];
			};
		};
		sleep 1;
	};
	
	if (format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No Display") then {
		_this setVariable ["JTK_HALO_CanRemoveMask",true];
	};
	/*
	if (getpos _this select 2 <= 2) then {
		_this setVariable ["JTK_HALO_CanRemoveMask",false];
		_this setVariable ["JTK_HALO_CanEquipMask",false];
		_this setVariable ["JTK_HALO_HasOxygenMask",false];
	};
	*/
	
};

//Make Mask Overlay When Map is open to read notes
player spawn {
	disableSerialization;
	_cntrl = (uiNamespace getVariable "JTK_Halo_Bailout_Mask") displayCtrl 0;
	While {(_this getVariable "JTK_HALO_HasOxygenMask") AND ((getPosATL _this select 2) > 1) AND (alive _this)} do {
		if (format ["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No Display") then {
			if (visibleMap) then {
				_cntrl ctrlSetBackgroundColor [1,1,1,0.25];
				WaitUntil {!(visibleMap) OR !(alive _this) OR ((getPosATL _this select 2) <= 1) OR (format ["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No Display")};
			};
			if !(visibleMap) then {
				_cntrl ctrlSetBackgroundColor [1,1,1,1];
				WaitUntil {(visibleMap) OR !(alive _this) OR ((getPosATL _this select 2) <= 1) OR (format ["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No Display")};
			};
		};	
	};
};

				

			
/*

if (JTK_CanChangeID) then {
	[] spawn {
		While {(format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No display")} do {sleep 1};		
		if (JTK_CanChangeID) then {
			if (JTK_ACE_Detected") then {
				["JTK_HALO_Bailout_Mask_Event",[player,"ACE_Original_Identity"]] call CBA_fnc_globalEvent
			}else{
				["JTK_HALO_SetIdentity_Event",[player,(player getVariable "JTK_Identities") select 0]] call CBA_fnc_globalEvent;
			};
		};
	};
};



