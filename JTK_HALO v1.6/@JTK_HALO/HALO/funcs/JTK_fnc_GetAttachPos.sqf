//by Kempco

_C130 = vehicle _this;

private ["_array"];

if !(_this in _C130) exitwith {};

_CommandUnit = (_C130 getVariable "JTK_HALO_CommandUnit") select 0;
_CommandPos = (_C130 getVariable "JTK_Halo_AttachPoints") select 0;
_UnitPosArray =  (_C130 getVariable "JTK_Halo_AttachPoints") select 1;

if (_this == _CommandUnit) then {
	_array = _CommandPos;
}else{
	_UnitArray = crew _C130;
	_UnitArray = _UnitArray - [_CommandUnit];
	
	_unitID = _UnitArray find _this;
	_array = (_UnitPosArray) select _unitID;
};

_array