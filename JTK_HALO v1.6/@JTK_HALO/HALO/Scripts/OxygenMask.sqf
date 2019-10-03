//By Kempco
_unit = _this select 0;
_rscName = _this select 1;
_id = _this select 2;

JTK_HALO_Mask_Layer CutRsc [_rscName, "plain"];
if (JTK_CanChangeID) then {
	if (local _unit) then {_unit setIdentity _id};
	if (ismultiplayer) then {JTK_Call_PVEH = [[_unit,_id], compile "(_this select 0) setIdentity (_this select 1)"]; publicVariable "JTK_Call_PVEH"}; 
}; 