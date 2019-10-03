//by Kempco
//Common Scripts for player using BIS Chutes (NO ACE)

JTK_AI_GetPlayer_Speed_Inc = {	
	_min = _this select 0;
	_max = _this select 1;
	_tailJmpr = _this select 2;
	
	_dist_limit = 15;
	
	_dist = [player,_tailJmpr] call BIS_fnc_distance2D;
	_mltpr = if ((_dist/_dist_limit) < 1) then {(_dist/_dist_limit)}else{1};
	_inc = if ((_max*_mltpr) <= _min) then {_min}else{_max*_mltpr};
	_inc
};

JTK_HALO_Action_CutChute = {
	player action ['Eject',vehicle player];
	JTK_HALO_Action_Layer cutRsc ['Default', 'Plain'];
	_current_chute = player getVariable "JTK_Current_Chute";
	if (_current_chute == "Primary") then {player setVariable ["JTK_Current_Chute","Reserve"];player addBackPack "US_Backpack_Specops_EP1"};
	if (_current_chute == "Reserve") then {player setVariable ["JTK_Current_Chute","NONE"]};
};


JTK_Para_Add_Chute = {
	
	_unit = _this select 0;
	_type = _this select 1;

	JTK_MouseWheelScrolls = 0;
	if (_type == "ParachuteC") then {
		_unit addBackPack "US_Backpack_Specops_EP1";
		_unit setVariable ["JTK_Current_Chute","Primary"];
	};
	_unit setVariable ["JTK_Para_Type",_type];
};

JTK_HALO_PlayFreeFallAnim = {(_this select 0) switchmove (_this select 1)};


JTK_HALO_Common_Compiled = true;



