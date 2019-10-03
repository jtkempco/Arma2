//by Kempco	
_unit = _this select 0;
_static = _this select 1;

_vu_strt = vectorup _static;
_unit setVariable ["JTK_BreakOut","<null>"];

WaitUntil {_unit distance _static < 100};
While {_unit distance _static > 100} do {sleep 0.2};
_i = 0;  
while {(_unit distance _static <= 100) AND ((format ["%1",(_unit getVariable "JTK_BreakOut")]) == "<null>")} do {
	sleep 0.01;
	_static setvectorup [(sin _i)/36,(sin _i)/36,1];  
	_i = _i + random 1;
};
if ((format ["%1",(_unit getVariable "JTK_BreakOut")]) != "<null>") then {_static setvectorup _vu_strt}; 

