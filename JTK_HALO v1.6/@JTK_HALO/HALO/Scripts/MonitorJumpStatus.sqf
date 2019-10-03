//by Kempco
//Monitor Player Jump Status via animation state

_this setVariable ["JTK_HALO_Status","WAITING",true];
	
WaitUntil {((animationState _this) in JTK_HALO_Freefall_Animations) OR (!alive _this)};
While {alive _this} do {
	if ((animationState _this) in JTK_HALO_Swimming_Animations) then {_this setVariable ["JTK_HALO_Status","SWIMMING"]};
	if ((animationState _this) in JTK_HALO_Freefall_Animations) then {_this setVariable ["JTK_HALO_Status","FREEFALL",true]};
	if ((animationState _this) == "para_pilot") then {_this setVariable ["JTK_HALO_Status","IN CHUTE"]};
	if (!((animationState _this) in JTK_HALO_Freefall_Animations) AND ((animationState _this) != "para_pilot") AND (surfaceIsWater(position _this))) then {
		if (_this getVariable "JTK_HALO_Status" != "SWIMMING") then {
			WaitUntil {(animationState _this) in JTK_HALO_Swimming_Animations};
			_this setVariable ["JTK_HALO_Status","SWIMMING"];
			
		};
	};
	if (!((animationState _this) in JTK_HALO_Freefall_Animations) AND !((animationState _this) in JTK_HALO_Swimming_Animations) AND ((animationState _this) != "para_pilot") AND ((animationState _this) != "acrgpknlmstpsnonwnondnon_amovpercmstpsnonwnondnon_getoutlow") AND ((animationState _this) != "acrgpknlmstpsnonwnondnon_amovpercmstpsnonwnondnon_getouthigh")) exitWith {_this setVariable ["JTK_HALO_Status","DONE",true]};
	sleep 0.01;
};
_this setVariable ["JTK_HALO_Status","DONE",true];

if (JTK_ACE_Detected) then {
	if (!isMultiplayer) then {
		if (JTK_CanChangeID) then {
			_this setIdentity ((_this getVariable "JTK_Identities") select 0)
		};
	};
}else{
	if (JTK_CanChangeID) then {
		_this setIdentity ((_this getVariable "JTK_Identities") select 0)
	};
};
			


