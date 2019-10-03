//by Kempco

_dly = _this select 0;
_sel = _this select 1;
_isPistol = _this select 2;

sleep 0.2;
	
_half = time + (_dly/2);
_limit = time + _dly;
	
_sound = if (_isPistol) then {"JTK_SIL_Pistol"}else{"JTK_SIL_Rifle"};
_delay = if (_sound == "JTK_SIL_Pistol") then {0.4875}else{0.65};
_n = if (_sel == "Remove") then {0.5}else{0};
While {true} do { 
	_dly = if (_sel == "Remove") then {
		_n = if (_n >= 0.1) then {_n - 0.1}else{0};
		_delay + _n;
	}else{
		_n = _n + 0.05;
		_delay + _n;
	};
	if ((time + (_dly*2)) > _limit) exitWith {playSound "JTK_SIL_Reload"}; 
	playSound _sound;
	sleep _dly;
};


