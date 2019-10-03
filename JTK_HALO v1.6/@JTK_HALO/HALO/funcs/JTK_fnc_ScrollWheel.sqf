//by Kempco

private ['_handled','_scrollValue','_GPS_status','_GPS_mode'];

_scrollValue = _this select 1;
_ctrlState 	= JTK_ctrlState;
_handled = false;

_cntrl = (uiNamespace getVariable 'JTK_Halo_Bailout_Mask') displayCtrl 0;
if ((ctrlShown _cntrl) AND (isNil 'JTK_FadeHaloMaskOverlay') AND (isNil '_ctrlState')) then {
	_handled = true;
	[] spawn {
		disableSerialization;
		JTK_FadeHaloMaskOverlay = true;
		((uiNamespace getVariable 'JTK_Halo_Bailout_Mask') displayCtrl 0) ctrlSetTextColor [1,1,1,0.7];
		sleep 1.5;
		((uiNamespace getVariable 'JTK_Halo_Bailout_Mask') displayCtrl 0) ctrlSetTextColor [1,1,1,1.0];
		JTK_FadeHaloMaskOverlay = nil;
	};
};
_handled


 


