//by Kempco

private ["_standard","_silenced","_name"];
_suppresable = true;

//-------------BIS
switch (tolower _this) do {	
//Scar H
	case "scar_h_cqc_cco":{
		_standard = "scar_h_cqc_cco";
		_silenced = "scar_h_cqc_cco_sd";
		_name = "SCAR-H";
	};
	case "scar_h_cqc_cco_sd":{
		_standard = "scar_h_cqc_cco";
		_silenced = "scar_h_cqc_cco_sd";
		_name = "SCAR-H";
	};
//m4a1
	case "m4a1_aim_camo":{
		_standard = "m4a1_aim_camo";
		_silenced = "m4a1_aim_sd_camo";
		_name = "M4A1";
	};
	case "m4a1_aim_sd_camo":{
		_standard = "m4a1_aim_camo";
		_silenced = "m4a1_aim_sd_camo";
		_name = "M4A1";
	};
//m4a1 gl
	case "m4a1_hws_gl_camo":{
		_standard = "m4a1_hws_gl_camo";
		_silenced = "m4a1_hws_gl_sd_camo";
		_name = "M4A1";
	};
	case "m4a1_hws_gl_sd_camo":{
		_standard = "m4a1_hws_gl_camo";
		_silenced = "m4a1_hws_gl_sd_camo";
		_name = "M4A1";
	};
//Mp5
	case "mp5a5":{
		_standard = "mp5a5";
		_silenced = "mp5sd";
		_name = "MP5";
	};
	case "mp5sd":{
		_standard = "mp5a5";
		_silenced = "mp5sd";
		_name = "MP5";
	};	
//m8_tws
	case "m8_tws":{
		_standard = "m8_tws";
		_silenced = "m8_tws_sd";
		_name = "M8";
	};
	case "m8_tws_sd":{
		_standard = "m8_tws";
		_silenced = "m8_tws_sd";
		_name = "M8";
	};
//bizon
	case "bizon":{
		_standard = "bizon";
		_silenced = "bizon_silenced";
		_name = "Bizon";
	};
	case "bizon_silenced":{
		_standard = "bizon";
		_silenced = "bizon_silenced";
		_name = "Bizon";
	};


//ACR DLC
	case "cz805_a2_acr":{
		_standard = "cz805_a2_acr";
		_silenced = "cz805_a2_sd_acr";
		_name = "CZ 805";
	};
	case "cz805_a2_sd_acr":{
		_standard = "cz805_a2_acr";
		_silenced = "cz805_a2_sd_acr";
		_name = "CZ 805";
	};
	case "evo_acr":{
		_standard = "evo_acr";
		_silenced = "evo_sd_acr";
		_name = "CZ Scorpion";
	};
	case "evo_sd_acr":{
		_standard = "evo_acr";
		_silenced = "evo_sd_acr";
		_name = "CZ Scorpion";
	};
//---------------------	ACE --------------------------------//

//aks_74_u
	case "aks_74_u":{
		_standard = "aks_74_u";
		_silenced = "ace_aks74_un";
		_name = "AKS-74U";
	};
	case "ace_aks74_un":{
		_standard = "aks_74_u";
		_silenced = "ace_aks74_un";
		_name = "AKS-74U";
	};
//ace_ak74m_kobra
	case "ace_ak74m_kobra":{
		_standard = "ace_ak74m_kobra";
		_silenced = "ace_ak74m_sd_kobra_f";
		_name = "AK-74M";
	};
	case "ace_ak74m_sd_kobra_f":{
		_standard = "ace_ak74m_kobra";
		_silenced = "ace_ak74m_sd_kobra_f";
		_name = "AK-74M";
	};
	
//ace_ak74m
	case "ace_ak74m":{
		_standard = "ace_ak74m";
		_silenced = "ace_ak74m_sd";
		_name = "AK-74M";
	};
	case "ace_ak74m_sd":{
		_standard = "ace_ak74m";
		_silenced = "ace_ak74m_sd";
		_name = "AK-74M";
	};	
//ace_akms
	case "ace_akms":{
		_standard = "ace_akms";
		_silenced = "ace_akms_sd";
		_name = "AKMS";
	};
	case "ace_akms_sd":{
		_standard = "ace_akms";
		_silenced = "ace_akms_sd";
		_name = "AKMS";
	};
//ace_gr1
	case "ace_gr1":{
		_standard = "ace_gr1";
		_silenced = "ace_gr1sd";
		_name = "Groza-7.62";
	};
	case "ace_gr1sd":{
		_standard = "ace_gr1";
		_silenced = "ace_gr1sd";
		_name = "Groza-7.62";
	};	
//ace_gr1sp
	case "ace_gr1sp":{
		_standard = "ace_gr1sp";
		_silenced = "ace_gr1sdsp";
		_name = "Groza-7.62";
	};
	case "ace_gr1sdsp":{
		_standard = "ace_gr1sp";
		_silenced = "ace_gr1sdsp";
		_name = "Groza-7.62";
	};
		
//ace_oc14
	case "ace_oc14":{
		_standard = "ace_oc14";
		_silenced = "ace_oc14sd";
		_name = "Groza-9";
	};
	case "ace_oc14sd":{
		_standard = "ace_oc14";
		_silenced = "ace_oc14sd";
		_name = "Groza-9";
	};
//ace_oc14sp
	case "ace_oc14sp":{
		_standard = "ace_oc14sp";
		_silenced = "ace_oc14sdsp";
		_name = "Groza-9";
	};
	case "ace_oc14sdsp":{
		_standard = "ace_oc14sp";
		_silenced = "ace_oc14sdsp";
		_name = "Groza-9";
	};
	
	
//---------_East Done----------------//
	
			
//ace_hk416_d10
	case "ace_hk416_d10":{
		_standard = "ace_hk416_d10";
		_silenced = "ace_hk416_d10_sd";
		_name = "HK416";
	};
	case "ace_hk416_d10_sd":{
		_standard = "ace_hk416_d10";
		_silenced = "ace_hk416_d10_sd";
		_name = "HK416";
	};
	
//ace_hk416_d10_compm3
	case "ace_hk416_d10_compm3":{
		_standard = "ace_hk416_d10_compm3";
		_silenced = "ace_hk416_d10_compm3_sd";
		_name = "HK416";
		player setvariable ["jtk_weapon_saved",_standard];
	};
	case "ace_hk416_d10_compm3_sd":{
		_saved = player getvariable "jtk_weapon_saved";
		if (isnil "_saved") then {_standard = "ace_hk416_d10_compm3"}
		else{_standard = player getvariable "jtk_weapon_saved"};
		_silenced = "ace_hk416_d10_compm3_sd";
		_name = "HK416";
	};

//ace_hk416_d14_compm3
	case "ace_hk416_d14_compm3":{
		_standard = "ace_hk416_d14_compm3";
		_silenced = "ace_hk416_d10_compm3_sd";
		player setvariable ["jtk_weapon_saved",_standard];
		_name = "HK416";
	};
	
//ace_hk416_d14
	case "ace_hk416_d14":{
		_standard = "ace_hk416_d14";
		_silenced = "ace_hk416_d14_sd";
		_name = "HK416";
	};
	case "ace_hk416_d14_sd":{
		_standard = "ace_hk416_d14";
		_silenced = "ace_hk416_d14_sd";
		_name = "HK416";
	};
	
///-----------------m4s--------------------------//
	
//ace_m4_aim
	case "ace_m4_aim":{
		_standard = "ace_m4_aim";
		_silenced = "ace_m4a1_aim_sd";
		_name = "M4A1";
	};	
//ace_m4_aim_f
	case "ace_m4_aim_f":{
		_standard = "ace_m4_aim_f";
		_silenced = "ace_m4a1_aim_sd";
		_name = "M4A1";
	};
//ace_m4_eotech	
	case "ace_m4_eotech":{
		_standard = "ace_m4_eotech";
		_silenced = "ace_m4a1_eot_sd";
		_name = "M4A1";
	};
	case "ace_m4a1_eot_sd":{
		_standard = "ace_m4_eotech";
		_silenced = "ace_m4a1_eot_sd";
		_name = "M4A1";
	};	
//ace_m4_acog 
	case "ace_m4_acog":{
		_standard = "ace_m4_acog";
		_silenced = "ace_m4a1_acog_sd";
		_name = "M4A1";
	};
//ace_m4_acog_f
	case "ace_m4_acog_f":{
		_standard = "ace_m4_acog_f";
		_silenced = "ace_m4a1_acog_sd";
		_name = "M4A1";
	};
//ace_m4_gl
	case "ace_m4_gl":{
		_standard = "ace_m4_gl";
		_silenced = "ace_m4a1_gl_sd";
		_name = "M4A1";
	};
//ace_m4_gl_f
	case "ace_m4_gl_f":{
		_standard = "ace_m4_gl_f";
		_silenced = "ace_m4a1_gl_sd";
		_name = "M4A1";
	};
	
//ace_m4_aim_gl
	case "ace_m4_aim_gl":{
		_standard = "ace_m4_aim_gl";
		_silenced = "ace_m4a1_gl_sd";
		_name = "M4A1";
	};	
//ace_m4_aim_gl_f
	case "ace_m4_aim_gl_f":{
		_standard = "ace_m4_aim_gl_f";
		_silenced = "ace_m4a1_gl_sd_f";
		_name = "M4A1";
	};
///-----------------m4a1s--------------------------//
	
//ace_m4a1_aim
	case "ace_m4a1_aim":{
		_standard = "ace_m4a1_aim";
		_silenced = "ace_m4a1_aim_sd";
		_name = "M4A1";
	};
	case "ace_m4a1_aim_sd":{
		_standard = "ace_m4_aim";
		_silenced = "ace_m4a1_aim_sd";
		_name = "M4A1";
	};
//ace_m4a1_aim_f
	case "ace_m4a1_aim_f":{
		_standard = "ace_m4a1_aim_f";
		_silenced = "ace_m4a1_aim_sd";
		_name = "M4A1";
	};

				
//ace_m4a1_acog	
	case "ace_m4a1_acog":{
		_standard = "ace_m4a1_acog";
		_silenced = "ace_m4a1_acog_sd";
		_name = "M4A1";
	};
	case "ace_m4a1_acog_sd":{
		_standard = "ace_m4a1_acog";
		_silenced = "ace_m4a1_acog_sd";
		_name = "M4A1";
	};											
//ace_m4a1_acog_f  
	case "ace_m4a1_acog_f":{
		_standard = "ace_m4a1_acog_f";
		_silenced = "ace_m4a1_acog_sd_f";
		_name = "M4A1";
	};
	case "ace_m4a1_acog_sd_f":{
		_standard = "ace_m4a1_acog_f";
		_silenced = "ace_m4a1_acog_sd_f";
		_name = "M4A1";
	};

		
//ace_m4a1_gl
	case "ace_m4a1_gl":{
		_standard = "ace_m4a1_gl";
		_silenced = "ace_m4a1_gl_sd";
		_name = "M4A1";
	};
	case "ace_m4a1_gl_sd":{
		_standard = "ace_m4a1_gl";
		_silenced = "ace_m4a1_gl_sd";	
		_name = "M4A1";	
	};
	
//ace_m4a1_gl_f
	case "ace_m4a1_gl_f":{
		_standard = "ace_m4a1_gl_f";
		_silenced = "ace_m4a1_gl_sd_f";
		_name = "M4A1";
	};
	case "sd ace_m4a1_gl_sd_f":{
		_standard = "ace_m4a1_gl_f";
		_silenced = "ace_m4a1_gl_sd_f";
		_name = "M4A1";
	};
		
//ace_m4a1_aim_gl
	case "ace_m4a1_aim_gl":{
		_standard = "ace_m4a1_aim_gl";
		_silenced = "ace_m4a1_aim_gl_sd";
		_name = "M4A1";
	};
	case "ace_m4a1_aim_gl_sd":{
		_standard = "ace_m4a1_aim_gl";
		_silenced = "ace_m4a1_aim_gl_sd";
		_name = "M4A1";
	};
	
//ace_m4a1_aim_gl_f
	case "ace_m4a1_aim_gl_f":{
		_standard = "ace_m4a1_aim_gl_f";
		_silenced = "ace_m4a1_aim_gl_sd_f";
		_name = "M4A1";
	};
	case "ace_m4a1_aim_gl_sd_f":{
		_standard = "ace_m4a1_aim_gl_f";
		_silenced = "ace_m4a1_aim_gl_sd_f";
		_name = "M4A1";
	};
	
	
//ace_m4a1_hws_gl_camo_up
	case "ace_m4a1_hws_gl_camo_up":{
		_standard = "ace_m4a1_hws_gl_camo_up";
		_silenced = "ace_m4a1_hws_gl_sd_camo_up";
		_name = "M4A1";
	};
	case "ace_m4a1_hws_gl_sd_camo_up":{
		_standard = "ace_m4a1_hws_gl_camo_up";
		_silenced = "ace_m4a1_hws_gl_sd_camo_up";
		_name = "M4A1";
	};
//---------------soc m4a1s------------------------//
//ace_soc_m4a1
	case "ace_soc_m4a1":{
		_standard = "ace_soc_m4a1";
		_silenced = "ace_soc_m4a1_sd_9";
		_name = "M4A1";
	};
	case "ace_soc_m4a1_sd_9":{
		_standard = "ace_soc_m4a1";
		_silenced = "ace_soc_m4a1_sd_9";
		_name = "M4A1";
	};
	
//ace_soc_m4a1_aim
	case "ace_soc_m4a1_aim":{
		_standard = "ace_soc_m4a1_aim";
		_silenced = "ace_soc_m4a1_aim_sd";
		_name = "M4A1";
	};
	case "ace_soc_m4a1_aim_sd":{
		_standard = "ace_soc_m4a1_aim";
		_silenced = "ace_soc_m4a1_aim_sd";
		_name = "M4A1";
	};
//ace_soc_m4a1_eot
	case "ace_soc_m4a1_eotech":{
		_standard = "ace_soc_m4a1_eotech";
		_silenced = "ace_soc_m4a1_eot_sd";
		_name = "M4A1";
	};
	case "ace_soc_m4a1_eot_sd":{
		_standard = "ace_soc_m4a1_eotech";
		_silenced = "ace_soc_m4a1_eot_sd";
		_name = "M4A1";
	};		
//ace_soc_m4a1_shortdot
	case "ace_soc_m4a1_shortdot":{
		_standard = "ace_soc_m4a1_shortdot";
		_silenced = "ace_soc_m4a1_shortdot_sd";
		_name = "M4A1";
	};
	case "ace_soc_m4a1_shortdot_sd":{
		_standard = "ace_soc_m4a1_shortdot";
		_silenced = "ace_soc_m4a1_shortdot_sd";
		_name = "M4A1";
	};
			
//ace_ump45
	case "ace_ump45":{
		_standard = "ace_ump45";
		_silenced = "ace_ump45_sd";
		_name = "UMP";
	};
	case "ace_ump45_sd":{
		_standard = "ace_ump45";
		_silenced = "ace_ump45_sd";
		_name = "UMP";
	};
	
//ace_ump45_aim
	case "ace_ump45_aim":{
		_standard = "ace_ump45_aim";
		_silenced = "ace_ump45_aim_sd";
		_name = "UMP";
	};
	case "ace_ump45_aim_sd":{
		_standard = "ace_ump45_aim";
		_silenced = "ace_ump45_aim_sd";
		_name = "UMP";
	};
	
//ace_mp5a5
	case "ace_mp5a5":{
		_standard = "ace_mp5a5";
		_silenced = "ace_mp5sd";
		_name = "MP5";
	};
	case "ace_mp5sd":{
		_standard = "ace_mp5a5";
		_silenced = "ace_mp5sd";
		_name = "MP5";
	};
//ace_mp5a5
//----------------------rh--------------------------//

//--------------------mk18s---------------------//
//rh_mk18
	case "rh_mk18":{
		_standard = "rh_mk18t";
		_silenced = "rh_mk18sd";
		_name = "MK18";
	};
//rh_mk18t
	case "rh_mk18t":{
		_standard = "rh_mk18t";
		_silenced = "rh_mk18sd";
		_name = "MK18";
	};
	case "rh_mk18sd":{
		_standard = "rh_mk18t";
		_silenced = "rh_mk18sd";
		_name = "MK18";
	};
//rh_mk18aim
	case "rh_mk18aim":{
		_standard = "rh_mk18aim";
		_silenced = "rh_mk18sdaim";
		_name = "MK18";
	};
	case "rh_mk18sdaim":{
		_standard = "rh_mk18aim";
		_silenced = "rh_mk18sdaim";
		_name = "MK18";
	};
//rh_mk18eot
	case "rh_mk18eot":{
		_standard = "rh_mk18eot";
		_silenced = "rh_mk18sdeot";
		_name = "MK18";
	};
	case "rh_mk18sdeot":{
		_standard = "rh_mk18eot";
		_silenced = "rh_mk18sdeot";
		_name = "MK18";
	};
//rh_mk18acog
	case "rh_mk18acog":{
		_standard = "rh_mk18acog";
		_silenced = "rh_mk18sdacog";
		_name = "MK18";
	};
	case "rh_mk18sdacog":{
		_standard = "rh_mk18acog";
		_silenced = "rh_mk18sdacog";
		_name = "MK18";
	};
	
//rh_mk18dc	
	case "rh_mk18dc":{
		_standard = "rh_mk18dc";
		_silenced = "rh_mk18dcsd";
		_name = "MK18";
	};
	case "rh_mk18dcsd":{
		_standard = "rh_mk18dc";
		_silenced = "rh_mk18dcsd";
		_name = "MK18";
	};
//rh_mk18dcaim	
	case "rh_mk18dcaim":{
		_standard = "rh_mk18dcaim";
		_silenced = "rh_mk18dcsdaim";
		_name = "MK18";
	};
	case "rh_mk18dcsd":{
		_standard = "rh_mk18dcaim";
		_silenced = "rh_mk18dcsdaim";
		_name = "MK18";
	};
	
//rh_mk18dceot	
	case "rh_mk18dceot":{
		_standard = "rh_mk18dceot";
		_silenced = "rh_mk18dcsdeot";
		_name = "MK18";
	};
	case "rh_mk18dcsdeot":{
		_standard = "rh_mk18dceot";
		_silenced = "rh_mk18dcsdeot";
		_name = "MK18";
	};
//rh_mk18dcacog	
	case "rh_mk18dcacog":{
		_standard = "rh_mk18dcacog";
		_silenced = "rh_mk18dcsdacog";
		_name = "MK18";
	};
	case "rh_mk18dcsdacog":{
		_standard = "rh_mk18dcacog";
		_silenced = "rh_mk18dcsdacog";
		_name = "MK18";
	};
//rh_mk18d	
	case "rh_mk18d":{
		_standard = "rh_mk18d";
		_silenced = "rh_mk18dsd";
		_name = "MK18";
	};
	case "rh_mk18dsd":{
		_standard = "rh_mk18d";
		_silenced = "rh_mk18dsd";
		_name = "MK18";
	};
//rh_mk18daim	
	case "rh_mk18daim":{
		_standard = "rh_mk18daim";
		_silenced = "rh_mk18dsdaim";
		_name = "MK18";
	};
	case "rh_mk18dsdaim":{
		_standard = "rh_mk18daim";
		_silenced = "rh_mk18dsdaim";
		_name = "MK18";
	};
	
//rh_mk18deot	
	case "rh_mk18deot":{
		_standard = "rh_mk18deot";
		_silenced = "rh_mk18dsdeot";
		_name = "MK18";
	};
	case "rh_mk18dsdeot":{
		_standard = "rh_mk18deot";
		_silenced = "rh_mk18dsdeot";
		_name = "MK18";
	};
//rh_mk18dacog	
	case "rh_mk18dacog":{
		_standard = "rh_mk18dacog";
		_silenced = "rh_mk18dsdacog";
		_name = "MK18";
	};
	case "rh_mk18dsdacog":{
		_standard = "rh_mk18dacog";
		_silenced = "rh_mk18dsdacog";
		_name = "MK18";
	};


//--------------------mk14s---------------------//
	
//rh_mk14t
	case "rh_mk14t":{
		_standard = "rh_mk14t";
		_silenced = "rh_mk14tsd";
		_name = "MK14";
	};
	case "rh_mk14tsd":{
		_standard = "rh_mk14t";
		_silenced = "rh_mk14tsd";
		_name = "MK14";
	};
//rh_mk14taim	
	case "rh_mk14taim":{
		_standard = "rh_mk14taim";
		_silenced = "rh_mk14tsdaim";
		_name = "MK14";
	};
	case "rh_mk14tsdaim":{
		_standard = "rh_mk14taim";
		_silenced = "rh_mk14tsdaim";
		_name = "MK14";
	};
//rh_mk14teot	
	case "rh_mk14teot":{
		_standard = "rh_mk14teot";
		_silenced = "rh_mk14tsdeot";
		_name = "MK14";
	};
	case "rh_mk14tsdeot":{
		_standard = "rh_mk14teot";
		_silenced = "rh_mk14tsdeot";
		_name = "MK14";
	};
//rh_mk14tacog	
	case "rh_mk14tacog":{
		_standard = "rh_mk14tacog";
		_silenced = "rh_mk14tsdacog";
		_name = "MK14";
	};
	case "rh_mk14tsdacog":{
		_standard = "rh_mk14tacog";
		_silenced = "rh_mk14tsdacog";
		_name = "MK14";
	};
//rh_mk14ebrgc
	case "rh_mk14ebrgc":{
		_standard = "rh_mk14ebrgc";
		_silenced = "rh_mk14ebrgc_sd";
		_name = "MK14";
	};
	case "rh_mk14ebrgc_sd":{
		_standard = "rh_mk14ebrgc";
		_silenced = "rh_mk14ebrgc_sd";
		_name = "MK14";
	};

//rh_mk14
	case "rh_mk14":{
		_standard = "rh_mk14";
		_silenced = "rh_mk14sd";
		_name = "MK14";
	};
	case "rh_mk14sd":{
		_standard = "rh_mk14";
		_silenced = "rh_mk14sd";
		_name = "MK14";
	};	
//rh_mk14aim
	case "rh_mk14aim":{
		_standard = "rh_mk14aim";
		_silenced = "rh_mk14sdaim";
		_name = "MK14";
	};
	case "rh_mk14sdaim":{
		_standard = "rh_mk14aim";
		_silenced = "rh_mk14sdaim";
		_name = "MK14";
	};
//rh_mk14eotech	
	case "rh_mk14eotech":{
		_standard = "rh_mk14eotech";
		_silenced = "rh_mk14sdeotech";
		_name = "MK14";
	};
	case "rh_mk14sdeotech":{
		_standard = "rh_mk14eotech";
		_silenced = "rh_mk14sdeotech";
		_name = "MK14";
	};
	
//rh_mk14acog
	case "rh_mk14acog":{
		_standard = "rh_mk14acog";
		_silenced = "rh_mk14sdacog";
		_name = "MK14";
	};
	case "rh_mk14sdacog":{
		_standard = "rh_mk14acog";
		_silenced = "rh_mk14sdacog";
		_name = "MK14";
	};
	
//rh_m14ebr
	case "rh_m14ebr":{
		_standard = "rh_m14ebr";
		_silenced = "rh_m14ebr_sd";
		_name = "MK14";
	};
	case "rh_m14ebr_sd":{
		_standard = "rh_m14ebr";
		_silenced = "rh_m14ebr_sd";
		_name = "MK14";
	};
//rh_mk14ebrgc
	case "rh_m14ebrgc":{
		_standard = "rh_m14ebrgc";
		_silenced = "rh_m14ebrgc_sd";
		_name = "MK14";
	};
	case "rh_m14ebrgc_sd":{
		_standard = "rh_m14ebrgc";
		_silenced = "rh_m14ebrgc_sd";
		_name = "MK14";
	};


	
//----------------scar hs------------------------//
//rh_scarh_aim
	case "rh_scarh_aim":{
		_standard = "rh_scarh_aim";
		_silenced = "rh_scarh_sd_aim";
		_name = "SCAR-H";
	};
	case "rh_scarh_sd_aim":{
		_standard = "rh_scarh_aim";
		_silenced = "rh_scarh_sd_aim";
		_name = "SCAR-H";
	};
//rh_scarh_eotech
	case "rh_scarh_eotech":{
		_standard = "rh_scarh_eotech";
		_silenced = "rh_scarh_sd_eotech";
		_name = "SCAR-H";
	};
	case "rh_scarh_sd_eotech":{
		_standard = "rh_scarh_eotech";
		_silenced = "rh_scarh_sd_eotech";
		_name = "SCAR-H";
	};
//rh_scarh_acog	
	case "rh_scarh_acog":{
		_standard = "rh_scarh_acog";
		_silenced = "rh_scarh_sd_acog";
		_name = "SCAR-H";
	};
	case "rh_scarh_sd_acog":{
		_standard = "rh_scarh_acog";
		_silenced = "rh_scarh_sd_acog";
		_name = "SCAR-H";
	};
//rh_scarh_gl_aim	
	case "rh_scarh_gl_aim":{
		_standard = "rh_scarh_gl_aim";
		_silenced = "rh_scarh_sd_gl_aim";
		_name = "SCAR-H";
	};
	case "rh_scarh_sd_gl_aim":{
		_standard = "rh_scarh_gl_aim";
		_silenced = "rh_scarh_sd_gl_aim";
		_name = "SCAR-H";
	};
//rh_scarh_gl_eotech	
	case "rh_scarh_gl_eotech":{
		_standard = "rh_scarh_gl_eotech";
		_silenced = "rh_scarh_sd_gl_eotech";
		_name = "SCAR-H";
	};
	case "rh_scarh_sd_gl_eotech":{
		_standard = "rh_scarh_gl_eotech";
		_silenced = "rh_scarh_sd_gl_eotech";
		_name = "SCAR-H";
	};	
//----------------scar ls------------------------//
//rh_scarl_doc
	case "rh_scarl_doc":{
		_standard = "rh_scarl_doc";
		_silenced = "rh_scarl_sd_doc";
		_name = "SCAR-L";
	};
	case "rh_scarl_sd_doc":{
		_standard = "rh_scarl_doc";
		_silenced = "rh_scarl_sd_doc";
		_name = "SCAR-L";
	};
//rh_scarl_aim
	case "rh_scarl_aim":{
		_standard = "rh_scarl_aim";
		_silenced = "rh_scarl_sd_aim";
		_name = "SCAR-L";
	};
	case "rh_scarl_sd_aim":{
		_standard = "rh_scarl_aim";
		_silenced = "rh_scarl_sd_aim";
		_name = "SCAR-L";
	};
//rh_scarl_eotech
	case "rh_scarl_eotech":{
		_standard = "rh_scarl_eotech";
		_silenced = "rh_scarl_sd_eotech";
		_name = "SCAR-L";
	};
	case "rh_scarl_sd_eotech":{
		_standard = "rh_scarl_eotech";
		_silenced = "rh_scarl_sd_eotech";
		_name = "SCAR-L";
	};
//rh_scarl_acog
	case "rh_scarl_acog":{
		_standard = "rh_scarl_acog";
		_silenced = "rh_scarl_sd_acog";
		_name = "SCAR-L";
	};
	case "rh_scarl_sd_acog":{
		_standard = "rh_scarl_acog";
		_silenced = "rh_scarl_sd_acog";
		_name = "SCAR-L";
	};
//rh_scarl_gl_aim	
	case "rh_scarl_gl_aim":{
		_standard = "rh_scarl_gl_aim";
		_silenced = "rh_scarl_sd_gl_aim";
		_name = "SCAR-L";
	};
	case "rh_scarl_sd_gl_aim":{
		_standard = "rh_scarl_gl_aim";
		_silenced = "rh_scarl_sd_gl_aim";
		_name = "SCAR-L";
	};
//rh_scarl_gl_eoteh	
	case "rh_scarl_gl_eotech":{
		_standard = "rh_scarl_gl_eotech";
		_silenced = "rh_scarl_sd_gl_eotech";
		_name = "SCAR-L";
	};
	case "rh_scarl_sd_gl_eotech":{
		_standard = "rh_scarl_gl_eotech";
		_silenced = "rh_scarl_sd_gl_eotech";
		_name = "SCAR-L";
	};
//rh_scarl_gl_acog	
	case "rh_scarl_gl_acog":{
		_standard = "rh_scarl_gl_acog";
		_silenced = "rh_scarl_sd_gl_acog";
		_name = "SCAR-L";
	};
	case "rh_scarl_sd_gl_acog":{
		_standard = "rh_scarl_gl_acog";
		_silenced = "rh_scarl_sd_gl_acog";
		_name = "SCAR-L";
	};
	
//----------------masada------------------------//
//rh_mas	
	case "rh_mas":{
		_standard = "rh_mas";
		_silenced = "rh_massd";
		_name = "Masada";
		
	};
	case "rh_massd":{
		_standard = "rh_mas";
		_silenced = "rh_massd";
		_name = "Masada";
	};
//rh_masaim	
	case "rh_masaim":{
		_standard = "rh_masaim";
		_silenced = "rh_massdaim";
		_name = "Masada";
	};
	case "rh_massdaim":{
		_standard = "rh_masaim";
		_silenced = "rh_massdaim";
		_name = "Masada";
	};
//rh_maseotech	
	case "rh_maseotech":{
		_standard = "rh_maseotech";
		_silenced = "rh_massdeotech";
		_name = "Masada";
	};
	case "rh_massdeotech":{
		_standard = "rh_maseotech";
		_silenced = "rh_massdeotech";
		_name = "Masada";
	};
//rh_masacog	
	case "rh_masacog":{
		_standard = "rh_masacog";
		_silenced = "rh_massdacog";
		_name = "Masada";
	};
	case "rh_massdacog":{
		_standard = "rh_masacog";
		_silenced = "rh_massdacog";
		_name = "Masada";
	};
	
//rh_masb	
	case "rh_masb":{
		_standard = "rh_masb";
		_silenced = "rh_masbsd";
		_name = "Masada";
	};
	case "rh_masbsd":{
		_standard = "rh_masb";
		_silenced = "rh_masbsd";
		_name = "Masada";
	};
//rh_masbaim	
	case "rh_masbaim":{
		_standard = "rh_masbaim";
		_silenced = "rh_masbsdaim";
		_name = "Masada";
	};
	case "rh_masbsdaim":{
		_standard = "rh_masbaim";
		_silenced = "rh_masbsdaim";
		_name = "Masada";
	};
//rh_masbeotech	
	case "rh_masbeotech":{
		_standard = "rh_masbeotech";
		_silenced = "rh_masbsdeotech";
		_name = "Masada";
	};
	case "rh_masbsdeotech":{
		_standard = "rh_masbeotech";
		_silenced = "rh_masbsdeotech";
		_name = "Masada";
	};
//rh_masbacog	
	case "rh_masbacog":{
		_standard = "rh_masbacog";
		_silenced = "rh_masbsdacog";
		_name = "Masada";
	};
	case "rh_masbsdacog":{
		_standard = "rh_masbacog";
		_silenced = "rh_masbsdacog";
		_name = "Masada";
	};

//----------------hk416s------------------------//
//rh_hk416	
	case "rh_hk416":{
		_standard = "rh_hk416";
		_silenced = "rh_hk416sd";
		_name = "HK416";
	};
	case "rh_hk416sd":{
		_standard = "rh_hk416";
		_silenced = "rh_hk416sd";
		_name = "HK416";
	};
//rh_hk416aim	
	case "rh_hk416aim":{
		_standard = "rh_hk416aim";
		_silenced = "rh_hk416sdaim";
		_name = "HK416";
	};
	case "rh_hk416sdaim":{
		_standard = "rh_hk416aim";
		_silenced = "rh_hk416sdaim";
		_name = "HK416";
	};
//rh_hk416eotech	
	case "rh_hk416eotech":{
		_standard = "rh_hk416eotech";
		_silenced = "rh_hk416sdeotech";
		_name = "HK416";
	};
	case "rh_hk416sdeotech":{
		_standard = "rh_hk416eotech";
		_silenced = "rh_hk416sdeotech";
		_name = "HK416";
	};
	
/*
//rh_hk416acog	
	case "rh_hk416acog":{
		_standard = "rh_hk416acog";
		_silenced = "rh_hk416sdacog";
		_name = "HK416";
	};
	case "rh_hk416sdacog":{
		_standard = "rh_hk416acog";
		_silenced = "rh_hk416sdacog";
		_name = "HK416";
	};
//ace_hk416_d14_acog_pvs14
	//case "ace_hk416_d14_acog_pvs14":{
		//_standard = nil;
		//_silenced = nil;
	//}; 
*/
	
//rh_hk416gl	
	case "rh_hk416gl":{
		_standard = "rh_hk416gl";
		_silenced = "rh_hk416sdgl";
		_name = "HK416";
	};
	case "rh_hk416sdgl":{
		_standard = "rh_hk416gl";
		_silenced = "rh_hk416sdgl";
		_name = "HK416";
	};
//rh_hk416glaim	
	case "rh_hk416glaim":{
		_standard = "rh_hk416glaim";
		_silenced = "rh_hk416sdglaim";
		_name = "HK416";
	};
	case "rh_hk416sdglaim":{
		_standard = "rh_hk416glaim";
		_silenced = "rh_hk416sdglaim";
		_name = "HK416";
	};
//rh_hk416gleotech	
	case "rh_hk416gleotech":{
		_standard = "rh_hk416gleotech";
		_silenced = "rh_hk416sdgleotech";
		_name = "HK416";
	};
	case "rh_hk416sdgleotech":{
		_standard = "rh_hk416gleotech";
		_silenced = "rh_hk416sdgleotech";
		_name = "HK416";
	};
//----------------hk417s------------------------//

//rh_hk417	
	case "rh_hk417":{
		_standard = "rh_hk417";
		_silenced = "rh_hk417sd";
		_name = "HK417";
	};
	case "rh_hk417sd":{
		_standard = "rh_hk417";
		_silenced = "rh_hk417sd";
		_name = "HK417";
	};
//rh_hk417aim	
	case "rh_hk417aim":{
		_standard = "rh_hk417aim";
		_silenced = "rh_hk417sdaim";
		_name = "HK417";
	};
	case "rh_hk417sdaim":{
		_standard = "rh_hk417aim";
		_silenced = "rh_hk417sdaim";
		_name = "HK417";
	};
//rh_hk417eotech	
	case "rh_hk417eotech":{
		_standard = "rh_hk417eotech";
		_silenced = "rh_hk417sdeotech";
		_name = "HK417";
	};
	case "rh_hk417sdeotech":{
		_standard = "rh_hk417eotech";
		_silenced = "rh_hk417sdeotech";
		_name = "HK417";
	};
//rh_hk417acog	
	case "rh_hk417acog":{
		_standard = "rh_hk417acog";
		_silenced = "rh_hk417sdacog";
		_name = "HK417";
	};
	case "rh_hk417sdacog":{
		_standard = "rh_hk417acog";
		_silenced = "rh_hk417sdacog";
		_name = "HK417";
	};	
//----------------rh m4s------------------------//
//rh_m4	
	case "rh_m4":{
		_standard = "rh_m4";
		_silenced = "rh_m4sd";
		_name = "M4";
	};
//rh_m4r
	case "rh_m4r":{
		_standard = "rh_m4r";
		_silenced = "rh_m4sd";
		_name = "M4";
	};
//rh_m4aim
	case "rh_m4aim":{
		_standard = "rh_m4aim";
		_silenced = "rh_m4sdaim";
		_name = "M4";
	};
//rh_m4eotech
	case "rh_m4eotech":{
		_standard = "rh_m4eotech";
		_silenced = "rh_m4sdeotech";
		_name = "M4";
	};
//rh_m4acog
	case "rh_m4acog":{
		_standard = "rh_m4acog";
		_silenced = "rh_m4sdacog";
		_name = "M4";
	};
//rh_m4gl
	case "rh_m4gl":{
		_standard = "rh_m4gl";
		_silenced = "rh_m4sdgl";
		_name = "M4";
	};
//rh_m4glaim
	case "rh_m4glaim":{
		_standard = "rh_m4glaim";
		_silenced = "rh_m4sdglaim";
		_name = "M4";
	};
//rh_m4gleotech
	case "rh_m4gleotech":{
		_standard = "rh_m4gleotech";
		_silenced = "rh_m4sdgleotech";
		_name = "M4";
	};
//rh_m4glacog
	case "rh_m4glacog":{
		_standard = "rh_m4glacog";
		_silenced = "rh_m4sdglacog";
		_name = "M4";
	};
//rh_m4a1	
	case "rh_m4a1":{
		_standard = "rh_m4a1r";
		_silenced = "rh_m4sd";
		_name = "M4";
	};
//rh_m4a1r
	case "rh_m4a1r":{
		_standard = "rh_m4a1r";
		_silenced = "rh_m4sd";
		_name = "M4";
	};
	case "rh_m4sd":{
		_standard = "rh_m4a1r";
		_silenced = "rh_m4sd";
		_name = "M4";
	};
//rh_m4a1aim
	case "rh_m4a1aim":{
		_standard = "rh_m4a1aim";
		_silenced = "rh_m4sdaim";
		_name = "M4A1";
	};
	case "rh_m4sdaim":{
		_standard = "rh_m4a1aim";
		_silenced = "rh_m4sdaim";
		_name = "M4A1";
	};
//rh_m4a1eotech
	case "rh_m4a1eotech":{
		_standard = "rh_m4a1eotech";
		_silenced = "rh_m4sdeotech";
		_name = "M4A1";
	};
	case "rh_m4sdeotech":{
		_standard = "rh_m4a1eotech";
		_silenced = "rh_m4sdeotech";
		_name = "M4A1";
	};
//rh_m4a1acog
	case "rh_m4a1acog":{
		_standard = "rh_m4a1acog";
		_silenced = "rh_m4sdacog";
		_name = "M4A1";
	};
	case "rh_m4sdacog":{
		_standard = "rh_m4a1acog";
		_silenced = "rh_m4sdacog";
		_name = "M4A1";
	};
//rh_m4a1gl
	case "rh_m4a1gl":{
		_standard = "rh_m4a1gl";
		_silenced = "rh_m4sdgl";
		_name = "M4A1";
	};
	case "rh_m4sdgl":{
		_standard = "rh_m4a1gl";
		_silenced = "rh_m4sdgl";
		_name = "M4A1";
	};
//rh_m4a1glaim
	case "rh_m4a1glaim":{
		_standard = "rh_m4a1glaim";
		_silenced = "rh_m4sdglaim";
		_name = "M4A1";
	};
	case "rh_m4sdglaim":{
		_standard = "rh_m4a1glaim";
		_silenced = "rh_m4sdglaim";
		_name = "M4A1";
	};
//rh_m4a1gleotech
	case "rh_m4a1gleotech":{
		_standard = "rh_m4a1gleotech";
		_silenced = "rh_m4sdgleotech";
		_name = "M4A1";
	};
	case "rh_m4sdgleotech":{
		_standard = "rh_m4a1gleotech";
		_silenced = "rh_m4sdgleotech";
		_name = "M4A1";
	};
//rh_m4a1glacog
	case "rh_m4a1glacog":{
		_standard = "rh_m4a1glacog";
		_silenced = "rh_m4sdglacog";
		_name = "M4A1";
	};
	case "rh_m4sdglacog":{
		_standard = "rh_m4a1glacog";
		_silenced = "rh_m4sdglacog";
		_name = "M4A1";
	};	
//rh_m4aim_wdl
	case "rh_m4aim_wdl":{
		_standard = "rh_m4aim_wdl";
		_silenced = "rh_m4sdaim_wdl";
		_name = "M4A1";
	};
	case "rh_m4sdaim_wdl":{
		_standard = "rh_m4aim_wdl";
		_silenced = "rh_m4sdaim_wdl";
		_name = "M4A1";
	};
//-----------------mrgs rh m4s----------------------------//
//rh_m4ct
	case "rh_m4ct":{
		_standard = "rh_m4ct";
		_silenced = "rh_m4ctsd";
		_name = "M4A1";
	};
	case "rh_m4ctsd":{
		_standard = "rh_m4ct";
		_silenced = "rh_m4ctsd";
		_name = "M4A1";
	};
//rh_m4ct_f
	case "rh_m4ct_f":{
		_standard = "rh_m4ct_f";
		_silenced = "rh_m4ctsd_f";
		_name = "M4A1";
	};
	case "rh_m4ctsd_f":{
		_standard = "rh_m4ct_f";
		_silenced = "rh_m4ctsd_f";
		_name = "M4A1";
	};
//rh_m4caim
	case "rh_m4caim":{
		_standard = "rh_m4caim";
		_silenced = "rh_m4ctsdaim";
		_name = "M4A1";
	};
	case "rh_m4csdaim":{
		_standard = "rh_m4caim";
		_silenced = "rh_m4ctsdaim";
		_name = "M4A1";
	};
//rh_m4csdaim_f
	case "rh_m4csdaim_f":{
		_standard = "rh_m4caim_f";
		_silenced = "rh_m4csdaim";
		_name = "M4A1";
	};	
//rh_m4ceotech
	case "rh_m4ceotech":{
		_standard = "rh_m4ceotech";
		_silenced = "rh_m4ctsdeotech";
		_name = "M4A1";
	};
	case "rh_m4ctsdeotech":{
		_standard = "rh_m4ceotech";
		_silenced = "rh_m4ctsdeotech";
		_name = "M4A1";
	};
//rh_m4ctsdeotech_f
	case "rh_m4ctsdeotech_f":{
		_standard = "rh_m4ceotech";
		_silenced = "rh_m4ctsdeotech_f";
		_name = "M4A1";
	};	
//rh_m4cacog
	case "rh_m4cacog":{
		_standard = "rh_m4cacog";
		_silenced = "rh_m4ctsdacog";
		_name = "M4A1";
	};
	case "rh_m4ctsdacog":{
		_standard = "rh_m4cacog";
		_silenced = "rh_m4ctsdacog";
		_name = "M4A1";
	};	
//rh_m4cacog_f
	case "rh_m4ctsdacog_f":{
		_standard = "rh_m4cacog";
		_silenced = "rh_m4ctsdacog_f";
		_name = "M4A1";
	};

//rh_m4cgl
	case "rh_m4cgl":{
		_standard = "rh_m4cgl";
		_silenced = "rh_m4ctsdgl";
		_name = "M4A1";
	};
	case "rh_m4ctsdgl":{
		_standard = "rh_m4cgl";
		_silenced = "rh_m4ctsdgl";
		_name = "M4A1";
	};
//rh_m4ctsdgl_f
	case "rh_m4ctsdgl_f":{
		_standard = "rh_m4cgl";
		_silenced = "rh_m4ctsdgl_f";
		_name = "M4A1";
	};
//rh_m4cglaim
	case "rh_m4cglaim":{
		_standard = "rh_m4cglaim";
		_silenced = "rh_m4ctsdglaim";
		_name = "M4A1";
	};
	case "rh_m4ctsdglaim":{
		_standard = "rh_m4cglaim";
		_silenced = "rh_m4ctsdglaim";
		_name = "M4A1";
	};
//rh_m4csdglaim_f
	case "rh_m4ctsdglaim_f":{
		_standard = "rh_m4cglaim";
		_silenced = "rh_m4ctsdglaim_f";
		_name = "M4A1";
	};
//rh_m4cgleotech
	case "rh_m4cgleotech":{
		_standard = "rh_m4cgleotech";
		_silenced = "rh_m4ctsdgleotech";
		_name = "M4A1";
	};
	case "rh_m4ctsdgleotech":{
		_standard = "rh_m4cgleotech";
		_silenced = "rh_m4ctsdgleotech";
		_name = "M4A1";
	};
//rh_m4ctsdgleotech_f
	case "rh_m4ctsdgleotech_f":{
		_standard = "rh_m4cgleotech";
		_silenced = "rh_m4ctsdgleotech_f";
		_name = "M4A1";
	};
//rh_m4ctglacog
	case "rh_m4cglacog":{
		_standard = "rh_m4cglacog";
		_silenced = "rh_m4ctsdglacog";
		_name = "M4A1";
	};
	case "rh_m4ctsdglacog":{
		_standard = "rh_m4cglacog";
		_silenced = "rh_m4ctsdglacog";
		_name = "M4A1";
	};
//rh_m4ctglacog_f
	case "rh_m4ctsdglacog_f":{
		_standard = "rh_m4cglacog";
		_silenced = "rh_m4ctsdglacog_f";
		_name = "M4A1";
	};

//--------british weapons-------------//	
	case "len_l119a1_acog_pf":{
		_standard = "len_l119a1_acog_pf";
		_silenced = "len_l119a1_acog_pf_sd";
		_name = "L119A1";
	};
	case "len_l119a1_acog_pf_sd":{
		_standard = "len_l119a1_acog_pf";
		_silenced = "len_l119a1_acog_pf_sd";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb":{
		_standard = "len_l119a1_acog_cqb";
		_silenced = "len_l119a1_acog_cqb_sd";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb_sd":{
		_standard = "len_l119a1_acog_cqb";
		_silenced = "len_l119a1_acog_cqb_sd";
		_name = "L119A1";
	};
	case "len_l119a1_eot_cqb":{
		_standard = "len_l119a1_eot_cqb";
		_silenced = "len_l119a1_eot_cqb_sd";
		_name = "L119A1";
	};
	case "len_l119a1_eot_cqb_sd":{
		_standard = "len_l119a1_eot_cqb";
		_silenced = "len_l119a1_eot_cqb_sd";
		_name = "L119A1";
	};
	case "len_l119a1_eot_pf":{
		_standard = "len_l119a1_eot_pf";
		_silenced = "len_l119a1_eot_pf_sd";
		_name = "L119A1";
	};
	case "len_l119a1_eot_pf_sd":{
		_standard = "len_l119a1_eot_pf";
		_silenced = "len_l119a1_eot_pf_sd";
		_name = "L119A1";
	};
	case "len_l119a1_acog_hg":{
		_standard = "len_l119a1_acog_hg";
		_silenced = "len_l119a1_acog_cqb_sd_hg";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb_sd_hg":{
		_standard = "len_l119a1_acog_hg";
		_silenced = "len_l119a1_acog_cqb_sd_hg";
		_name = "L119A1";
	};
	case "len_l119a1_acog_pf_w":{
		_standard = "len_l119a1_acog_pf_w";
		_silenced = "len_l119a1_acog_pf_sd_w";
		_name = "L119A1";
	};
	case "len_l119a1_acog_pf_sd_w":{
		_standard = "len_l119a1_acog_pf_w";
		_silenced = "len_l119a1_acog_pf_sd_w";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb_w":{
		_standard = "len_l119a1_acog_cqb_w";
		_silenced = "len_l119a1_acog_cqb_sd_w";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb_sd_w":{
		_standard = "len_l119a1_acog_cqb_w";
		_silenced = "len_l119a1_acog_cqb_sd_w";
		_name = "L119A1";
	};
	case "len_l119a1_eot_cqb_w":{
		_standard = "len_l119a1_eot_cqb_w";
		_silenced = "len_l119a1_eot_cqb_sd_w";
		_name = "L119A1";
	};
	case "len_l119a1_eot_cqb_sd_w":{
		_standard = "len_l119a1_eot_cqb_w";
		_silenced = "len_l119a1_eot_cqb_sd_w";
		_name = "L119A1";
	};
	case "len_l119a1_eot_pf_w":{
		_standard = "len_l119a1_eot_pf_w";
		_silenced = "len_l119a1_eot_pf_sd_w";
		_name = "L119A1";
	};
	case "len_l119a1_eot_pf_sd_w":{
		_standard = "len_l119a1_eot_pf_w";
		_silenced = "len_l119a1_eot_pf_sd_w";
		_name = "L119A1";
	};
	case "len_l119a1_acog_hg_w":{
		_standard = "len_l119a1_acog_hg_w";
		_silenced = "len_l119a1_acog_cqb_sd_hg_w";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb_sd_hg_w":{
		_standard = "len_l119a1_acog_hg_w";
		_silenced = "len_l119a1_acog_cqb_sd_hg_w";
		_name = "L119A1";
	};
	
	case "len_l119a1_acog_pf_d":{
		_standard = "len_l119a1_acog_pf_d";
		_silenced = "len_l119a1_acog_pf_sd_d";
		_name = "L119A1";
	};
	case "len_l119a1_acog_pf_sd_d":{
		_standard = "len_l119a1_acog_pf_d";
		_silenced = "len_l119a1_acog_pf_sd_d";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb_d":{
		_standard = "len_l119a1_acog_cqb_d";
		_silenced = "len_l119a1_acog_cqb_sd_d";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb_sd_d":{
		_standard = "len_l119a1_acog_cqb_d";
		_silenced = "len_l119a1_acog_cqb_sd_d";
		_name = "L119A1";
	};
	case "len_l119a1_eot_cqb_d":{
		_standard = "len_l119a1_eot_cqb_d";
		_silenced = "len_l119a1_eot_cqb_sd_d";
		_name = "L119A1";
	};
	case "len_l119a1_eot_cqb_sd_d":{
		_standard = "len_l119a1_eot_cqb_d";
		_silenced = "len_l119a1_eot_cqb_sd_d";
		_name = "L119A1";
	};
	case "len_l119a1_eot_pf_d":{
		_standard = "len_l119a1_eot_pf_d";
		_silenced = "len_l119a1_eot_pf_sd_d";
		_name = "L119A1";
	};
	case "len_l119a1_eot_pf_sd_d":{
		_standard = "len_l119a1_eot_pf_d";
		_silenced = "len_l119a1_eot_pf_sd_d";
		_name = "L119A1";
	};
	case "len_l119a1_acog_hg_d":{
		_standard = "len_l119a1_acog_hg_d";
		_silenced = "len_l119a1_acog_cqb_sd_hg_d";
		_name = "L119A1";
	};
	case "len_l119a1_acog_cqb_sd_hg_d":{
		_standard = "len_l119a1_acog_hg_d";
		_silenced = "len_l119a1_acog_cqb_sd_hg_d";
		_name = "L119A1";
	};
//---------------------------------------//		
	
			
//design mastery m4s
	case "dm_m4_eo_ir":{
		_standard = "dm_m4_eo_ir";
		_silenced = "dm_m4_eo_ir_sil";
		_name = "M4A1";
	};
	case "dm_m4_eo_ir_sil":{
		_standard = "dm_m4_eo_ir";
		_silenced = "dm_m4_eo_ir_sil";
		_name = "M4A1";
	};
	case "dm_m4_eo_ir_fg":{
		_standard = "dm_m4_eo_ir_fg";
		_silenced = "dm_m4_eo_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_eo_ir_sil_fg":{
		_standard = "dm_m4_eo_ir_fg";
		_silenced = "dm_m4_eo_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_eo_ir_gl":{
		_standard = "dm_m4_eo_ir_gl";
		_silenced = "dm_m4_eo_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_eo_ir_sil_gl":{
		_standard = "dm_m4_eo_ir_gl";
		_silenced = "dm_m4_eo_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_eo_lp":{
		_standard = "dm_m4_eo_lp";
		_silenced = "dm_m4_eo_lp_sil";
		_name = "M4A1";
	};
	case "dm_m4_eo_lp_sil":{
		_standard = "dm_m4_eo_lp";
		_silenced = "dm_m4_eo_lp_sil";
		_name = "M4A1";
	};
	case "dm_m4_eo_lp_fg":{
		_standard = "dm_m4_eo_lp_fg";
		_silenced = "dm_m4_eo_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_eo_lp_sil_fg":{
		_standard = "dm_m4_eo_lp_fg";
		_silenced = "dm_m4_eo_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_eo_lp_gl":{
		_standard = "dm_m4_eo_lp_gl";
		_silenced = "dm_m4_eo_lp_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_eo_lp_sil_gl":{
		_standard = "dm_m4_eo_lp_gl";
		_silenced = "dm_m4_eo_lp_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_cco_ir":{
		_standard = "dm_m4_cco_ir";
		_silenced = "dm_m4_cco_ir_sil";
		_name = "M4A1";
	};
	case "dm_m4_cco_ir_sil":{
		_standard = "dm_m4_cco_ir";
		_silenced = "dm_m4_cco_ir_sil";
		_name = "M4A1";
	};
	case "dm_m4_cco_ir_fg":{
		_standard = "dm_m4_cco_ir_fg";
		_silenced = "dm_m4_cco_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_cco_ir_sil_fg":{
		_standard = "dm_m4_cco_ir_fg";
		_silenced = "dm_m4_cco_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_cco_ir_gl":{
		_standard = "dm_m4_cco_ir_gl";
		_silenced = "dm_m4_cco_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_cco_ir_sil_gl":{
		_standard = "dm_m4_cco_ir_gl";
		_silenced = "dm_m4_cco_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_cco_lp":{
		_standard = "dm_m4_cco_lp";
		_silenced = "dm_m4_cco_lp_sil";
		_name = "M4A1";
	};
	case "dm_m4_cco_lp_sil":{
		_standard = "dm_m4_cco_lp";
		_silenced = "dm_m4_cco_lp_sil";
		_name = "M4A1";
	};
	case "dm_m4_cco_lp_fg":{
		_standard = "dm_m4_cco_lp_fg";
		_silenced = "dm_m4_cco_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_cco_lp_sil_fg":{
		_standard = "dm_m4_cco_lp_fg";
		_silenced = "dm_m4_cco_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_cco_lp_gl":{
		_standard = "dm_m4_cco_lp_gl";
		_silenced = "dm_m4_cco_lp_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_cco_lp_sil_gl":{
		_standard = "dm_m4_cco_lp_gl";
		_silenced = "dm_m4_cco_lp_sil_gl";
		_name = "M4A1";
	};
	
	case "dm_m4_rco_ir":{
		_standard = "dm_m4_rco_ir";
		_silenced = "dm_m4_rco_ir_sil";
		_name = "M4A1";
	};
	case "dm_m4_rco_ir_sil":{
		_standard = "dm_m4_rco_ir";
		_silenced = "dm_m4_rco_ir_sil";
		_name = "M4A1";
	};
	case "dm_m4_rco_ir_fg":{
		_standard = "dm_m4_rco_ir_fg";
		_silenced = "dm_m4_rco_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_rco_ir_sil_fg":{
		_standard = "dm_m4_rco_ir_fg";
		_silenced = "dm_m4_rco_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_rco_ir_gl":{
		_standard = "dm_m4_rco_ir_gl";
		_silenced = "dm_m4_rco_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_rco_ir_sil_gl":{
		_standard = "dm_m4_rco_ir_gl";
		_silenced = "dm_m4_rco_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_rco_lp":{
		_standard = "dm_m4_rco_lp";
		_silenced = "dm_m4_rco_lp_sil";
		_name = "M4A1";
	};
	case "dm_m4_rco_lp_sil":{
		_standard = "dm_m4_rco_lp";
		_silenced = "dm_m4_rco_lp_sil";
		_name = "M4A1";
	};
	case "dm_m4_rco_lp_fg":{
		_standard = "dm_m4_rco_lp_fg";
		_silenced = "dm_m4_rco_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_rco_lp_sil_fg":{
		_standard = "dm_m4_rco_lp_fg";
		_silenced = "dm_m4_rco_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_m4_rco_lp_gl":{
		_standard = "dm_m4_rco_lp_gl";
		_silenced = "dm_m4_rco_lp_sil_gl";
		_name = "M4A1";
	};
	case "dm_m4_rco_lp_sil_gl":{
		_standard = "dm_m4_rco_lp_gl";
		_silenced = "dm_m4_rco_lp_sil_gl";
		_name = "M4A1";
	};
	
	case "dm_camo_m4_eo_ir":{
		_standard = "dm_camo_m4_eo_ir";
		_silenced = "dm_camo_m4_eo_ir_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_ir_sil":{
		_standard = "dm_camo_m4_eo_ir";
		_silenced = "dm_camo_m4_eo_ir_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_ir_fg":{
		_standard = "dm_camo_m4_eo_ir_fg";
		_silenced = "dm_camo_m4_eo_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_ir_sil_fg":{
		_standard = "dm_camo_m4_eo_ir_fg";
		_silenced = "dm_camo_m4_eo_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_ir_gl":{
		_standard = "dm_camo_m4_eo_ir_gl";
		_silenced = "dm_camo_m4_eo_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_ir_sil_gl":{
		_standard = "dm_camo_m4_eo_ir_gl";
		_silenced = "dm_camo_m4_eo_ir_sil_gl";
		_name = "M4A1";
	};


	case "dm_camo_m4_eo_lp":{
		_standard = "dm_camo_m4_eo_lp";
		_silenced = "dm_camo_m4_eo_lp_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_lp_sil":{
		_standard = "dm_camo_m4_eo_lp";
		_silenced = "dm_camo_m4_eo_lp_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_lp_fg":{
		_standard = "dm_camo_m4_eo_lp_fg";
		_silenced = "dm_camo_m4_eo_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_lp_sil_fg":{
		_standard = "dm_camo_m4_eo_lp_fg";
		_silenced = "dm_camo_m4_eo_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_lp_gl":{
		_standard = "dm_camo_m4_eo_lp_gl";
		_silenced = "dm_camo_m4_eo_lp_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_eo_lp_sil_gl":{
		_standard = "dm_camo_m4_eo_lp_gl";
		_silenced = "dm_camo_m4_eo_lp_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_ir":{
		_standard = "dm_camo_m4_cco_ir";
		_silenced = "dm_camo_m4_cco_ir_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_ir_sil":{
		_standard = "dm_camo_m4_cco_ir";
		_silenced = "dm_camo_m4_cco_ir_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_ir_fg":{
		_standard = "dm_camo_m4_cco_ir_fg";
		_silenced = "dm_camo_m4_cco_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_ir_sil_fg":{
		_standard = "dm_camo_m4_cco_ir_fg";
		_silenced = "dm_camo_m4_cco_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_ir_gl":{
		_standard = "dm_camo_m4_cco_ir_gl";
		_silenced = "dm_camo_m4_cco_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_ir_sil_gl":{
		_standard = "dm_camo_m4_cco_ir_gl";
		_silenced = "dm_camo_m4_cco_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_lp":{
		_standard = "dm_camo_m4_cco_lp";
		_silenced = "dm_camo_m4_cco_lp_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_lp_sil":{
		_standard = "dm_camo_m4_cco_lp";
		_silenced = "dm_camo_m4_cco_lp_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_lp_fg":{
		_standard = "dm_camo_m4_cco_lp_fg";
		_silenced = "dm_camo_m4_cco_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_lp_sil_fg":{
		_standard = "dm_camo_m4_cco_lp_fg";
		_silenced = "dm_camo_m4_cco_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_lp_gl":{
		_standard = "dm_camo_m4_cco_lp_gl";
		_silenced = "dm_camo_m4_cco_lp_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_cco_lp_sil_gl":{
		_standard = "dm_camo_m4_cco_lp_gl";
		_silenced = "dm_camo_m4_cco_lp_sil_gl";
		_name = "M4A1";
	};
	
	case "dm_camo_m4_rco_ir":{
		_standard = "dm_camo_m4_rco_ir";
		_silenced = "dm_camo_m4_rco_ir_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_ir_sil":{
		_standard = "dm_camo_m4_rco_ir";
		_silenced = "dm_camo_m4_rco_ir_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_ir_fg":{
		_standard = "dm_camo_m4_rco_ir_fg";
		_silenced = "dm_camo_m4_rco_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_ir_sil_fg":{
		_standard = "dm_camo_m4_rco_ir_fg";
		_silenced = "dm_camo_m4_rco_ir_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_ir_gl":{
		_standard = "dm_camo_m4_rco_ir_gl";
		_silenced = "dm_camo_m4_rco_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_ir_sil_gl":{
		_standard = "dm_camo_m4_rco_ir_gl";
		_silenced = "dm_camo_m4_rco_ir_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_lp":{
		_standard = "dm_camo_m4_rco_lp";
		_silenced = "dm_camo_m4_rco_lp_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_lp_sil":{
		_standard = "dm_camo_m4_rco_lp";
		_silenced = "dm_camo_m4_rco_lp_sil";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_lp_fg":{
		_standard = "dm_camo_m4_rco_lp_fg";
		_silenced = "dm_camo_m4_rco_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_lp_sil_fg":{
		_standard = "dm_camo_m4_rco_lp_fg";
		_silenced = "dm_camo_m4_rco_lp_sil_fg";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_lp_gl":{
		_standard = "dm_camo_m4_rco_lp_gl";
		_silenced = "dm_camo_m4_rco_lp_sil_gl";
		_name = "M4A1";
	};
	case "dm_camo_m4_rco_lp_sil_gl":{
		_standard = "dm_camo_m4_rco_lp_gl";
		_silenced = "dm_camo_m4_rco_lp_sil_gl";
		_name = "M4A1";
	};
	
//-----------------fhq acrs------------------
	case "fhq_acr_wdl_irn":{
		_standard = "fhq_acr_wdl_irn";
		_silenced = "fhq_acr_wdl_irn_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_irn_sd":{
		_standard = "fhq_acr_wdl_irn";
		_silenced = "fhq_acr_wdl_irn_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_irn_f":{
		_standard = "fhq_acr_wdl_irn_f";
		_silenced = "fhq_acr_wdl_irn_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_irn_sd_f":{
		_standard = "fhq_acr_wdl_irn_f";
		_silenced = "fhq_acr_wdl_irn_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_irn_gl":{
		_standard = "fhq_acr_wdl_irn_gl";
		_silenced = "fhq_acr_wdl_irn_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_irn_gl_sd":{
		_standard = "fhq_acr_wdl_irn_gl";
		_silenced = "fhq_acr_wdl_irn_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_irn_gl_f":{
		_standard = "fhq_acr_wdl_irn_gl_f";
		_silenced = "fhq_acr_wdl_irn_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_irn_gl_sd_f":{
		_standard = "fhq_acr_wdl_irn_gl_f";
		_silenced = "fhq_acr_wdl_irn_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_wdl_cco":{
		_standard = "fhq_acr_wdl_cco";
		_silenced = "fhq_acr_wdl_cco_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_cco_sd":{
		_standard = "fhq_acr_wdl_cco";
		_silenced = "fhq_acr_wdl_cco_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_cco_f":{
		_standard = "fhq_acr_wdl_cco_f";
		_silenced = "fhq_acr_wdl_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_cco_sd_f":{
		_standard = "fhq_acr_wdl_cco_f";
		_silenced = "fhq_acr_wdl_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_cco_sd_f":{
		_standard = "fhq_acr_wdl_cco_f";
		_silenced = "fhq_acr_wdl_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_cco_gl":{
		_standard = "fhq_acr_wdl_cco_gl";
		_silenced = "fhq_acr_wdl_cco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_cco_gl_sd":{
		_standard = "fhq_acr_wdl_cco_gl";
		_silenced = "fhq_acr_wdl_cco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_cco_gl_f":{
		_standard = "fhq_acr_wdl_cco_gl_f";
		_silenced = "fhq_acr_wdl_cco_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_cco_gl_sd_f":{
		_standard = "fhq_acr_wdl_cco_gl_f";
		_silenced = "fhq_acr_wdl_cco_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_wdl_rco":{
		_standard = "fhq_acr_wdl_rco";
		_silenced = "fhq_acr_wdl_rco_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_rco_sd":{
		_standard = "fhq_acr_wdl_rco";
		_silenced = "fhq_acr_wdl_rco_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_rco_f":{
		_standard = "fhq_acr_wdl_rco_f";
		_silenced = "fhq_acr_wdl_rco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_rco_sd_f":{
		_standard = "fhq_acr_wdl_rco_f";
		_silenced = "fhq_acr_wdl_rco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_rco_gl":{
		_standard = "fhq_acr_wdl_rco_gl";
		_silenced = "fhq_acr_wdl_rco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_rco_gl_sd":{
		_standard = "fhq_acr_wdl_rco_gl";
		_silenced = "fhq_acr_wdl_rco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_rco_gl_f":{
		_standard = "fhq_acr_wdl_rco_gl_f";
		_silenced = "fhq_acr_wdl_rco_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_rco_gl_sd_f":{
		_standard = "fhq_acr_wdl_rco_gl_f";
		_silenced = "fhq_acr_wdl_rco_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_wdl_hws":{
		_standard = "fhq_acr_wdl_hws";
		_silenced = "fhq_acr_wdl_hws_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hws_sd":{
		_standard = "fhq_acr_wdl_hws";
		_silenced = "fhq_acr_wdl_hws_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hws_f":{
		_standard = "fhq_acr_wdl_hws_f";
		_silenced = "fhq_acr_wdl_hws_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hws_sd_f":{
		_standard = "fhq_acr_wdl_hws_f";
		_silenced = "fhq_acr_wdl_hws_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hws_gl":{
		_standard = "fhq_acr_wdl_hws_gl";
		_silenced = "fhq_acr_wdl_hws_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hws_gl_sd":{
		_standard = "fhq_acr_wdl_hws_gl";
		_silenced = "fhq_acr_wdl_hws_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hws_gl_f":{
		_standard = "fhq_acr_wdl_hws_gl_f";
		_silenced = "fhq_acr_wdl_hws_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hws_gl_sd_f":{
		_standard = "fhq_acr_wdl_hws_gl_f";
		_silenced = "fhq_acr_wdl_hws_gl_sd_f";
		_name = "ACR";
	};


	case "fhq_acr_wdl_g33":{
		_standard = "fhq_acr_wdl_g33";
		_silenced = "fhq_acr_wdl_g33_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_g33_sd":{
		_standard = "fhq_acr_wdl_g33";
		_silenced = "fhq_acr_wdl_g33_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_g33_f":{
		_standard = "fhq_acr_wdl_g33_f";
		_silenced = "fhq_acr_wdl_g33_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_g33_sd_f":{
		_standard = "fhq_acr_wdl_g33_f";
		_silenced = "fhq_acr_wdl_g33_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_g33_gl":{
		_standard = "fhq_acr_wdl_g33_gl";
		_silenced = "fhq_acr_wdl_g33_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_g33_gl_sd":{
		_standard = "fhq_acr_wdl_g33_gl";
		_silenced = "fhq_acr_wdl_g33_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_g33_gl_f":{
		_standard = "fhq_acr_wdl_g33_gl_f";
		_silenced = "fhq_acr_wdl_g33_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_g33_gl_sd_f":{
		_standard = "fhq_acr_wdl_g33_gl_f";
		_silenced = "fhq_acr_wdl_g33_gl_sd_f";
		_name = "ACR";
	};
	
	case "fhq_acr_wdl_hamr":{
		_standard = "fhq_acr_wdl_hamr";
		_silenced = "fhq_acr_wdl_hamr_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hamr_sd":{
		_standard = "fhq_acr_wdl_hamr";
		_silenced = "fhq_acr_wdl_hamr_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hamr_f":{
		_standard = "fhq_acr_wdl_hamr_f";
		_silenced = "fhq_acr_wdl_hamr_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hamr_sd_f":{
		_standard = "fhq_acr_wdl_hamr_f";
		_silenced = "fhq_acr_wdl_hamr_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hamr_gl":{
		_standard = "fhq_acr_wdl_hamr_gl";
		_silenced = "fhq_acr_wdl_hamr_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hamr_gl_sd":{
		_standard = "fhq_acr_wdl_hamr_gl";
		_silenced = "fhq_acr_wdl_hamr_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hamr_gl_f":{
		_standard = "fhq_acr_wdl_hamr_gl_f";
		_silenced = "fhq_acr_wdl_hamr_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_wdl_hamr_gl_sd_f":{
		_standard = "fhq_acr_wdl_hamr_gl_f";
		_silenced = "fhq_acr_wdl_hamr_gl_sd_f";
		_name = "ACR";
	};
	

	case "fhq_acr_blk_irn":{
		_standard = "fhq_acr_blk_irn";
		_silenced = "fhq_acr_blk_irn_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_irn_sd":{
		_standard = "fhq_acr_blk_irn";
		_silenced = "fhq_acr_blk_irn_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_irn_f":{
		_standard = "fhq_acr_blk_irn_f";
		_silenced = "fhq_acr_blk_irn_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_irn_sd_f":{
		_standard = "fhq_acr_blk_irn_f";
		_silenced = "fhq_acr_blk_irn_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_irn_gl":{
		_standard = "fhq_acr_blk_irn_gl";
		_silenced = "fhq_acr_blk_irn_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_irn_gl_sd":{
		_standard = "fhq_acr_blk_irn_gl";
		_silenced = "fhq_acr_blk_irn_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_irn_gl_f":{
		_standard = "fhq_acr_blk_irn_gl_f";
		_silenced = "fhq_acr_blk_irn_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_irn_gl_sd_f":{
		_standard = "fhq_acr_blk_irn_gl_f";
		_silenced = "fhq_acr_blk_irn_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_blk_cco":{
		_standard = "fhq_acr_blk_cco";
		_silenced = "fhq_acr_blk_cco_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_cco_sd":{
		_standard = "fhq_acr_blk_cco";
		_silenced = "fhq_acr_blk_cco_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_cco_f":{
		_standard = "fhq_acr_blk_cco_f";
		_silenced = "fhq_acr_blk_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_cco_sd_f":{
		_standard = "fhq_acr_blk_cco_f";
		_silenced = "fhq_acr_blk_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_cco_sd_f":{
		_standard = "fhq_acr_blk_cco_f";
		_silenced = "fhq_acr_blk_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_cco_gl":{
		_standard = "fhq_acr_blk_cco_gl";
		_silenced = "fhq_acr_blk_cco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_cco_gl_sd":{
		_standard = "fhq_acr_blk_cco_gl";
		_silenced = "fhq_acr_blk_cco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_cco_gl_f":{
		_standard = "fhq_acr_blk_cco_gl_f";
		_silenced = "fhq_acr_blk_cco_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_cco_gl_sd_f":{
		_standard = "fhq_acr_blk_cco_gl_f";
		_silenced = "fhq_acr_blk_cco_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_blk_rco":{
		_standard = "fhq_acr_blk_rco";
		_silenced = "fhq_acr_blk_rco_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_rco_sd":{
		_standard = "fhq_acr_blk_rco";
		_silenced = "fhq_acr_blk_rco_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_rco_f":{
		_standard = "fhq_acr_blk_rco_f";
		_silenced = "fhq_acr_blk_rco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_rco_sd_f":{
		_standard = "fhq_acr_blk_rco_f";
		_silenced = "fhq_acr_blk_rco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_rco_gl":{
		_standard = "fhq_acr_blk_rco_gl";
		_silenced = "fhq_acr_blk_rco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_rco_gl_sd":{
		_standard = "fhq_acr_blk_rco_gl";
		_silenced = "fhq_acr_blk_rco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_rco_gl_f":{
		_standard = "fhq_acr_blk_rco_gl_f";
		_silenced = "fhq_acr_blk_rco_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_rco_gl_sd_f":{
		_standard = "fhq_acr_blk_rco_gl_f";
		_silenced = "fhq_acr_blk_rco_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_blk_hws":{
		_standard = "fhq_acr_blk_hws";
		_silenced = "fhq_acr_blk_hws_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_hws_sd":{
		_standard = "fhq_acr_blk_hws";
		_silenced = "fhq_acr_blk_hws_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_hws_f":{
		_standard = "fhq_acr_blk_hws_f";
		_silenced = "fhq_acr_blk_hws_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_hws_sd_f":{
		_standard = "fhq_acr_blk_hws_f";
		_silenced = "fhq_acr_blk_hws_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_hws_gl":{
		_standard = "fhq_acr_blk_hws_gl";
		_silenced = "fhq_acr_blk_hws_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_hws_gl_sd":{
		_standard = "fhq_acr_blk_hws_gl";
		_silenced = "fhq_acr_blk_hws_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_hws_gl_f":{
		_standard = "fhq_acr_blk_hws_gl_f";
		_silenced = "fhq_acr_blk_hws_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_hws_gl_sd_f":{
		_standard = "fhq_acr_blk_hws_gl_f";
		_silenced = "fhq_acr_blk_hws_gl_sd_f";
		_name = "ACR";
	};


	case "fhq_acr_blk_g33":{
		_standard = "fhq_acr_blk_g33";
		_silenced = "fhq_acr_blk_g33_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_g33_sd":{
		_standard = "fhq_acr_blk_g33";
		_silenced = "fhq_acr_blk_g33_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_g33_f":{
		_standard = "fhq_acr_blk_g33_f";
		_silenced = "fhq_acr_blk_g33_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_g33_sd_f":{
		_standard = "fhq_acr_blk_g33_f";
		_silenced = "fhq_acr_blk_g33_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_g33_gl":{
		_standard = "fhq_acr_blk_g33_gl";
		_silenced = "fhq_acr_blk_g33_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_g33_gl_sd":{
		_standard = "fhq_acr_blk_g33_gl";
		_silenced = "fhq_acr_blk_g33_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_g33_gl_f":{
		_standard = "fhq_acr_blk_g33_gl_f";
		_silenced = "fhq_acr_blk_g33_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_g33_gl_sd_f":{
		_standard = "fhq_acr_blk_g33_gl_f";
		_silenced = "fhq_acr_blk_g33_gl_sd_f";
		_name = "ACR";
	};
	
	case "fhq_acr_blk_hamr":{
		_standard = "fhq_acr_blk_hamr";
		_silenced = "fhq_acr_blk_hamr_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_hamr_sd":{
		_standard = "fhq_acr_blk_hamr";
		_silenced = "fhq_acr_blk_hamr_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_hamr_f":{
		_standard = "fhq_acr_blk_hamr_f";
		_silenced = "fhq_acr_blk_hamr_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_hamr_sd_f":{
		_standard = "fhq_acr_blk_hamr_f";
		_silenced = "fhq_acr_blk_hamr_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_hamr_gl":{
		_standard = "fhq_acr_blk_hamr_gl";
		_silenced = "fhq_acr_blk_hamr_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_hamr_gl_sd":{
		_standard = "fhq_acr_blk_hamr_gl";
		_silenced = "fhq_acr_blk_hamr_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_blk_hamr_gl_f":{
		_standard = "fhq_acr_blk_hamr_gl_f";
		_silenced = "fhq_acr_blk_hamr_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_blk_hamr_gl_sd_f":{
		_standard = "fhq_acr_blk_hamr_gl_f";
		_silenced = "fhq_acr_blk_hamr_gl_sd_f";
		_name = "ACR";
	};

	case "fhq_acr_tan_irn":{
		_standard = "fhq_acr_tan_irn";
		_silenced = "fhq_acr_tan_irn_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_irn_sd":{
		_standard = "fhq_acr_tan_irn";
		_silenced = "fhq_acr_tan_irn_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_irn_f":{
		_standard = "fhq_acr_tan_irn_f";
		_silenced = "fhq_acr_tan_irn_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_irn_sd_f":{
		_standard = "fhq_acr_tan_irn_f";
		_silenced = "fhq_acr_tan_irn_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_irn_gl":{
		_standard = "fhq_acr_tan_irn_gl";
		_silenced = "fhq_acr_tan_irn_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_irn_gl_sd":{
		_standard = "fhq_acr_tan_irn_gl";
		_silenced = "fhq_acr_tan_irn_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_irn_gl_f":{
		_standard = "fhq_acr_tan_irn_gl_f";
		_silenced = "fhq_acr_tan_irn_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_irn_gl_sd_f":{
		_standard = "fhq_acr_tan_irn_gl_f";
		_silenced = "fhq_acr_tan_irn_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_tan_cco":{
		_standard = "fhq_acr_tan_cco";
		_silenced = "fhq_acr_tan_cco_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_cco_sd":{
		_standard = "fhq_acr_tan_cco";
		_silenced = "fhq_acr_tan_cco_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_cco_f":{
		_standard = "fhq_acr_tan_cco_f";
		_silenced = "fhq_acr_tan_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_cco_sd_f":{
		_standard = "fhq_acr_tan_cco_f";
		_silenced = "fhq_acr_tan_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_cco_sd_f":{
		_standard = "fhq_acr_tan_cco_f";
		_silenced = "fhq_acr_tan_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_cco_gl":{
		_standard = "fhq_acr_tan_cco_gl";
		_silenced = "fhq_acr_tan_cco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_cco_gl_sd":{
		_standard = "fhq_acr_tan_cco_gl";
		_silenced = "fhq_acr_tan_cco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_cco_gl_f":{
		_standard = "fhq_acr_tan_cco_gl_f";
		_silenced = "fhq_acr_tan_cco_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_cco_gl_sd_f":{
		_standard = "fhq_acr_tan_cco_gl_f";
		_silenced = "fhq_acr_tan_cco_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_tan_rco":{
		_standard = "fhq_acr_tan_rco";
		_silenced = "fhq_acr_tan_rco_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_rco_sd":{
		_standard = "fhq_acr_tan_rco";
		_silenced = "fhq_acr_tan_rco_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_rco_f":{
		_standard = "fhq_acr_tan_rco_f";
		_silenced = "fhq_acr_tan_rco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_rco_sd_f":{
		_standard = "fhq_acr_tan_rco_f";
		_silenced = "fhq_acr_tan_rco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_rco_gl":{
		_standard = "fhq_acr_tan_rco_gl";
		_silenced = "fhq_acr_tan_rco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_rco_gl_sd":{
		_standard = "fhq_acr_tan_rco_gl";
		_silenced = "fhq_acr_tan_rco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_rco_gl_f":{
		_standard = "fhq_acr_tan_rco_gl_f";
		_silenced = "fhq_acr_tan_rco_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_rco_gl_sd_f":{
		_standard = "fhq_acr_tan_rco_gl_f";
		_silenced = "fhq_acr_tan_rco_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_tan_hws":{
		_standard = "fhq_acr_tan_hws";
		_silenced = "fhq_acr_tan_hws_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_hws_sd":{
		_standard = "fhq_acr_tan_hws";
		_silenced = "fhq_acr_tan_hws_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_hws_f":{
		_standard = "fhq_acr_tan_hws_f";
		_silenced = "fhq_acr_tan_hws_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_hws_sd_f":{
		_standard = "fhq_acr_tan_hws_f";
		_silenced = "fhq_acr_tan_hws_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_hws_gl":{
		_standard = "fhq_acr_tan_hws_gl";
		_silenced = "fhq_acr_tan_hws_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_hws_gl_sd":{
		_standard = "fhq_acr_tan_hws_gl";
		_silenced = "fhq_acr_tan_hws_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_hws_gl_f":{
		_standard = "fhq_acr_tan_hws_gl_f";
		_silenced = "fhq_acr_tan_hws_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_hws_gl_sd_f":{
		_standard = "fhq_acr_tan_hws_gl_f";
		_silenced = "fhq_acr_tan_hws_gl_sd_f";
		_name = "ACR";
	};


	case "fhq_acr_tan_g33":{
		_standard = "fhq_acr_tan_g33";
		_silenced = "fhq_acr_tan_g33_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_g33_sd":{
		_standard = "fhq_acr_tan_g33";
		_silenced = "fhq_acr_tan_g33_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_g33_f":{
		_standard = "fhq_acr_tan_g33_f";
		_silenced = "fhq_acr_tan_g33_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_g33_sd_f":{
		_standard = "fhq_acr_tan_g33_f";
		_silenced = "fhq_acr_tan_g33_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_g33_gl":{
		_standard = "fhq_acr_tan_g33_gl";
		_silenced = "fhq_acr_tan_g33_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_g33_gl_sd":{
		_standard = "fhq_acr_tan_g33_gl";
		_silenced = "fhq_acr_tan_g33_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_g33_gl_f":{
		_standard = "fhq_acr_tan_g33_gl_f";
		_silenced = "fhq_acr_tan_g33_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_g33_gl_sd_f":{
		_standard = "fhq_acr_tan_g33_gl_f";
		_silenced = "fhq_acr_tan_g33_gl_sd_f";
		_name = "ACR";
	};
	
	case "fhq_acr_tan_hamr":{
		_standard = "fhq_acr_tan_hamr";
		_silenced = "fhq_acr_tan_hamr_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_hamr_sd":{
		_standard = "fhq_acr_tan_hamr";
		_silenced = "fhq_acr_tan_hamr_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_hamr_f":{
		_standard = "fhq_acr_tan_hamr_f";
		_silenced = "fhq_acr_tan_hamr_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_hamr_sd_f":{
		_standard = "fhq_acr_tan_hamr_f";
		_silenced = "fhq_acr_tan_hamr_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_hamr_gl":{
		_standard = "fhq_acr_tan_hamr_gl";
		_silenced = "fhq_acr_tan_hamr_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_hamr_gl_sd":{
		_standard = "fhq_acr_tan_hamr_gl";
		_silenced = "fhq_acr_tan_hamr_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_tan_hamr_gl_f":{
		_standard = "fhq_acr_tan_hamr_gl_f";
		_silenced = "fhq_acr_tan_hamr_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_tan_hamr_gl_sd_f":{
		_standard = "fhq_acr_tan_hamr_gl_f";
		_silenced = "fhq_acr_tan_hamr_gl_sd_f";
		_name = "ACR";
	};




	case "fhq_acr_snw_irn":{
		_standard = "fhq_acr_snw_irn";
		_silenced = "fhq_acr_snw_irn_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_irn_sd":{
		_standard = "fhq_acr_snw_irn";
		_silenced = "fhq_acr_snw_irn_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_irn_f":{
		_standard = "fhq_acr_snw_irn_f";
		_silenced = "fhq_acr_snw_irn_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_irn_sd_f":{
		_standard = "fhq_acr_snw_irn_f";
		_silenced = "fhq_acr_snw_irn_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_irn_gl":{
		_standard = "fhq_acr_snw_irn_gl";
		_silenced = "fhq_acr_snw_irn_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_irn_gl_sd":{
		_standard = "fhq_acr_snw_irn_gl";
		_silenced = "fhq_acr_snw_irn_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_irn_gl_f":{
		_standard = "fhq_acr_snw_irn_gl_f";
		_silenced = "fhq_acr_snw_irn_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_irn_gl_sd_f":{
		_standard = "fhq_acr_snw_irn_gl_f";
		_silenced = "fhq_acr_snw_irn_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_snw_cco":{
		_standard = "fhq_acr_snw_cco";
		_silenced = "fhq_acr_snw_cco_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_cco_sd":{
		_standard = "fhq_acr_snw_cco";
		_silenced = "fhq_acr_snw_cco_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_cco_f":{
		_standard = "fhq_acr_snw_cco_f";
		_silenced = "fhq_acr_snw_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_cco_sd_f":{
		_standard = "fhq_acr_snw_cco_f";
		_silenced = "fhq_acr_snw_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_cco_sd_f":{
		_standard = "fhq_acr_snw_cco_f";
		_silenced = "fhq_acr_snw_cco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_cco_gl":{
		_standard = "fhq_acr_snw_cco_gl";
		_silenced = "fhq_acr_snw_cco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_cco_gl_sd":{
		_standard = "fhq_acr_snw_cco_gl";
		_silenced = "fhq_acr_snw_cco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_cco_gl_f":{
		_standard = "fhq_acr_snw_cco_gl_f";
		_silenced = "fhq_acr_snw_cco_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_cco_gl_sd_f":{
		_standard = "fhq_acr_snw_cco_gl_f";
		_silenced = "fhq_acr_snw_cco_gl_sd_f";
		_name = "ACR";
	};
	
	
	case "fhq_acr_snw_rco":{
		_standard = "fhq_acr_snw_rco";
		_silenced = "fhq_acr_snw_rco_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_rco_sd":{
		_standard = "fhq_acr_snw_rco";
		_silenced = "fhq_acr_snw_rco_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_rco_f":{
		_standard = "fhq_acr_snw_rco_f";
		_silenced = "fhq_acr_snw_rco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_rco_sd_f":{
		_standard = "fhq_acr_snw_rco_f";
		_silenced = "fhq_acr_snw_rco_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_rco_gl":{
		_standard = "fhq_acr_snw_rco_gl";
		_silenced = "fhq_acr_snw_rco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_rco_gl_sd":{
		_standard = "fhq_acr_snw_rco_gl";
		_silenced = "fhq_acr_snw_rco_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_rco_gl_f":{
		_standard = "fhq_acr_snw_rco_gl_f";
		_silenced = "fhq_acr_snw_rco_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_rco_gl_sd_f":{
		_standard = "fhq_acr_snw_rco_gl_f";
		_silenced = "fhq_acr_snw_rco_gl_sd_f";
		_name = "ACR";
	};
	
	case "fhq_acr_snw_hws":{
		_standard = "fhq_acr_snw_hws";
		_silenced = "fhq_acr_snw_hws_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_hws_sd":{
		_standard = "fhq_acr_snw_hws";
		_silenced = "fhq_acr_snw_hws_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_hws_f":{
		_standard = "fhq_acr_snw_hws_f";
		_silenced = "fhq_acr_snw_hws_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_hws_sd_f":{
		_standard = "fhq_acr_snw_hws_f";
		_silenced = "fhq_acr_snw_hws_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_hws_gl":{
		_standard = "fhq_acr_snw_hws_gl";
		_silenced = "fhq_acr_snw_hws_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_hws_gl_sd":{
		_standard = "fhq_acr_snw_hws_gl";
		_silenced = "fhq_acr_snw_hws_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_hws_gl_f":{
		_standard = "fhq_acr_snw_hws_gl_f";
		_silenced = "fhq_acr_snw_hws_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_hws_gl_sd_f":{
		_standard = "fhq_acr_snw_hws_gl_f";
		_silenced = "fhq_acr_snw_hws_gl_sd_f";
		_name = "ACR";
	};


	case "fhq_acr_snw_g33":{
		_standard = "fhq_acr_snw_g33";
		_silenced = "fhq_acr_snw_g33_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_g33_sd":{
		_standard = "fhq_acr_snw_g33";
		_silenced = "fhq_acr_snw_g33_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_g33_f":{
		_standard = "fhq_acr_snw_g33_f";
		_silenced = "fhq_acr_snw_g33_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_g33_sd_f":{
		_standard = "fhq_acr_snw_g33_f";
		_silenced = "fhq_acr_snw_g33_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_g33_gl":{
		_standard = "fhq_acr_snw_g33_gl";
		_silenced = "fhq_acr_snw_g33_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_g33_gl_sd":{
		_standard = "fhq_acr_snw_g33_gl";
		_silenced = "fhq_acr_snw_g33_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_g33_gl_f":{
		_standard = "fhq_acr_snw_g33_gl_f";
		_silenced = "fhq_acr_snw_g33_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_g33_gl_sd_f":{
		_standard = "fhq_acr_snw_g33_gl_f";
		_silenced = "fhq_acr_snw_g33_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_hamr":{
		_standard = "fhq_acr_snw_hamr";
		_silenced = "fhq_acr_snw_hamr_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_hamr_sd":{
		_standard = "fhq_acr_snw_hamr";
		_silenced = "fhq_acr_snw_hamr_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_hamr_f":{
		_standard = "fhq_acr_snw_hamr_f";
		_silenced = "fhq_acr_snw_hamr_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_hamr_sd_f":{
		_standard = "fhq_acr_snw_hamr_f";
		_silenced = "fhq_acr_snw_hamr_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_hamr_gl":{
		_standard = "fhq_acr_snw_hamr_gl";
		_silenced = "fhq_acr_snw_hamr_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_hamr_gl_sd":{
		_standard = "fhq_acr_snw_hamr_gl";
		_silenced = "fhq_acr_snw_hamr_gl_sd";
		_name = "ACR";
	};
	case "fhq_acr_snw_hamr_gl_f":{
		_standard = "fhq_acr_snw_hamr_gl_f";
		_silenced = "fhq_acr_snw_hamr_gl_sd_f";
		_name = "ACR";
	};
	case "fhq_acr_snw_hamr_gl_sd_f":{
		_standard = "fhq_acr_snw_hamr_gl_f";
		_silenced = "fhq_acr_snw_hamr_gl_sd_f";
		_name = "ACR";
	};

//RH smgs
	case "rh_mp5a5":{
		_standard = "rh_mp5a5";
		_silenced = "rh_mp5sd6";
		_name = "MP5A5";
	};
	case "rh_mp5sd6":{
		_standard = "rh_mp5a5";
		_silenced = "rh_mp5sd6";
		_name = "MP5A5";
	};
	case "rh_mp5a5aim":{
		_standard = "rh_mp5a5aim";
		_silenced = "rh_mp5sd6aim";
		_name = "MP5A5";
	};
	case "rh_mp5sd6aim":{
		_standard = "rh_mp5a5aim";
		_silenced = "rh_mp5sd6aim";
		_name = "MP5A5";
	};
	case "rh_mp5a5eot":{
		_standard = "rh_mp5a5eot";
		_silenced = "rh_mp5sd6eot";
		_name = "MP5A5";
	};
	case "rh_mp5sd6eot":{
		_standard = "rh_mp5a5eot";
		_silenced = "rh_mp5sd6eot";
		_name = "MP5A5";
	};
	case "rh_mp5a5rfx":{
		_standard = "rh_mp5a5rfx";
		_silenced = "rh_mp5sd6rfx";
		_name = "MP5A5";
	};
	case "rh_mp5sd6rfx":{
		_standard = "rh_mp5a5rfx";
		_silenced = "rh_mp5sd6rfx";
		_name = "MP5A5";
	};
	case "rh_p90":{
		_standard = "rh_p90";
		_silenced =  "rh_p90sd";
		_name = "P90";
	};
	case "rh_p90sd":{
		_standard = "rh_p90";
		_silenced =  "rh_p90sd";
		_name = "P90";
	};
	case "rh_p90i":{
		_standard = "rh_p90i";
		_silenced =  "rh_p90isd";
		_name = "P90";
	};
	case "rh_p90isd":{
		_standard = "rh_p90i";
		_silenced =  "rh_p90isd";
		_name = "P90";
	};
	case "rh_p90aim":{
		_standard = "rh_p90aim";
		_silenced =  "rh_p90sdaim";
		_name = "P90";
	};
	case "rh_p90sdaim":{
		_standard = "rh_p90aim";
		_silenced =  "rh_p90sdaim";
		_name = "P90";
	};
	case "rh_p90eot":{
		_standard = "rh_p90eot";
		_silenced =  "rh_p90sdeot";
		_name = "P90";
	};
	case "rh_p90sdeot":{
		_standard = "rh_p90eot";
		_silenced =  "rh_p90sdeot";
		_name = "P90";
	};
	
	case "rh_ump":{
		_standard = "rh_ump";
		_silenced =  "rh_umpsd";
		_name = "UMP";
	};
	case "rh_umpsd":{
		_standard = "rh_ump";
		_silenced =  "rh_umpsd";
		_name = "UMP";
	};
	case "rh_umpaim":{
		_standard = "rh_umpaim";
		_silenced =  "rh_umpsdaim";
		_name = "UMP";
	};
	case "rh_umpsdaim":{
		_standard = "rh_umpaim";
		_silenced = "rh_umpsdaim";
		_name = "UMP";
	};
	case "rh_umpeot":{
		_standard = "rh_umpeot";
		_silenced =  "rh_umpsdeot";
		_name = "UMP";
	};
	case "rh_umpsdeot":{
		_standard = "rh_umpeot";
		_silenced = "rh_umpsdeot";
		_name = "UMP";
	};
	case "rh_umprfx":{
		_standard = "rh_umprfx";
		_silenced =  "rh_umpsdrfx";
		_name = "UMP";
	};
	case "rh_umpsdrfx":{
		_standard = "rh_umprfx";
		_silenced = "rh_umpsdrfx";
		_name = "UMP";
	};
	case "rh_kriss":{
		_standard = "rh_kriss";
		_silenced = "rh_krisssd";
		_name = "Kriss";
	};
	case "rh_krisssd":{
		_standard = "rh_kriss";
		_silenced =  "rh_krisssd";
		_name = "Kriss";
	};
	case "rh_krissaim":{
		_standard = "rh_krissaim";
		_silenced = "rh_krisssdaim";
		_name = "Kriss";
	};
	case "rh_krisssdaim":{
		_standard = "rh_krissaim";
		_silenced = "rh_krisssdaim";
		_name = "Kriss";
	};
	case "rh_krisseot":{
		_standard = "rh_krisseot";
		_silenced = "rh_krisssdeot";
		_name = "Kriss";
	};
	case "rh_krisssdeot":{
		_standard = "rh_krisseot";
		_silenced = "rh_krisssdeot";
		_name = "Kriss";
	};
	case "rh_krissrfx":{
		_standard = "rh_krissrfx";
		_silenced = "rh_krisssdrfx";
		_name = "Kriss";
	};
	case "rh_krisssdrfx":{
		_standard = "rh_krissrfx";
		_silenced = "rh_krisssdrfx";
		_name = "Kriss";
	};
	
	case "rh_mp7":{
		_standard = "rh_mp7";
		_silenced =  "rh_mp7sd";
		_name = "MP7";
	};
	case "rh_mp7sd":{
		_standard = "rh_mp7";
		_silenced =  "rh_mp7sd";
		_name = "MP7";
	};
	case "rh_mp7aim":{
		_standard = "rh_mp7aim";
		_silenced =  "rh_mp7sdaim";
		_name = "MP7";
	};
	case "rh_mp7sdaim":{
		_standard = "rh_mp7aim";
		_silenced =  "rh_mp7sdaim";
		_name = "MP7";
	};
	case "rh_mp7eot":{
		_standard = "rh_mp7eot";
		_silenced =  "rh_mp7sdeot";
		_name = "MP7";
	};
	case "rh_mp7sdeot":{
		_standard = "rh_mp7eot";
		_silenced =  "rh_mp7sdeot";
		_name = "MP7";
	};
	
	case "rh_uzi":{
		_standard = "rh_uzi";
		_silenced =  "rh_uzisd";
		_name = "UZI";
	};
	case "rh_uzisd":{
		_standard = "rh_uzi";
		_silenced =  "rh_uzisd";
		_name = "UZI";
	};
	case "rh_tmp":{
		_standard = "rh_tmp";
		_silenced =  "rh_tmpsd";
		_name = "TMP";
	};
	case "rh_tmpsd":{
		_standard = "rh_tmp";
		_silenced =  "rh_tmpsd";
		_name = "TMP";
	};
	case "rh_tmpaim":{
		_standard = "rh_tmpaim";
		_silenced =  "rh_tmpsdaim";
		_name = "TMP";
	};
	case "rh_tmpsdaim":{
		_standard = "rh_tmpaim";
		_silenced =  "rh_tmpsdaim";
		_name = "TMP";
	};
	case "rh_tmpeot":{
		_standard = "rh_tmpeot";
		_silenced =  "rh_tmpsdeot";
		_name = "TMP";
	};
	case "rh_tmpsdeot":{
		_standard = "rh_tmpeot";
		_silenced =  "rh_tmpsdeot";
		_name = "TMP";
	};
	default{
		_suppresable = false;
	};
};	
_array = if (_suppresable) then {[_standard,_silenced,_name]}else{nil};
_array




