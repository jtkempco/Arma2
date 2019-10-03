//by Kempco
		
_AI_cnt = _this select 0;

While {(position player select 2 > 1) AND (alive player)} do {sleep 1};
if (alive player) then {
	WaitUntil {(count(units group player) >= (_AI_cnt + 1)/2)};
	_t = time + 20;
	WaitUntil {(count(units group player) == (_AI_cnt + 1)) OR (time > _t)};
	//Addback switchable units if aplicable.
	if (!isMultiplayer) then {
		//player globalChat "TEAM SWITCH ENABLED";
		{addSwitchableUnit _x} foreach (units group player - [player]);
		enableTeamSwitch true;
	};
};
		
	

