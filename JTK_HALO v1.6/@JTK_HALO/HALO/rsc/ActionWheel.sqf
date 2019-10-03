//by Kempco

#define AW_Chute_T "<t shadow='2'><t color='#FF0000'><t size='1.75'><t valign='middle'>-Cut Chute-</t>"
#define AW_Chute_C "(player != vehicle player) AND (alive player) AND ((player getVariable 'JTK_HALO_Status') != 'DONE') AND ((player getVariable 'JTK_HALO_Status') != 'SWIMMING') AND ((format['%1',(uiNamespace getVariable'JTK_HALO_Action_Wheel')]) != 'No display')"

#define AW_GPS_T "<t shadow='2'><t color='#FAB909'><t size='1.75'><t valign='middle'>-GPS: Toggle Display Mode-</t>"
#define AW_GPS_C "(player != vehicle player) AND (alive player) AND ((player getVariable 'JTK_HALO_Status') != 'DONE') AND ((player getVariable 'JTK_HALO_Status') != 'SWIMMING') AND ((format['%1',(uiNamespace getVariable'JTK_HALO_Action_Wheel')]) != 'No display') AND ((player getVariable 'HALO_GPS_Status') == 'ON')"

#define AW_Mask_T "<t shadow='2'><t color='#ffffff'><t size='1.75'><t valign='middle'>-Remove Oxygen Mask-</t>"
#define AW_Mask_C "(player != vehicle player) AND (alive player) AND ((player getVariable 'JTK_HALO_Status') != 'DONE') AND ((player getVariable 'JTK_HALO_Status') != 'SWIMMING') AND (getPos player select 2 <= JTK_HALO_Mask_Removal_Altitide) AND ((format['%1',(uiNamespace getVariable'JTK_Halo_Bailout_Mask')]) != 'No display') AND ((format['%1',(uiNamespace getVariable'JTK_HALO_Action_Wheel')]) != 'No display')"

#define JTK_AW_Chute ["Chute",1,0,AW_Chute_T,AW_Chute_C,player] 
#define JTK_AW_GPS ["GPS",2,nil,AW_GPS_T,AW_GPS_C,player]
#define JTK_AW_Mask ["Mask",3,nil,AW_Mask_T,AW_Mask_C,player]

//-------------------Display EHs----------------------------//
JTK_AW_MouseButton_EH = {
	_button = _this select 1;
	_handled = false;
	_unit = player;
	if (typeName (player getVariable 'JTK_AW_Selection') == 'ARRAY') then {
		_control = (_unit getVariable 'JTK_AW_Selection') select 0;
		_func = (_unit getVariable 'JTK_AW_Selection') select 1;
		_handled = true;
		if (_button == 0) then {_unit call _func}else{_unit globalChat ''};
	};
	if (_button == 1) then {
		disableUserInput true;
		_handled = true;
		{_x ctrlShow false} foreach JTK_AW_Displays;
		_unit setVariable ['JTK_AW_Faded',true];
		disableUserInput false;
	};	
	_handled 
};
JTK_AW_MouseWheel_EH = {
	disableSerialization;
	_scroll_value = _this select 1;
	_handled = false;
	_unit = player;
	_sel = (uiNamespace getVariable 'JTK_HALO_Action_Wheel') displayCtrl 0;
	_y = (ctrlPosition _sel) select 1;
	_inc = JTK_AW_inc;
	
	JTK_AW_FadeDelay = round(time + 12);
	[JTK_AW_FadeDelay,time] spawn JTK_AW_FadeTimer;
		
	if (_scroll_value > 0) then {
		if ((_y - _inc) >= JTK_Scroll_Y_min) then {
			_handled = true; 
			_sel ctrlSetPosition [(ctrlPosition _sel select 0),(ctrlPosition _sel select 1)-_inc];
			_sel ctrlCommit  0; 
		};
	};
	if (_scroll_value < 0) then {
		if ((_y + _inc) <= JTK_Scroll_Y_max) then {
			_handled = true; 
			_sel ctrlSetPosition [(ctrlPosition _sel select 0),(ctrlPosition _sel select 1)+_inc];
			_sel ctrlCommit  0; 
		};
	};
	if (_unit getVariable 'JTK_AW_Faded') then {
		_handled = true; 
		{_x ctrlShow true} foreach JTK_AW_Displays;
		_unit setVariable ['JTK_AW_Faded',false];
	};
	if (_handled) then {(ctrlPosition _sel select 1) call JTK_AW_UpDateSel};
	_handled
};
//----------------------------------------------------------//


JTK_AW_CleanUp = {
	JTK_HALO_Action_Layer cutRsc ['default', 'Plain'];
	for "_i" from 0 to (count JTK_AW_EHs - 1) do {(finddisplay 46) DisplayRemoveEventHandler (JTK_AW_EHs select _i)};
};



JTK_AW_FadeTimer = {
	_WaitTill 	= _this select 0;
	_time 	= _this select 1;
	_unit		= player;
	_dly 		= abs((round _time) - (round _WaitTill));
	
	While {_dly > 0} do {
		sleep 1;
		_dly  = _dly - 1;
		if ((_WaitTill != JTK_AW_FadeDelay) OR (_dly == 0)) exitWith {};
	}; 
	if (_WaitTill == JTK_AW_FadeDelay) then {
		disableSerialization;
		{_x ctrlShow false} foreach JTK_AW_Displays;
		_unit setVariable ['JTK_AW_Faded',true];
	};
};

JTK_AW_MonitorGPSVarChange = {
	_unit = _this select 0;
	_status = _this select 1;
	WaitUntil {((_unit getVariable "HALO_GPS_Status") != _status)};
	_unit setVariable ["JTK_AW_GPS_StatusVarChange",true];
}; 


JTK_AW_GetFunc = {
	private ["_func"];
	switch (_this) do {
		case "JTK_AW_Chute_f":{_func = JTK_AW_Chute_f};
		case "JTK_AW_GPS_f":{_func = JTK_AW_GPS_f};
		case "JTK_AW_Mask_f":{_func = JTK_AW_Mask_f};
	};
	_func
};

JTK_AW_Chute_f = {
	call JTK_AW_CleanUp;
	
	_chute = vehicle _this;
	_dir = direction (_chute);
	_spd = (velocity _chute select 2);
	moveOut _this;
	//_this attachTo [_chute,[0,0,-1]];
	_this setPos (_chute modelToWorld [0,0,-1.5]);
	_chute spawn {sleep 0.1; deleteVehicle _this};
	[_this,_dir,_spd] spawn {
		_unit = _this select 0;
		_dir = _this select 1;
		_spd = _this select 2;
		WaitUntil {_unit == vehicle _unit};
		
		_chuteStatus = _unit getVariable "JTK_HALO_Chute_Status";
		switch (_chuteStatus) do {
			case "Primary":{_unit setVariable ["JTK_HALO_Chute_Status","Reserve"]};
			case "Reserve":{_unit setVariable ["JTK_HALO_Chute_Status",false]};
		};
		
		if (position _unit select 2 > 20) exitWith {
			if (typeName(_unit getVariable "JTK_HALO_Chute_Status") != "BOOL") then {
				_unit addBackpack "US_Backpack_Specops_EP1";
				[_unit] call JTK_HALO_Freefall;
			}else{
				_unit switchmove "HaloFreeFall_non";
				if (isMultiplayer) then {JTK_HALO_Freefall_Anim = [_unit,"HaloFreeFall_non"];publicVariable "JTK_HALO_Freefall_Anim"};//Braodcast globally
			};
		};
		if (position _unit select 2 < 5) then {[_unit,_spd] spawn JTK_HALO_Landing};
	};
};

		
JTK_AW_GPS_f = {				
	_new_mode = if (_this getVariable 'HALO_GPS_Mode' == 'COORDS') then {'MAP'}else{'COORDS'}; 
	_this setVariable ['HALO_GPS_Mode',_new_mode];
};

JTK_AW_Mask_f = {
	disableSerialization;
	if (!local _this) exitWith {};
	JTK_HALO_Mask_Layer cutRsc ['default', 'Plain'];
	call JTK_AW_CleanUp;
	
	_this setIdentity ((_this getVariable "JTK_Identities") select 0);
	if (ismultiplayer) then {JTK_Call_PVEH = [[_this,((_this getVariable "JTK_Identities") select 0)], compile "(_this select 0) setIdentity (_this select 1)"]; publicVariable "JTK_Call_PVEH"};
	[_this] call JTK_Open_ActionWheel; 
};



JTK_AW_UpDate_GPS_f = {
	_this spawn {
		disableSerialization;
		_IsFaded = if (ctrlShown ((uiNamespace getVariable "JTK_HALO_Action_Wheel") displayCtrl 1)) then {false}else{true};
		sleep 0.1;  
		call JTK_AW_CleanUp;
		if (((_this getVariable "JTK_HALO_Status") == "DONE") OR ((_this getVariable "JTK_HALO_Status") == "SWIMMING")) exitWith {call JTK_AW_CleanUp};
		WaitUntil{((format['%1',(uiNamespace getVariable'JTK_HALO_Action_Wheel')]) == 'No display')};
		[_this,_IsFaded] call JTK_Open_ActionWheel;
	}; 
};
	
JTK_AW_UpDateSel = {
	disableSerialization;
	for "_i" from 0 to (count JTK_AW_Array - 1) do {
		_array = JTK_AW_Array select _i;
		_type = _array select 0;
		_index = (_array select 2) + 1;
		_control = ((uiNamespace getVariable "JTK_HALO_Action_Wheel") displayCtrl _index);
		_control_y = JTK_Scroll_Y_min + (_i*JTK_AW_inc);
		
		if (_control_y == _this) then {
			if (ctrlShown _control) then {
				_str = "JTK_AW_" + _type + "_f";
				_func = _str call JTK_AW_GetFunc;
				_control ctrlSetBackgroundColor [0.322,0.667,0.118,0.475];
				player setVariable ["JTK_AW_Selection",[_control,_func]];
			};		 
		}else{_control ctrlSetBackgroundColor [0,0,0,0]};
	};
};


JTK_AW_Loop = {
	disableSerialization;
	_name 	= _this select 0;
	_cntrl 	= _this select 1;
	_index 	= _this select 2;
	_txt 		= _this select 3;
	_Condition 	= _this select 4; 
	_unit		= _this select 5;
	_code 	= compile _Condition; 
	
	if (_unit getVariable "JTK_AW_Faded") then {_cntrl ctrlShow false}else{_cntrl ctrlShow true};
	
	While {(alive _unit) AND ((_unit getVariable "JTK_HALO_Status") != "DONE") AND ((_unit getVariable "JTK_HALO_Status") != "SWIMMING")} do {
		if (_unit call _code) then {
			_cntrl ctrlSetStructuredText parseText _txt;
			WaitUntil {!(_unit call _code) OR (_unit getVariable "JTK_AW_GPS_StatusVarChange")};	
		};
		if ((_cntrl == (uiNamespace getVariable "JTK_HALO_Action_Wheel") displayCtrl 1)) then {
			_unit call JTK_AW_UpDate_GPS_f;
			WaitUntil {((format['%1',(uiNamespace getVariable'JTK_HALO_Action_Wheel')]) == 'No display')};
		};
		if (((format['%1',(uiNamespace getVariable'JTK_HALO_Action_Wheel')]) == 'No display') OR !(alive _unit) OR ((_unit getVariable "JTK_HALO_Status") == "DONE")) exitWith {call JTK_AW_CleanUp};
		
		if !(_unit call _code) then {
			_cntrl ctrlShow false;
			WaitUntil {(_unit call _code) OR (_unit getVariable "JTK_AW_GPS_StatusVarChange")};
		};
	};
};



		
		

JTK_BailOut_Mask = {
	_this spawn {
		disableSerialization;
		_unit = _this select 0;
		JTK_HALO_Mask_Layer cutRsc ['JTK_HALO_BAILOUT_MASK_RSC', 'Plain'];
		_display = uiNamespace getVariable "JTK_Halo_Bailout_Mask";
		WaitUntil {!isNil "_display"};
		
		_breakOut = false;
		
		if (count _this > 1) then {
			JTK_HALO_Mask_Resource_Defined = true;
			_breakOut = if ((JTK_CanChangeID) AND ( _this select 1)) then {false}else{true};  
		};
		
		if (_breakOut) exitWith {JTK_HALO_Mask_Layer cutRsc ['Default', 'Plain']};
		
		//For Use with ACE self Interaction Key
		if ((JTK_ACE_Detected) AND (isNil "JTK_02MaskAceMenuAdd")) then {
			JTK_02MaskAceMenuAdd = true;
			["player",[ace_sys_interaction_key_self],3,[(JTK_HALO_Path+"scripts\InterActionMenu_Add.sqf"),"main"]] call CBA_ui_fnc_add;
		};
	
		if (_unit hasWeapon "NVGoggles") then {_unit spawn JTK_HALO_Monitor_NVGs}; 
		
		//Set ID if Aplicable
		if (JTK_CanChangeID) then {
			player setIdentity JTK_Oxygen_Mask_ID;
			if (ismultiplayer) then {JTK_Call_PVEH = [[player,JTK_Oxygen_Mask_ID], compile "(_this select 0) setIdentity (_this select 1)"]; publicVariable "JTK_Call_PVEH"};
		};
		
		//Create Sound Source (Used H pad so sound would terminate immedialty)
		_soundSource = "HeliHEmpty" createVehicle position _unit;
		_soundSource spawn {
			Waituntil {!isNull _this};
			_this attachTo [player,[0,0,0]];
			While {(format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No display") AND (alive player)} do {
				_this say3d "JTK_Breathing";
				sleep 3.7;
			};
			deleteVehicle _this;
		};
		
		//Mask Removeal Loop
		if (JTK_ACE_Detected) then {
			_unit spawn {
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
					if (format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] == "No display") exitWith {
						_this setVariable ["JTK_HALO_CanEquipMask",false];
					};
				
					if (format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] == "No display") then {
						_this setVariable ["JTK_HALO_CanRemoveMask",false];
						_ROD = round(abs(velocity vehicle _this select 2));
						if (_ROD <= 15) then { 
							_this setVariable ["JTK_HALO_CanEquipMask",true];
						};
					};
					sleep 1;
				};
				if (format["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No display") then {
					_this setVariable ["JTK_HALO_CanRemoveMask",true];
				};	
			};
		};
		
		//Make Mask Overlay When Map is open to read notes
		_unit spawn {
			disableSerialization;
			_cntrl = (uiNamespace getVariable "JTK_Halo_Bailout_Mask") displayCtrl 0;
			While {(_this getVariable "JTK_HALO_HasOxygenMask") AND ((getPosATL _this select 2) > 1) AND (alive _this)} do {
				if (format ["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No display") then {
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
	};
};



		
	
JTK_Open_ActionWheel = {			
	_this spawn {
		disableSerialization;
		_unit = _this select 0;
		
		JTK_HALO_Action_Layer cutRsc ['JTK_HALO_ACTION_WHEEL_RSC', 'Plain'];
		_display = uiNamespace getVariable "JTK_HALO_Action_Wheel";
		
		WaitUntil {!isNil "_display"};
		JTK_AW_Array = nil;
		if (isNil "JTK_ActionWheel_Y_Origin") then {JTK_ActionWheel_Y_Origin = (ctrlPosition (_display displayCtrl 1)) select 1};
		if (isNil "JTK_AW_inc") then {JTK_AW_inc = abs((ctrlPosition (_display displayCtrl 2) select 1) - JTK_ActionWheel_Y_Origin)};
		if (isNil "JTK_Scroll_Y_min") then {JTK_Scroll_Y_min = JTK_ActionWheel_Y_Origin};
		
		_MouseWheel_EH = (finddisplay 46) displayaddeventhandler ["mousezchanged","_this call JTK_AW_MouseWheel_EH"]; 
		_MouseBttn_EH = (finddisplay 46) displayaddeventhandler ["MouseButtonDown","_this call JTK_AW_MouseButton_EH"];
		JTK_AW_EHs = [["mousezchanged",_MouseWheel_EH],["MouseButtonDown",_MouseBttn_EH]];	
				
		_AW_Faded = if (count _this <= 1) then {true}else{_this select 1};
		_unit setVariable ["JTK_AW_GPS_StatusVarChange",false];
		_unit setVariable ["JTK_AW_Faded",_AW_Faded];
		[_unit,(_unit getVariable 'HALO_GPS_Status')] spawn JTK_AW_MonitorGPSVarChange; 
		
		if (((_unit getVariable 'HALO_GPS_Status') == 'ON') AND ((format['%1',(uiNamespace getVariable'JTK_Halo_Bailout_Mask')]) != 'No display') AND ((format['%1',(uiNamespace getVariable'JTK_Halo_Bailout_Mask')]) != '<null>')) then {
			JTK_AW_Array = [JTK_AW_Chute,JTK_AW_GPS,JTK_AW_Mask];
			(JTK_AW_Array select 0) set [1,(_display displayCtrl 1)];
			(JTK_AW_Array select 1) set [1,(_display displayCtrl 2)];
			(JTK_AW_Array select 1) set [2,1];
			(JTK_AW_Array select 2) set [1,(_display displayCtrl 3)]; 
			(JTK_AW_Array select 2) set [2,2];
			JTK_Scroll_Y_max = JTK_ActionWheel_Y_Origin + ((count JTK_AW_Array - 1)*JTK_AW_inc);
			JTK_AW_Displays = [(_display displayCtrl 1),(_display displayCtrl 2),(_display displayCtrl 3)]; 
		};
		if (((_unit getVariable 'HALO_GPS_Status') == 'ON') AND ((format['%1',(uiNamespace getVariable'JTK_Halo_Bailout_Mask')]) == 'No display') OR ((format['%1',(uiNamespace getVariable'JTK_Halo_Bailout_Mask')]) == '<null>')) then {
			JTK_AW_Array = [JTK_AW_Chute,JTK_AW_GPS];
			(JTK_AW_Array select 0) set [1,(_display displayCtrl 1)];
			(JTK_AW_Array select 1) set [1,(_display displayCtrl 2)];
			(JTK_AW_Array select 1) set [2,1];
			JTK_Scroll_Y_max = JTK_ActionWheel_Y_Origin + ((count JTK_AW_Array - 1)*JTK_AW_inc);
			JTK_AW_Displays = [(_display displayCtrl 1),(_display displayCtrl 2)]; 
		};
		if (((_unit getVariable 'HALO_GPS_Status') == 'OFF') AND ((format['%1',(uiNamespace getVariable'JTK_Halo_Bailout_Mask')]) != 'No display')) then {
			JTK_AW_Array = [JTK_AW_Chute,JTK_AW_Mask];
			(JTK_AW_Array select 0) set [1,(_display displayCtrl 1)];
			(JTK_AW_Array select 1) set [1,(_display displayCtrl 2)];
			(JTK_AW_Array select 1) set [2,1];
			JTK_Scroll_Y_max = JTK_ActionWheel_Y_Origin + ((count JTK_AW_Array - 1)*JTK_AW_inc);
			JTK_AW_Displays = [(_display displayCtrl 1),(_display displayCtrl 2)];  
		};
		if (((_unit getVariable 'HALO_GPS_Status') == 'OFF') AND ((format['%1',(uiNamespace getVariable'JTK_Halo_Bailout_Mask')]) == 'No display')) then {
			JTK_AW_Array= [JTK_AW_Chute];
			(JTK_AW_Array select 0) set [1,(_display displayCtrl 1)];
			JTK_Scroll_Y_max = JTK_ActionWheel_Y_Origin + ((count JTK_AW_Array - 1)*JTK_AW_inc);
			JTK_AW_Displays = [(_display displayCtrl 1)];   
		};
		
		for "_i" from 0 to (count JTK_AW_Array - 1) do {(JTK_AW_Array select _i) spawn JTK_AW_Loop};
		
		if !(_unit getVariable "JTK_AW_Faded") then {
			_sel = (uiNamespace getVariable 'JTK_HALO_Action_Wheel') displayCtrl 0;
			_sel ctrlSetPosition [(ctrlPosition _sel select 0),JTK_Scroll_Y_min];
			_sel ctrlCommit 0;
			{_x ctrlSetBackgroundColor [0,0,0,0]} foreach JTK_AW_Displays; 
			((JTK_AW_Array select 0) select 1) ctrlSetBackgroundColor [0.322,0.667,0.118,0.475];
		}; 		
	};
};

JTK_rsc_AcrionWheel_Compiled = true;








