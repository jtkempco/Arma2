//by Kempco
disableSerialization;
private ['_handled','_lastmode','_GPS_status','_GPS_mode'];
_handled 	= false;
_button 	= _this select 1;
_shiftState	= _this select 2;
_ctrlState 	= _this select 3;


if ((JTK_ACE_Detected) AND (JTK_HALO_Disable_ACE_Altimeter) AND !(JTK_HALO_Override_ACE_Freefall)) then {
	if((_shiftState) AND (_button in actionKeys 'Compass')) then {
		disableUserInput true;
		_handled = true;
		disableUserInput false;
	};
};

if (!JTK_HALO_Disable_Jump_Computer) then {
	if ((format ['%1',player getVariable 'HALO_GPS_Mode']) == '<null>') then {player setVariable ['HALO_GPS_Mode','MAP']};
	if (((format ['%1',player getVariable 'HALO_GPS_Status']) == '<null>') OR ((format['%1',(uiNamespace getVariable 'JTK_HALO_GPS')]) == 'No Display')) then {player setVariable ['HALO_GPS_Status','OFF']};	
};

if (((player getVariable 'JTK_HALO_Status') == 'WAITING') AND (_button in actionKeys 'PersonView')) then {
	disableUserInput true;
	_handled = true;
	0.1 spawn {sleep _this; disableUserInput false};
};

if (((player getVariable 'JTK_HALO_Status') == 'WAITING') OR ((player getVariable 'JTK_HALO_Status') == 'FREEFALL') AND (_button in actionKeys 'Gear')) then {  	
	disableUserInput true;
	_handled = true;
	0.1 spawn {sleep _this; disableUserInput false};
};

if(!(_ctrlState) AND (_button in actionKeys 'hideMap') OR (_button in actionKeys 'ShowMap'))then{
	if (((player getVariable 'JTK_HALO_Status') == 'WAITING') OR ((player getVariable 'JTK_HALO_Status') == 'FREEFALL')) then {
		_handled = true;
		disableUserInput true;
		0.25 spawn {sleep _this; disableUserInput false};
	}else{
		if (format ["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")] != "No display") then {
			_handled = true;
			[] spawn {
				WaitUntil{visibleMap};
				((uiNamespace getVariable 'JTK_Halo_Bailout_Mask') displayCtrl 0) ctrlSetTextColor [1,1,1,0.5];
				WaitUntil{!(visibleMap)};
				((uiNamespace getVariable "JTK_Halo_Bailout_Mask") displayCtrl 0) ctrlSetTextColor [1,1,1,1];
			};	
		};
	};
};
	
if((_ctrlState) AND (!visibleMap) AND ((_button in actionKeys 'hideMap') OR (_button in actionKeys 'ShowMap')))then{
	if (!JTK_HALO_Disable_Jump_Computer) then {
		disableUserInput true;
		if ((player getVariable 'HALO_GPS_Status') == 'OFF') then {[player,((player getVariable 'JTK_HALO_Aircraft') select 0),((player getVariable 'JTK_HALO_Aircraft') select 1)] call JTK_Open_GPS};
		if ((player getVariable 'HALO_GPS_Status') == 'ON') then {JTK_HALO_GPS_Layer cutRsc ['default', 'Plain']};
		disableUserInput false;
		_handled = true;
	};
};
if ((_ctrlState) AND ((player getVariable 'HALO_GPS_Status') == 'ON') AND ((player getVariable 'HALO_GPS_Mode') == 'MAP')) then {
	if (!JTK_HALO_Disable_Jump_Computer) then {
		JTK_ctrlState = true;
		[] spawn {sleep 1;JTK_ctrlState = nil};
		_handled = true;
	};
};
if (_button in actionKeys 'NightVision') then {
	_hdr = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>WARNING:</t><br/>";
	_dly = (time + 7);
	if ((player getVariable "JTK_HALO_Status") == "FREEFALL") then {
		disableUserInput true;
		_txt = if (currentVisionMode player == 1) then {"You CANNOT remove your NVGs at this speed!"}else{"You CANNOT equip your NVGs at this speed!"};
		hintSilent parsetext (_hdr + _txt);
		disableUserInput false;
		_handled = true;
		
		//Clean up 
		_dly spawn {WaitUntil {(time >= _this) OR ((format ["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")]) == "No display") OR ((player getVariable "JTK_HALO_Status") != "FREEFALL")}; hintSilent ""};
	}else{
		if (((player getVariable "JTK_HALO_Status") != "FREFALL") AND ((format ["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")]) != "No display")) then {
			disableUserInput true;
			_txt = "You CANNOT equip your NVGs with your O2 mask on!!";
			hintSilent parsetext (_hdr + _txt);
			disableUserInput false;
			_handled = true;
			//Clean up 
			 _dly spawn {WaitUntil {(time >= _this) OR ((format ["%1",(uiNamespace getVariable "JTK_Halo_Bailout_Mask")]) == "No display")}; hintSilent ""};
		};
	};
};
 
_handled







