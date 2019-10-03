//by Kempco

_unit = _this select 0;
_isSilenced = _this select 1;
_dly = _this select 2;

private ["_footer"];
_improgress_txt = if (_isSilenced) then {"Removing Suppressor..."}else{"Equipping Suppressor..."};
_complete_txt = if (_isSilenced) then {"Suppressor Removed"}else{"Suppressor Equipped"}; 
_time = time + _dly;

_segments = 36;
_inc = (_dly/_segments*2);

//sleep 1.25;

WaitUntil{animationState _unit == (_this select 3)};
	
for "_i" from 1 to _segments do {
	_txt = "";
	_footer = [_i,_segments] call JTK_BIS_CreateCounDownLine;
	_str = format ["<t color='#E9DFA0' size='1.0' shadow='0' align='center' valign='top' underline='false'>%1</t>",_improgress_txt];
	_txt = _txt + _str;
	_str = "<br/><t color='#E9DFA0' size='0.85' shadow='0' align='center' valign='bottom'>" + _footer + "</t>";  
	_txt = _txt + _str;
	hintsilent parseText(_txt);
	sleep (_dly/_segments);
};



//_txt = format ["<t color='#E9DFA0' size='1.0' shadow='0' align='center' valign='top' underline='false'>%1</t>",_complete_txt];
//hintsilent parseText(_txt);
HintSilent "";

_unit setVariable ["Suppressor Status","Done"];

sleep 3;
HintSilent "";
