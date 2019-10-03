//by Kempco

_ammobox = _this select 0;
_refresh = 600;

_fnc = {
	_array = _this select 0;
	_weapons = _this select 1;
	_magazines = _this select 2;
	if (typeName(_array select 0) == "ARRAY") then { 
		for "_i" from 0 to (count _array - 1) do {
			for "_j" from 0 to (count (_array select _i) - 1) do { 
				_magazine_array = getArray(configFile >> "CfgWeapons" >> ((_array select _i) select _j) >> "magazines");
				_magazine = tolower(_magazine_array select 0); 
				if !(_magazine in _magazines) then {_magazines = _magazines + [_magazine]};
				_weapons = _weapons + [((_array select _i) select _j)];
			};
		};
	}else{
		for "_i" from 0 to (count _array - 1) do {
			_magazine_array = getArray(configFile >> "CfgWeapons" >> (_array select _i) >> "magazines");
			_magazine = tolower(_magazine_array select 0); 
			if !(_magazine in _magazines) then {_magazines = _magazines + [_magazine]};
			_weapons = _weapons + [(_array select _i)];
		};
	}; 	
	[_weapons,_magazines]
};

private ["_Weaps_and_Mags"];

_magazines = ["1Rnd_HE_M203"];
_weapons = [];


//-----------------------Bis Weapons---------------------------//
//Arma 2 
if (isclass (configfile >> "CfgPatches" >> "Chernarus")) then {
	_Bis_A2_ARs = ["m4a1_aim_camo","mp5a5","m4a1_hws_gl_camo","aks_74_u","bizon"];
	_Bis_A2_Pistols = ["m9","makarov"]; 
	_Bis_A2 = [_Bis_A2_ARs,_Bis_A2_Pistols];
	_Weaps_and_Mags = [_Bis_A2,_weapons,_magazines] call _fnc;
};

//Arma OA 
if (isclass (configfile >> "CfgPatches" >> "ca_E")) then {//"Arrow Head"
	_Bis_OA_ARs = ["scar_h_cqc_cco","m8_tws"];
	_Bis_OA_SNPRs = ["scar_h_lng_sniper"];
	_Bis_OA_Pistols = ["uzi_ep1"];
	_Bis_OA = [_Bis_OA_ARs,_Bis_OA_SNPRs,_Bis_OA_Pistols];
	_Weaps_and_Mags = [_Bis_OA,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};

//Arma ACR 
/*
if (isclass (configfile >> "CfgPatches" >> "????")) then {//"ACR"
	_Bis_ACR_ARs = ["cz805_a2_acr","evo_acr"];
	_Bis_ACR_Pistols = ["cz_75_sp_01_phantom"];
	_Bis_ACR = [_Bis_ACR_ARs,_Bis_ACR_Pistols];
	_Weaps_and_Mags = [_Bis_ACR,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};
*/
//-------------------------------------------------------------//




if (isClass(configFile>>"CfgPatches">>"acex_main")) then {
	_ACEX_ARs = ["ace_ak74m_kobra","ace_ak74m","ace_akms","ace_gr1","ace_gr1sp","ace_oc14","ace_oc14sp","ace_hk416_d10","ace_hk416_d10_compm3","ace_hk416_d14_compm3","ace_hk416_d14","ace_m4_aim","ace_m4_eotech","ace_m4_acog","ace_m4_gl",   "ace_m4a1_aim_f",   "ace_m4_aim_gl","ace_m4a1_acog","ace_m4a1_gl","ace_m4a1_aim_gl","ace_m4a1_hws_gl_camo_up","ace_soc_m4a1","ace_soc_m4a1_aim","ace_soc_m4a1_eotech","ace_soc_m4a1_shortdot","ace_ump45","ace_ump45_aim","ace_mp5a5"];
	_ACEX_SNPRs = ["m4spr","ace_m110","ace_mk12mod1","ace_tac50"];
	_ACEX_Pistols = ["ace_usp"];
	_ACEX = [_ACEX_ARs,_ACEX_SNPRs,_ACEX_Pistols];
	_Weaps_and_Mags = [_ACEX,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};

if (isClass(configFile>>"CfgPatches">>"FHQ_Remington")) then {
	_FHQ_ARs = [
		"fhq_acr_blk_irn","fhq_acr_blk_irn_f","fhq_acr_blk_irn_gl","fhq_acr_blk_irn_gl_f","fhq_acr_blk_cco",
		"fhq_acr_blk_cco_f","fhq_acr_blk_cco_gl","fhq_acr_blk_cco_gl_f","fhq_acr_blk_rco","fhq_acr_blk_rco_f",
		"fhq_acr_blk_rco_gl","fhq_acr_blk_rco_gl_f","fhq_acr_blk_hamr","fhq_acr_blk_hamr_f","fhq_acr_blk_hamr_gl",
		"fhq_acr_blk_hamr_gl_f","fhq_acr_blk_hws","fhq_acr_blk_hws_f","fhq_acr_blk_hws_gl","fhq_acr_blk_hws_gl_f",
		"fhq_acr_blk_g33","fhq_acr_blk_g33_f","fhq_acr_blk_g33_gl","fhq_acr_blk_g33_gl_f"
	];
	_FHQ_SNPRs = [
		"fhq_rsass_tan","fhq_rsass_tws_tan",
		"fhq_xm2010_desert","fhq_xm2010_nv_desert","fhq_xm2010_tws_desert",
		"fhq_msr_desert","fhq_msr_nv_desert","fhq_msr_tws_desert"
	];
	_FH_Q = [_FHQ_ARs,_FHQ_SNPRs];
	_Weaps_and_Mags = [_FH_Q,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc; 
};

if (isClass(configFile>>"CfgPatches">>"RH_de_cfg")) then {
	_pistols = ["rh_mk22","rh_mk22v","rh_usp","rh_m1911","rh_m9","rh_m9c"];
	_Weaps_and_Mags = [_pistols,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};
if (isClass(configFile>>"CfgPatches">>"RH_smg")) then {
	_smgs = ["rh_p90","rh_p90i","rh_p90aim","rh_p90eot","rh_ump","rh_umpaim","rh_umpeot","rh_umprfx","rh_kriss","rh_krissaim","rh_krisseot","rh_krissrfx","rh_mp7","rh_mp7aim","rh_mp7eot","rh_uzi","rh_tmp","rh_tmpaim","rh_tmpeot"];
	_Weaps_and_Mags = [_smgs,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};
if (isClass(configFile>>"CfgPatches">>"RH_hk416_cfg")) then {
	_HKs = ["rh_hk416","rh_hk416aim","rh_hk416eotech","rh_hk416gl","rh_hk416glaim","rh_hk416gleotech","rh_hk417","rh_hk417aim","rh_hk417eotech","rh_masb","rh_masbaim","rh_masbeotech","rh_masbacog","RH_hk417sp"];
	_Weaps_and_Mags = [_HKs,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};
if (isClass(configFile>>"CfgPatches">>"RHmgswp")) then {
	_MGSs = ["rh_scarh_aim","rh_scarh_eotech","rh_scarh_acog","rh_scarh_gl_aim","rh_scarh_gl_eotech","rh_scarl_doc","rh_scarl_aim","rh_scarl_eotech","rh_scarl_acog","rh_scarl_gl_aim","rh_scarl_gl_eotech","rh_scarl_gl_acog","rh_m4ct","rh_m4ct_f","rh_m4caim","rh_m4ceotech","rh_m4cacog","rh_m4ctsdacog_f","rh_m4cgl","rh_m4cglaim","rh_m4cgleotech","rh_m4cglacog","rh_mk14t","rh_mk14taim","rh_mk14teot","rh_mk14tacog","rh_mk14ebrgc","rh_mk14","rh_mk14aim","rh_mk14eotech","rh_mk14acog","rh_m14ebr","rh_m14ebrgc"];
	_Weaps_and_Mags = [_HKs,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};
if (isClass(configFile>>"CfgPatches">>"RH_mk18")) then {
	_mK18s = ["rh_mk18t","rh_mk18aim","rh_mk18eot","rh_mk18acog"];
	_Weaps_and_Mags = [_mK18s,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};
if (isClass(configFile>>"CfgPatches">>"RH_m4_cfg")) then {
	_m4s = ["rh_m4a1r","rh_m4a1aim","rh_m4a1eotech","rh_m4a1acog","rh_m4a1gl","rh_m4a1glaim","rh_m4a1gleotech","rh_m4a1glacog","rh_m4aim_wdl"];
	_Weaps_and_Mags = [_m4s,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};
if (isClass(configFile>>"CfgPatches">>"DM_Weapons")) then {
	_DM = ["dm_m4_eo_ir","dm_m4_eo_ir_fg","dm_m4_eo_ir_gl","dm_m4_eo_lp","dm_m4_eo_lp_fg","dm_m4_eo_lp_gl","dm_m4_cco_ir","dm_m4_cco_ir_fg","dm_m4_cco_ir_gl","dm_m4_cco_lp","dm_m4_cco_lp_fg","dm_m4_cco_lp_gl","dm_m4_rco_ir","dm_m4_rco_ir_fg","dm_m4_rco_ir_gl","dm_m4_rco_lp","dm_m4_rco_lp_fg","dm_m4_rco_lp_gl"];
	_Weaps_and_Mags = [_DM,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};
if (isClass(configFile>>"CfgPatches">>"LEN_L119_Pack")) then {
	_LEN = ["len_l119a1_acog_pf","len_l119a1_acog_cqb","len_l119a1_eot_cqb","len_l119a1_eot_pf","len_l119a1_acog_hg"];
	_Weaps_and_Mags = [_LEN,(_Weaps_and_Mags select 0),(_Weaps_and_Mags select 1)] call _fnc;
};

While {true} do {

	clearWeaponCargo _ammobox;
	clearMagazineCargo _ammobox;

	for "_i" from 0 to (count (_Weaps_and_Mags select 0) - 1) do {_ammobox addWeaponCargo [((_Weaps_and_Mags select 0) select _i), 10]};
	for "_i" from 0 to (count (_Weaps_and_Mags select 1) - 1) do {_ammobox addMagazineCargo [((_Weaps_and_Mags select 1) select _i), 100]};
	
	sleep _refresh;
	
};
	


