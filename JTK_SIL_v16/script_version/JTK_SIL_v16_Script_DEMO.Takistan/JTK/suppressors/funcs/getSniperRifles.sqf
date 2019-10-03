//by Kempco

private ["_standard","_silenced","_name"];
_suppresable = true;

switch tolower(_this) do {
//-----------------bis------------------------//
//scar_h_lng_sniper
	case "scar_h_lng_sniper":{
		_standard = "scar_h_lng_sniper";
		_silenced = "scar_h_lng_sniper_sd";
		_name = "HK17-20";
	};
	case "scar_h_lng_sniper_sd":{
		_standard = "scar_h_lng_sniper";
		_silenced = "scar_h_lng_sniper_sd";
		_name = "HK17-20";
	};
//-----------------ace------------------------//		
//m4spr
	case "m4spr":{
		_standard = "m4spr";
		_silenced = "ace_m4spr_sd";
		_name = "Mk12";
	};
	case "ace_m4spr_sd":{
		_standard = "m4spr";
		_silenced = "ace_m4spr_sd";
		_name = "Mk12";
	};
	
//ace_m110_sd
	case "ace_m110":{
		_standard = "ace_m110";
		_silenced = "ace_m110_sd";
		_name = "M110";
	};
	case "ace_m110_sd":{
		_standard = "ace_m110";
		_silenced = "ace_m110_sd";
		_name = "M110";
	};
	
//ace_mk12mod1
	case "ace_mk12mod1":{
		_standard = "ace_mk12mod1";
		_silenced = "ace_mk12mod1_sd";
		_name = "MK12";
	};
	case "ace_mk12mod1_sd":{
		_standard = "ace_mk12mod1";
		_silenced = "ace_mk12mod1_sd";
		_name = "MK12";
	};
	
//ace_tac50
	case "ace_tac50":{
		_standard = "ace_tac50";
		_silenced = "ace_tac50_sd";
		_name = "TAC-50";
	};
	case "ace_tac50_sd":{
		_standard = "ace_tac50";
		_silenced = "ace_tac50_sd";
		_name = "TAC-50";
	};
	
//---------------------rh------------------------//
//rh_mk14ebrsp
	case "rh_hk417sp":{
		_standard = "rh_hk417sp";
		_silenced = "rh_hk417sdsp";
		_name = "HK417-20";
	};
	case "rh_hk417sdsp":{
		_standard = "rh_hk417sp";
		_silenced = "rh_hk417sdsp";
		_name = "HK417-20";
	};	
//rh_mk14ebrsp
	case "rh_mk14ebrsp":{
		_standard = "rh_mk14ebrsp";
		_silenced = "rh_mk14ebrsp_sd";
		_name = "HK417-20";
	};
	case "rh_mk14ebrsp_sd":{
		_standard = "rh_mk14ebrsp";
		_silenced = "rh_mk14ebrsp_sd";
	};	
//rh_m14ebrsp
	case "rh_m14ebrsp":{
		_standard = "rh_m14ebrsp";
		_silenced = "rh_m14ebrsp_sd";
	};
	case "rh_m14ebrsp_sd":{
		_standard = "rh_m14ebrsp";
		_silenced = "rh_m14ebrsp_sd";
	};
//rh_mk21as
	case "rh_mk21a5":{
		_standard = "rh_mk21a5";
		_silenced = "rh_mk21a5sd";
	};
	case "rh_mk21a5sd":{
		_standard = "rh_mk21a5";
		_silenced = "rh_mk21a5sd";
	};
//rh_hk417sp	
	case "rh_hk417sp":{
		_standard = "rh_hk417sp";
		_silenced = "rh_hk417sdsp";
	};
	case "rh_hk417sdsp":{
		_standard = "rh_hk417sp";
		_silenced = "rh_hk417sdsp";
	};
//rh_mk12	
	case "rh_mk12":{
		_standard = "rh_mk12";
		_silenced = "rh_mk12sd";
		_name = "MK12 mod 0";
	};
	case "rh_mk12sd":{
		_standard = "rh_mk12";
		_silenced = "rh_mk12sd";
		_name = "MK12 mod 0";
	};
//rh_mk12mod1	
	case "rh_mk12mod1":{
		_standard = "rh_mk12mod1";
		_silenced = "rh_mk12sd";
		_name = "MK12 mod 1";
	};
	case "rh_mk12sd":{
		_standard = "rh_mk12mod1";
		_silenced = "rh_mk12sd";
		_name = "MK12 mod 1";
	};
	
//fhq	
	case "fhq_rsass_tan":{
		_standard = "fhq_rsass_tan";
		_silenced = "fhq_rsass_sd_tan";
		_name = "RSASS";
	};
	case "fhq_rsass_sd_tan":{
		_standard = "fhq_rsass_tan";
		_silenced = "fhq_rsass_sd_tan";
		_name = "RSASS";
	};
	case "fhq_rsass_tws_tan":{
		_standard = "fhq_rsass_tws_tan";
		_silenced = "fhq_rsass_tws_sd_tan";
		_name = "RSASS";
	};
	case "fhq_rsass_tws_sd_tan":{
		_standard = "fhq_rsass_tws_tan";
		_silenced = "fhq_rsass_tws_sd_tan";
		_name = "RSASS";
	};
	/*
	case "fhq_rsass_nv_tan":{
		_standard = "fhq_rsass_nv_tan";
		_silenced = "fhq_rsass_nv_sd_tan";
	};
	*/
	case "fhq_rsass_nv_sd_tan":{
		_standard = "fhq_rsass_nv_tan";
		_silenced = "fhq_rsass_nv_sd_tan";
		_name = "RSASS";
	};
	case "fhq_xm2010_desert":{
		_standard = "fhq_xm2010_desert";
		_silenced = "fhq_xm2010_sd_desert";
		_name = "XM2010";
	};
	case "fhq_xm2010_sd_desert":{
		_standard = "fhq_xm2010_desert";
		_silenced = "fhq_xm2010_sd_desert";
		_name = "XM2010";
	};
	case "fhq_xm2010_nv_desert":{
		_standard = "fhq_xm2010_nv_desert";
		_silenced = "fhq_xm2010_nv_sd_desert";
		_name = "XM2010";
	};
	case "fhq_xm2010_nv_sd_desert":{
		_standard = "fhq_xm2010_nv_desert";
		_silenced = "fhq_xm2010_nv_sd_desert";
		_name = "XM2010";
	};
	case "fhq_xm2010_tws_desert":{
		_standard = "fhq_xm2010_tws_desert";
		_silenced = "fhq_xm2010_tws_sd_desert";
		_name = "XM2010";
	};
	case "fhq_xm2010_tws_sd_desert":{
		_standard = "fhq_xm2010_tws_desert";
		_silenced = "fhq_xm2010_tws_sd_desert";
		_name = "XM2010";
	};
	case "fhq_msr_desert":{
		_standard = "fhq_msr_desert";
		_silenced = "fhq_msr_sd_desert";
		_name = "MSR";
	};
	case "fhq_msr_sd_desert":{
		_standard = "fhq_msr_desert";
		_silenced = "fhq_msr_sd_desert";
		_name = "MSR";
	};
	case "fhq_msr_nv_desert":{
		_standard = "fhq_msr_nv_desert";
		_silenced = "fhq_msr_nv_sd_desert";
		_name = "MSR";
	};
	case "fhq_msr_nv_sd_desert":{
		_standard = "fhq_msr_nv_desert";
		_silenced = "fhq_msr_nv_sd_desert";
		_name = "MSR";
	};
	case "fhq_msr_tws_desert":{
		_standard = "fhq_msr_tws_desert";
		_silenced = "fhq_msr_tws_sd_desert";
		_name = "MSR";
	};
	case "fhq_msr_tws_sd_desert":{
		_standard = "fhq_msr_tws_desert";
		_silenced = "fhq_msr_tws_sd_desert";
		_name = "MSR";
	};
	default{
		_suppresable = false;
	};	
};
_array = if (_suppresable) then {[_standard,_silenced,_name]}else{nil};
_array


