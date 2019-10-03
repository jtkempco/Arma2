//by Kempco

_STAN 		= _this select 0;
_SD 		= _this select 1;
_unit 		= player;
_isPistol 	= [_unit] call JTK_SIL_CheckIsPistol;
_dly		= [_unit,_isPistol] call JTK_SIL_GetDelay;
_isSilenced 	= if (currentWeapon _unit == _SD) then {true}else{false};
_sel 		= if (_isSilenced) then {"Remove"}else{"Equip"};
_weapon_old 	= if (_sel == "Remove") then {_SD}else{_STAN};
_weapon_new 	= if (_weapon_old == _STAN) then {_SD}else{_STAN};

_unit setVariable ["Suppressor Status","In Progress"];
_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call JTK_SIL_Block_KeyDown_EH"];

_anims = [];
_anim = if (_isPistol) then {"AmovPknlMstpSrasWpstDnon_gear"}else{"amovpknlmstpslowwrfldnon"};
_anims = _anims + [_anim];
_stance = _unit call JTK_SIL_GetUnitStance; 
_anim = switch (_stance) do {	
	case "stand":{if (_isPistol) then {"amovpercmstpsraswpstdnon"}else{"amovpercmstpsraswrfldnon"}};
	case "kneel":{if (_isPistol) then {"amovpknlmstpsraswpstdnon"}else{"amovpknlmstpsraswrfldnon"}};
	case "prone":{if (_isPistol) then {["amovpknlmstpsraswpstdnon","amovppnemstpsraswpstdnon"]}else{["amovpknlmstpsraswrfldnon","amovppnemstpsraswrfldnon"]}};//Doesen't work with ace
	default{"amovpknlmstpsraswrfldnon"};
};
_anims = _anims + [_anim]; 
_trans_dly = switch (_stance) do {	
	case "stand":{if (_isPistol) then {0.75}else{0.75}};
	case "kneel":{if (_isPistol) then {0.25}else{0.25}};
	case "prone":{if (_isPistol) then {1.75}else{1.75}};
	default{0.5};
};

_txt = if (_isSilenced) then {["Removing suppressor..."]}else{["Equiping suppressor..."]};
[_dly,_txt] spawn {[_this select 0,_this select 1,false,false] spawn ace_progressbar};

_unit playmoveNow (_anims select 0);
WaitUntil{animationState _unit == (_anims select 0) OR (!alive _unit)};
if (!alive _unit) exitWith {(findDisplay 46) displayRemoveEventHandler ["KeyDown",_EH]};
[_dly,_sel,_isPistol] spawn JTK_SIL_PlaySound;
_dly spawn {
	sleep _this;
	player setVariable ["Suppressor Status","Done"];
};

_unit enableSimulation false;
WaitUntil {!(simulationEnabled _unit)};

WaitUntil {((_unit getVariable "Suppressor Status") == "Done") OR (!alive _unit)};
_unit enableSimulation true;


WaitUntil {(simulationEnabled _unit) OR (!alive _unit)};
if (!alive _unit) exitWith {};
if (typeName (_anims select 1) == "ARRAY") then {
	_unit playmoveNow ((_anims select 1) select 0);
	WaitUntil{animationState _unit == ((_anims select 1) select 0) OR (!alive _unit)};
	if (alive _unit) then {_unit playmoveNow ((_anims select 1) select 1)};
}else{_unit playmoveNow (_anims select 1)};  

_unit addWeapon _weapon_new;
_unit removeWeapon _weapon_old;
_unit setVariable ["JTK_Current_Weapon", _weapon_new];
_unit selectWeapon (getArray(configFile>>"cfgWeapons" >> _weapon_new >> "muzzles") select 0);

(findDisplay 46) displayRemoveEventHandler ["KeyDown",_EH];

_unit setVariable ["JTK_InteractMenuOpen",false];
if ((toUpper(_unit getVariable "JTK_Current_Weapon")) in JTK_FHQ_Weapons) then {[_isSilenced,_SD,_STAN] call JTK_FHQ_Fix};
if ((toUpper(_unit getVariable "JTK_Current_Weapon")) in JTK_ACEX_Weapons) then {
	[_isSilenced,_STAN,_SD] call JTK_SIL_handleMags;
	[] spawn {sleep 0.5; reload player};
};


