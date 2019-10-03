//by Kempco

private ["_standard","_silenced","_name"];
_suppresable = true;

//-------------BIS
switch (tolower _this) do {	
	case "m9":{
		_standard = "m9";
		_silenced = "m9sd";
		_name = "M9";
	};
	case "m9sd":{
		_standard = "m9";
		_silenced = "m9sd";
		_name = "M9";
	};
	case "makarov":{
		_standard = "makarov";
		_silenced = "makarovsd";
		_name = "Makarov";
	};
	case "makarovsd":{
		_standard = "makarov";
		_silenced = "makarovsd";
		_name = "Makarov";
	};
	case "uzi_ep1":{
		_standard = "uzi_ep1";
		_silenced = "uzi_sd_ep1";
		_name = "UZI";
	};
	case "uzi_sd_ep1":{
		_standard = "uzi_ep1";
		_silenced = "uzi_sd_ep1";
		_name = "UZI";
	};
//ACR DLC
	case "cz_75_sp_01_phantom":{
		_standard = "cz_75_sp_01_phantom";
		_silenced = "cz_75_sp_01_phantom_sd";
		_name = "CZ 75";
	};
	case "cz_75_sp_01_phantom_sd":{
		_standard = "cz_75_sp_01_phantom";
		_silenced = "cz_75_sp_01_phantom_sd";
		_name = "CZ 75";
	};	
//ACE
	case "ace_aps": {
		_standard = "ace_aps";
		_silenced = "ace_apsb";
		_name = "Makarov";	
	};
	case "ace_apsb":{
		_standard = "ace_aps";
		_silenced = "ace_apsb";	
		_name = "Makarov";
	};
	case "ace_usp":{
		_standard = "ace_usp";
		_silenced = "ace_uspsd";
		_name = "USP";
	};
	case "ace_uspsd":{
		_standard = "ace_usp";
		_silenced = "ace_uspsd";
		_name = "USP";
	};
	
//RH
	case "rh_mk22":{
		_standard = "rh_mk22";
		_silenced = "rh_mk22sd";
		_name = "MK22";
	};
	case "rh_mk22sd":{
		_standard = "rh_mk22";
		_silenced = "rh_mk22sd";
		_name = "MK22";
	};
	case "rh_mk22v":{
		_standard = "rh_mk22v";
		_silenced = "rh_mk22vsd";
		_name = "MK22v";
	};
	case "rh_mk22vsd":{
		_standard = "rh_mk22v";
		_silenced = "rh_mk22vsd";
		_name = "MK22v";
	};
	case "rh_usp":{
		_standard = "rh_usp";
		_silenced = "rh_uspsd";
		_name = "USP";
	};
	case "rh_uspsd":{
		_standard = "rh_usp";
		_silenced = "rh_uspsd";
		_name = "USP";
	};
	case "rh_m1911":{
		_standard = "rh_m1911";
		_silenced = "rh_m1911sd";
		_name = "M1911";
	};
	case "rh_m1911sd":{
		_standard = "rh_m1911";
		_silenced = "rh_m1911sd";
		_name = "M1911";
	};
	case "rh_m9":{
		_standard = "rh_m9";
		_silenced = "rh_m9sd";
		_name = "M9";
	};
	case "rh_m9sd":{
		_standard = "rh_m9";
		_silenced = "rh_m9sd";
		_name = "M9";
	};
	case "rh_m9c":{
		_standard = "rh_m9c";
		_silenced = "rh_m9csd";
		_name = "M9";
	};
	case "rh_m9csd":{
		_standard = "rh_m9c";
		_silenced = "rh_m9csd";
		_name = "M9";
	};
	default{
		_suppresable = false;
	};
};
_array = if (_suppresable) then {[_standard,_silenced,_name]}else{nil};
_array
	
	





