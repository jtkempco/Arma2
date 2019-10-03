//JTK_Para_Add_Chute = {
//by Kempco
	
_unit = _this select 0;
_type = _this select 1;

if (_type == "ParachuteC") then {
	_unit addBackPack "US_Backpack_Specops_EP1";
	_unit setVariable ["JTK_Current_Chute","Primary"];
};
_unit setVariable ["JTK_Para_Type",_type];


