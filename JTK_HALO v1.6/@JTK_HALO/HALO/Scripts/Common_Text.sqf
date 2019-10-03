//by Kempco
//Common scripts reffererencing hint text/Globalchat
JTK_HALO_Error_JTK_Server = {
	_a = ">=====JTK HALO ERROR!!=====<";
	_b = "GAME LOGIC NAMED JTK_Server NOT FOUND.";
	_c = ">=====SCRIPT TERMINATED!===<";
	_txt = [_a,_b,_c];
	for "_i" from 0 to (count _txt - 1) do {[playerSide,"HQ"] commandChat format ["%1",(_txt select _i)]};
};


JTK_HALO_Error_C130_UnDefined = {
	_a = ">=====JTK HALO ERROR!!=====<";
	_b = "C130 ARRAY IS EMPTY.";
	_c = ">=====SCRIPT TERMINATED!===<";
	_txt = [_a,_b,_c];
	for "_i" from 0 to (count _txt - 1) do {[playerSide,"HQ"] commandChat format ["%1",(_txt select _i)]};
};


JTK_HALO_VehTypeError = {
	_c130 = _this;
	_a = ">=====JTK HALO ERROR!!=====<";
	_b = format["THE VEHICLE SELECTED  ''%1'' DOES NOT HAVE THE CARGO CAPACITY REQUIRED!",typeof _this];
	_c = "JTK HALO REQUIRES THE ''C130J_US_EP1'' BE USED.";
	_d = ">=====SCRIPT TERMINATED!<=====";
	_txt = [_a,_b,_c,_d];
	for "_i" from 0 to (count _txt - 1) do {[playerSide,"HQ"] commandChat format ["%1",(_txt select _i)]};
};

JTK_HALO_DirDebugError = {
	_a = ">=====JTK HALO HOT FIX=====<";
	_b = "MOUSE MOVEMENT DETECTED WHILE DISABLE USER INPUT INPROGRESS.";
	_c = "INITIALIZING HOT FIX.....";
	_d = "TO PREVENT THIS FROM HAPPENING, AVOID MOVING THE MOUSE UNITL";
	_e = "THE C130 IS IN THE AIR.";
	_f = ">===========================";
	_txt = [_a,_b,_c,_d,_e,f];
	for "_i" from 0 to (count _txt - 1) do {[playerSide,"HQ"] commandChat format ["%1",(_txt select _i)]};
};

JTK_Get_AltTextColor = {
	_alt = _this select 0;
	_min = (_this select 1) select 0;
	_max = (_this select 1) select 1;
	private ["_Color"];
	if (typeName _alt == "STRING") exitwith {[0.3, 0.35, 1, 1]};
	if ((_alt >= _max) OR (_alt <= _min)) exitWith {[1.0, 0.35, 0.3, 1]};
	if ((_alt < _max) AND (_alt >= JTK_Bailout_02_Altitude)) exitWith {[0.4, 0.4, 0, 1]};
	[1, 1, 1, 1]
};


JTK_AI_MP_Eject_Hint = {
	if (player == (_this select 0)) then {
		_ta = "<t size='1.1'color='#ffffff'>JTK HALO: </t><t size='1.1' color='#ffff00'>WARNING:</t><br/>";
		_tb = "AI units CANNOT use HALO in Multiplayer!!";
		_txt = (_ta + _tb);
		hintSilent parsetext _txt;
	};
};

JTK_Group_Jump_Hint = {
	
	_ta = "<t size='1.1'color='#ffffff'>JTK HALO: </t><t size='1.1' color='#ffff00'>WARNING:</t><br/>";
	_tb = "''Group Jump'' in Progress. Player movement disabled until you have exited the aircraft.";
	_txt = (_ta + _tb);
	hintSilent parsetext _txt;
};




JTK_Get_Command_DC_txt = {
	_t = "<t size='1.0'color='#ffffff'>HALO Command </t><t size='1.0' color='#ff0000'>UNDEFINED:</t><br/>";
	_t2 = "(Action Wheel Updated)";
	_txt = (_t + _t2);
	_txt
};


JTK_Get_Command_Unit_txt = {
	_txt = "";
	_str = "<t size='1.0'color='#ffffff'>HALO Command </t><t size='1.0' color='#00ff00'>DEFINED:</t><br/>";
	_txt = _txt + _str; 
	_str = "<t size='1.0'color='#ffffff'>You are in command.</t><br/>";
	_txt = _txt + _str;
	_str = "(Action Wheel Updated)"; 
	_txt = _txt + _str;
	_txt
};

JTK_AI_Boarding_txt = {
	_cnt = _this select 0;
	_total = _this select 1;
	_txt_1 = "<t size='1.2'color='#00ff00'>Squad boarding...</t><br/>";
	_txt_2 = format["Status: %1/%2",_cnt,_total];
	_txt = (_txt_1 + _txt_2);
	hintSilent parsetext _txt;
};


JTK_Get_EnterText = {

	_Alt 		= _this select 0;
	_insertPos 	= _this select 1;

	private ["_txt","_header","_AcceptRequest"];

	if ((isNil "_insertPos") OR (_Alt < JTK_MIN_HaloAltitude) OR (_Alt > JTK_MAX_HaloAltitude)) then {
		if (isNil "_insertPos") then {
			_txt = "<t size='1.0'color='#ffffff'>DZ NOT SELECTED!</t><br/>";		
		}else{
			if (_Alt < JTK_MIN_HaloAltitude) then {
				_txt = format["Minimum altitude for HALO is %1m!",JTK_MIN_HaloAltitude];
			}else{
				_txt = format["Maximum altitude for HALO is %1m!",JTK_MIN_HaloAltitude];
			};
		};
		_header = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>Negative:</t><br/>";
		_AcceptRequest = false;
	}else{
		_AcceptRequest = true;
	};
	_text = (_header + _txt);
	_Array = [_text,_AcceptRequest];
	
	_Array
};

JTK_C130_Eject_Players = {
	
	_unit = player;
	_C130 = _this select 0;
	_txt = _this select 1;
	
	if ((isPlayer _unit) AND (local _unit) AND (_unit in _C130) AND (_unit != driver _C130)) then {
		_unit action ["getout",_C130];
		[playerSide,'HQ'] commandchat (_txt select 0);
		[playerSide,'HQ'] commandchat (_txt select 1);
	};
};

JTK_CommandChat = {
	_unit = _this select 0;
	_txt = _this select 1;
	_unknown = _this select 2;

	if (typeName _unknown == "OBJECT") then {
		_C130 = _unknown;
		if ((isPlayer _unit) AND (_unit in _C130)) then {[playerSide,'HQ'] commandChat _txt};
	}else{
		_side = _unknown; 
		if (side _unit != _side) exitWith {};
	
		if (typeName _txt == "ARRAY") then {
			for "_i" from 0 to (count _txt - 1) do {
				[playerSide,'HQ'] commandChat (_txt select _i);
			};
		}else{[playerSide,'HQ'] commandChat _txt};
	};
};

JTK_HALO_InsertionSetTxt = {
	_side = _this select 0;
	_txt = _this select 1;
	if ((side player) != _side) exitWith {};
	for "_i" from 0 to (count _txt - 1) do {[playerSide,'HQ'] commandChat (_txt select _i)};
};

JTK_HALO_GetCaptureTxt = {
	_txt = "";
  	_str = "<t valign='Top'><t align='center'><t size='1.5'><t color='#00ff00'><t shadow='2'shadowColor='#000000'>Data Captured:</t><br/><br/>";_txt = _txt + _str;
  	_str = "<t color='#ffffff'><t align='left'><t valign='Top'><t size='1.2'>-Data coppied to <t underline='true'>clipboard<t underline='false'>.</t><br/><br/>";_txt = _txt + _str;
  	_str = "<t underline='false'><t align='left'><t valign='bottom'><t size='1.2'>-Open the ''JTK_ByPassSetUp.sqf'', and paste where indicated.</t><br/>";_txt = _txt + _str;
  	_txt 	
};

Text_Scripts_Compiled = true;















