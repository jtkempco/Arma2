//by Kempco

#include "Definitions.sqf"
disableSerialization;
_dialog = findDisplay JTK_HALO_IDD;

private ["_txt"];
_unit = _this select 0;
_isWater = _this select 1;
_aircraft = _this select 2;
_mapClick = if (count _this > 3) then {_this select 3}else{Mapclick};
_limit_txt = if (count _this > 4) then {_this select 4}else{""}; 
_alt = parseNumber(ctrlText JTK_HALO_ALT_IDC);
_stndrd_limit = if (isMultiplayer) then {15}else{9};

_min_alt = (_aircraft getVariable "altitude limits") select 0;
_max_alt = (_aircraft getVariable "altitude limits") select 1;


if !(isMultiplayer) then {
	_unit_cnt = count units group player;
	_ReduceSquadWarning = if ((_isWater AND _unit_cnt > 5) OR (!_isWater AND _unit_cnt > _stndrd_limit))then{true}else{false};
	if (_ReduceSquadWarning) then {
		_limit = if (_isWater) then {5}else{_stndrd_limit};
		_txt = "";
		_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#FF594D'>WARNING:</t><t size='1.5'><br/>";
		_txt = _txt + _str;
		_str = format["<t size='1.0'><t align='left'><t color='#FFFFF0'><t shadow='2'>-Squad count (%1) exceedes capacity (<t color='#FF594D'>%2<t color='#FFFFF0'>).</t><br/>",_unit_cnt,_limit];
		_txt = _txt + _str;
		_str = "<br/><t size='1.0'><t align='left'><t color='#FFFFF0'><t shadow='2'>-If you proceede your squad will be reduced in size to accomidate the restrictions.</t><br/>";
		_txt = _txt + _str;
		hintSilent parseText _txt; 
		_unit setVariable ["JTK_HALO_Reduce_Squad_Size",[true,_limit]];
		_txt = "";
	}else{
		hintSilent "";
		_unit setVariable ["JTK_HALO_Reduce_Squad_Size",false];
	};	
}; 
	
_wasWater = if (_alt == JTK_HALO_Water_Insertion_Altitude) then {true}else{false};
_WaterInsertAlt = JTK_HALO_Water_Insertion_Altitude;
_WaterInsertMinDist = JTK_HALO_Water_Insertion_MinDistToLand;

_help_txt = _dialog displayCtrl JTK_Instructuions_IDC;
_STs = [_dialog displayCtrl JTK_DZ_ST_IDC,_dialog displayCtrl JTK_JV_ST_IDC,_dialog displayCtrl JTK_C130_ST_IDC]; 
_Mrkrs = [_dialog displayCtrl JTK_DZ_Mrkr_IDC,_dialog displayCtrl JTK_JV_Mrkr_IDC,_dialog displayCtrl JTK_C130_Mrkr_IDC];
_Ls = [_dialog displayCtrl JTK_DZ_L_IDC,_dialog displayCtrl JTK_JV_L_IDC,_dialog displayCtrl JTK_C130_L_IDC];
_bttns = [(_dialog displayCtrl JTK_IncreaseAltitude_IDC),(_dialog displayCtrl JTK_DecreaseAltitude_IDC)]; 




//Set Header
_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#FFFFF0'>DIRECTIONS:</t><br/><t align='left'><br/>";
_hdr =  if !(_mapClick) then {
		"<t size='1.5'><t color='#FFFFF0'><t shadow='2'>Click on the map to select dropzone.</t><br/>"
	}else{"<t size='1.5'><t color='#FFFFF0'><t shadow='2'>Click on map to move dropzone to a different location.</t><br/>"};
_hdr = _str + _hdr;	

//--------------------------Deinfe Txt Strings--------------------------------------//
//Define Alt txt str
if (isNil "JTK_Help_Altitude") then {
	_txt = "";
	_str = "<br/><br/><t align='center'><t size='1.7'><t shadow='2'><t color='#FFFFF0'>Altitude Controls:</t><br/><t align='left'><br/>"; _txt = _txt + _str;
	_str = "<t size='1.5'><t color='#FFFFF0'><t shadow='2'>UP:    Increase altitude.</t><br/>";_txt = _txt + _str;
	_str = "<t color='#FFFFF0'><t shadow='2'>DOWN: Decrease altitude.</t><br/>";_txt = _txt + _str;
	JTK_Help_Altitude = _txt;
};
//Define Ingress txt str
if (isNil "JTK_Help_Ingress") then {
	_txt = "";
	_str = "<br/><br/><t align='center'><t size='1.7'><t shadow='2'><t color='#FFFFF0'>Ingress Controls:</t><br/><t align='left'><br/>"; _txt = _txt + _str;
	_str = "<t size='1.5'><t align='left'><t color='#FFFFF0'><t shadow='2'>LEFT:  Rotate clockwise.</t><br/>";_txt = _txt + _str;
	_str = "<t align='left'><t color='#FFFFF0'><t shadow='2'>RIGHT: Rotate counter-clockwise.</t><br/><br/><br/>";_txt = _txt + _str;
	JTK_Help_Ingress = _txt;
};
//Define Water txt str
if (isNil "JTK_Help_WaterInsert") then {
	_txt = "";
	_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#4D59FF'>WATER INSERTION:</t><t size='1.7'><br/><br/>";_txt = _txt + _str;
	_str = "<t align='left'><t color='#FFFFF0'><t shadow='2'>Limitations:</t><br/><br/>";_txt = _txt + _str;
	_str = "<t size='1.5'><t align='left'><t color='#FFFFF0'><t shadow='2'>-Number of jumpers reduced to<t color='#4D59FF'> 5.<t color='#FFFFF0'></t><br/>";
	_txt = _txt + _str;
	_str = format["<t size='1.5'><t align='left'><t color='#FFFFF0'><t shadow='2'>-Altitude restricted to<t color='#4D59FF'> %1m.<t color='#FFFFF0'></t><br/>",_WaterInsertAlt];
	_txt = _txt + _str;
	_str = format["<t size='1.5'><t align='left'><t color='#FFFFF0'><t shadow='2'>-Insertion must be<t color='#4D59FF'> %1m<t color='#FFFFF0'> from land.</t><br/><br/>",_WaterInsertMinDist];
	_txt = _txt + _str;
	JTK_Help_WaterInsert = _txt;
};
if (isNil "JTK_Help_WaterInsert_ProximityWarning") then {
	_txt = "";
	_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#FF594D'>WARNING:</t><t size='1.5'><br/><br/>";
	_txt = _txt + _str;
	_str = format["<t align='left'><t size='1.5'><t color='#FFFFF0'><t shadow='2'>Water insertions must be at least <t color='#FF594D'>%1m<t color='#FFFFF0'> from the nearest land mass.</t><br/><br/>",_WaterInsertMinDist];
	_txt = _txt + _str;
	JTK_Help_WaterInsert_ProximityWarning = _txt;
};
//--------------------------Txt strings defined--------------------------------------//
	
_txt = "";
if ((typeName JTK_HaloPos == "ARRAY") AND (surfaceIsWater JTK_HaloPos) AND !(_isWater)) then {
	_str = "<br/><t align='center'><t align='center'><t size='1.5'><t shadow='2'><t color='#FF594D'>STANDBY...</t><t size='1.5'><br/><br/>";
	_txt = JTK_Help_WaterInsert_ProximityWarning + _str;
	
	[(_dialog displayCtrl JTK_Instructuions_IDC)] spawn {
		disableSerialization;
		_idc = _this select 0;
		_dist = [JTK_HaloPos] call JTK_GetNearestLand;
		
		WaitUntil {(!isNil "_dist") OR !(dialog)};
		if (!dialog) exitWith {};
		_str = format["<t align='left'><t size='1.5'><t color='#FF594D'><t shadow='2'>Be ADVISED:<t color='#FFFFF0'> Nearest land is<t color='#FF594D'> %1m<t color='#FFFFF0'> from your current DZ.</t><br/><br/>",round _dist];
		_txt = JTK_Help_WaterInsert_ProximityWarning + _str;
		_idc ctrlSetStructuredText parseText _txt;
	};
};
if (_txt == "") then {	
	if (_isWater) then {
		_txt = JTK_Help_WaterInsert
	}else{
		_str = if ((_alt <= _max_alt) AND (_alt >= JTK_Bailout_02_Altitude)) then {
				"<t size='1.5'><t align='left'><t color='#666600'><t shadow='2'>WARNING: Bailout Oxygen Required.</t><br/>" + _limit_txt;
			}else{_limit_txt};
		_txt = if (!_mapClick) then {_hdr + JTK_Help_Altitude + "<br/><br/><br/>" + _str}else{_hdr + JTK_Help_Altitude + JTK_Help_Ingress + _str}; 
	};
};

	
_help_txt ctrlSetStructuredText parseText _txt;

if (isNil "_markers") then {
	_pos = ctrlPosition (_Mrkrs select 0);
	(_Mrkrs select 0) ctrlSetPosition [(_pos select 0)+0.02,(_pos select 1)-0.02,(_pos select 2)*2,(_pos select 3)*2];
	(_Mrkrs select 0) ctrlCommit 0;
	_pos = ctrlPosition (_Mrkrs select 0);
	
	_pos = ctrlPosition (_Mrkrs select 2);
	(_Mrkrs select 2) ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,(_pos select 3)*0.75];
	(_Mrkrs select 2) ctrlCommit 0;
};


	
if !(_isWater) then {	
	if (_wasWater) then {
		ctrlSetText [JTK_HALO_ALT_IDC,str (_min_alt + 500) + "m"];
		(_dialog displayCtrl JTK_HALO_ALT_IDC) ctrlSetTextColor JTK_Color_Common;
		[(_min_alt + 500),150] call JTK_AdjustDistance;
	};
	
	{_x ctrlSetTextColor JTK_Color_Common} foreach _bttns;
}else{
	(_Mrkrs select 0) ctrlSetTextColor [0,1,0,0];
	(_Mrkrs select 1) ctrlSetBackGroundColor [0,0,0,0];
	(_Mrkrs select 2) ctrlSetTextColor [0,0,0,0];
	{_x ctrlSetBackGroundColor [0,0,0,0]} foreach _Ls; 
	{_x  ctrlSetStructuredText parsetext ""} foreach _STs;
	
	{_x ctrlSetTextColor JTK_Bttn_Blue} foreach _bttns;
	[_min_alt,150] call JTK_AdjustDistance;
	ctrlSetText [JTK_HALO_ALT_IDC,str JTK_HALO_Water_Insertion_Altitude + "m"];
	(_dialog displayCtrl JTK_HALO_ALT_IDC) ctrlSetTextColor JTK_Txt_Blue;
};





