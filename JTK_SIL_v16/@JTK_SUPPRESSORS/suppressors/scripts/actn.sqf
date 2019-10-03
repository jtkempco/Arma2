//by Kempco

 _unit 	= _this select 0;
_array 	= _this select 3;
_sel 	= _array select 0;
_STAN 	= _array select 1;
_SD 	= _array select 2;
_isPistol= _array select 3;
_dly	= if (_isPistol)then {3.75}else{5};
_OpticsMode = false;

_unit removeAction (_this select 2);

_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call JTK_SIL_Block_KeyDown_EH"];

_anims = [];
_anim = if (_isPistol) then {"AmovPknlMstpSrasWpstDnon_gear"}else{"amovpknlmstpslowwrfldnon"};
_anims = _anims + [_anim];
_stance = _unit call JTK_SIL_GetUnitStance; 
_anim = switch (_stance) do {	
	case "stand":{if (_isPistol) then {"amovpercmstpsraswpstdnon"}else{"amovpercmstpsraswrfldnon"}};
	case "kneel":{if (_isPistol) then {"amovpknlmstpsraswpstdnon"}else{"amovpknlmstpsraswrfldnon"}};
	case "prone":{if (_isPistol) then {"amovppnemstpsraswpstdnon"}else{"amovppnemstpsraswrfldnon"}};
	default{"amovpknlmstpsraswrfldnon"};
};
_anims = _anims + [_anim]; 

_unit setVariable ["Suppressor Status","In Progress"];
if (cameraView == "GUNNER") then {_unit switchCamera "INTERNAL"}; 
WaitUntil {(cameraView == "INTERNAL") OR (cameraView == "EXTERNAL")};

_isSilenced = if (_sel == "Remove") then {true}else{false};
_weapon_old = if (_sel == "Remove") then {_SD}else{_STAN};
_weapon_new = if (_weapon_old == _STAN) then {_SD}else{_STAN};
[_unit,_isSilenced,_dly,(_anims select 0)] spawn JTK_SIL_Progressbar;

_unit playmoveNow (_anims select 0);

WaitUntil{animationState _unit == (_anims select 0) OR (!alive _unit)};
if (!alive _unit) exitWith {(findDisplay 46) displayRemoveEventHandler ["KeyDown",_EH]};

[_isSilenced,_STAN,_SD] call JTK_SIL_handleMags;
[_dly,_sel,_isPistol] spawn JTK_SIL_PlaySound;

_unit enableSimulation false;
WaitUntil {!(simulationEnabled _unit)};

WaitUntil {((_unit getVariable "Suppressor Status") == "Done") OR (!alive _unit)};
_unit enableSimulation true;
(findDisplay 46) displayRemoveEventHandler ["KeyDown",_EH];


WaitUntil {(simulationEnabled _unit) OR (!alive _unit)};
if (!alive _unit) exitWith {};
_unit playmoveNow (_anims select 1);
_unit addWeapon _weapon_new;
_unit removeWeapon _weapon_old;
_unit selectWeapon (getArray(configFile>>"cfgWeapons" >> _weapon_new >> "muzzles") select 0);
_unit setVariable ["JTK_Current_Weapon", _weapon_new];
JTK_SIL_KeyPressed = false;




