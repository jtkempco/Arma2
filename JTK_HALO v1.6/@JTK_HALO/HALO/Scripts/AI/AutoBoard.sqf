//by Kempco
_C130 = _this select 0;
_units = units group player - [player];

WaitUntil {player in _C130};

if (count _units > 0) then {
	{[_x,_C130] spawn {
		
		_unit = _this select 0;
		_C130 = _this select 1;
		_units = units group player - [player];
		if (_unit distance _C130 <= 100) then {
			_index = _units find _unit;
			sleep (_index*0.5);
			_unit assignasCargo _C130;
			_unit moveInCargo _C130;
			
			_UnitsOnBoard = {!(isPlayer _x) AND (alive _x) AND (_x in _C130) AND (_x in _units)} count allUnits;
			_OnBoard = _OnBoard + 1;
			[_UnitsOnBoard,count _units] call JTK_AI_Boarding_txt;
		};
		
		_UnitsOnBoard = {!(isPlayer _x) AND (alive _x) AND (_x in _C130) AND (_x in _units)} count allUnits;
		_ToatalUnits = {!(isPlayer _x) AND (alive _x) AND (_x in _units)} count allUnits;
		_UnitsFar = {!(isPlayer _x) AND (alive _x) AND (_x in _units) AND (_x distance _C130 > 100)} count allUnits;
		//if (_UnitsOnBoard == _ToatalUnits) then {sleep 5; hintSilent ""};
		if (_unit == _units select (count _units - 1)) then {
			if (_UnitsOnBoard == _ToatalUnits) then {
				hintSilent parsetext "<t size='1.2'color='#00ff00'>All Units Ready!</t><br/>";
				sleep 4;
				hintSilent "";
			};
		};

	}}foreach _units;
};


