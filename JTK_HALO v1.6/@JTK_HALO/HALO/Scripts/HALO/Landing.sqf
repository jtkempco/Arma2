//by Kempco
//Sound files taken from ACE
_unit = _this select 0;
_spd = _this select 1;
_unit setVelocity [0,0,0];
_unit setPos [position _unit select 0,position _unit select 1,0];	
if !(surfaceIsWater position _unit) then {
	_unit switchmove "SprintCivilBaseDf";
	_unit say ["JTK_Landing_Land", 50, 1];
	if (_spd < -2.5) then {
		_unit switchmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	}else{
		_unit switchmove "SprintCivilBaseDf";
		sleep 2;
		_unit switchmove "AmovPercMevaSnonWnonDfl"; 
	};
}else{
	_unit say ["JTK_Landing_Water", 50, 1];
	_unit playmoveNow "aswmpercmstpsnonwnondnon"; 
};

