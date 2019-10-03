//by Kempco

#include "Definitions.sqf"
disableSerialization;

_unit = _this select 0;
_sel = (_this select 3) select 0;
_aircraft = (_this select 3) select 1;

_alt_limits = _aircraft getVariable "altitude limits";
_min_alt = _alt_limits select 0;
_max_alt = _alt_limits select 1;
_min_radius = 100;

//Open Reset Dialog
if (_sel == "RESET") exitWith {[_unit,_aircraft] spawn JTK_Reset_Dlg};

//Allow only person to setup at a time to prevent overides
_setup_busy = _aircraft getVariable "JTK_HALO_Setup_Inprogress";
if (!isNil "_setup_busy") exitWith {[playerSide,"HQ"] sideChat "Negative: HALO setup already in progress."};

_aircraft spawn {
	_this setVariable ["JTK_HALO_Setup_Inprogress",true,true];
	while {dialog} do {sleep 0.1};
	_this setVariable ["JTK_HALO_Setup_Inprogress",nil,true];
};

_unit setVariable ["JTK_HALO_Aircraft",_aircraft];
_unit setVariable ["JTK_Halo_Markers",nil];
JTK_HaloPos = nil;

if (!isMultiplayer) then {_unit setVariable ["JTK_HALO_Reduce_Squad_Size",false]};
_unit setVariable ["JTK_HALO_Water_Insertion",false];

createDialog "JTK_HALO_Dlg";
WaitUntil{dialog};
_dialog = findDisplay JTK_HALO_IDD;

if (_sel == "CAPTURE") then {
	(_dialog displayCtrl JTK_HALO_EntBttn_IDC) ctrlSetText "Capture";
	ctrlSetText [JTK_HALO_txt_HEADER_IDC,"CAPTURE MODE"];	
	(_dialog displayCtrl JTK_HALO_txt_HEADER_IDC) ctrlSetTextColor [1.0, 0.35, 0.3, 1];
	_str = "<br/><t align='center'><t size='1.9'><t shadow='2'><t color='#ffffff'>Click Map to Start</t><br/><t align='left'><br/>";
	(_dialog displayCtrl JTK_Instructuions_IDC) ctrlSetStructuredText parseText _str;
}else{[_unit,false,_aircraft,false] call JTK_HelpTxt};
		

_alt = if (_max_alt > 7000) then {ceil(((_max_alt - _min_alt)/2)/1000)*1000}else{floor(((_max_alt - _min_alt)/2)/500)*500};
ctrlSetText [JTK_HALO_ALT_IDC,str _alt + "m"];

//Zoom Out Map
(_dialog displayCtrl HALO_Map_IDC) ctrlMapAnimAdd [0.5,0.5,position _unit];
ctrlMapAnimCommit (_dialog displayCtrl HALO_Map_IDC);
//waitUntil {ctrlMapAnimDone (_dialog displayCtrl HALO_Map_IDC)}; 


[_dialog,_unit,_sel,_aircraft,_min_radius] spawn{
	disableSerialization;
	_dialog = _this select 0;
	_unit = _this select 1;
	_sel = _this select 2;
	_aircraft = _this select 3;
	_min_radius = _this select 4;
	
	//_display_name = getText(configFile >> "cfgVehicles" >> (typeof _aircraft) >> "displayname");
	_display_name = if (_aircraft getVariable "is a C130") then {"C-130J"}else{"MV22"};
	_Dist2MarkBuffer = _aircraft getVariable "Dist2MarkBuffer";
	_alt_limits = _aircraft getVariable "altitude limits";
	_min_alt = _alt_limits select 0;
	_alt = parseNumber ctrlText (_dialog displayCtrl JTK_HALO_ALT_IDC);
	

	private ["_Dist2Marker"];
	
	While {sleep 1; dialog} do{

		MapClick = false;
		onMapSingleClick "JTK_HaloPos = _pos; MapClick = True";
		WaitUntil {(Mapclick) OR !(dialog)};
		
		_IsWater = [JTK_HaloPos,JTK_HALO_Water_Insertion_MinDistToLand,0.1,25] call JTK_GetPerimterPercentWater;
		_Dist2Marker = if (_IsWater) then {_Dist2MarkBuffer*(2/3)}else{_Dist2MarkBuffer};
		_m1_radius = if (_isWater) then {_min_radius}else{_min_radius + (abs(_min_alt - _alt)/500)*(0.1*_min_radius)};
		_unit setVariable ["JTK_HALO_Water_Insertion",_IsWater];
		
		_markers = _unit getVariable "JTK_Halo_Markers";
		
		
		if (dialog) then {
			if (isNil "_markers") then {
				ctrlSetText [JTK_RotateRight_IDC,"JTK\HALO\pics\arrow_right.paa"];
				ctrlSetText [JTK_RotateLeft_IDC,"JTK\HALO\pics\arrow_left.paa"];
				
				ctrlSetText [C130_Dir_Header_IDC,format["%1 Heading:",_display_name]];
				ctrlSetText [JTK_HALO_DIR_IDC,(0 call JTK_DirToDirString)];
							
				//Define Distance to marker
				_dist = [parseNumber(ctrlText JTK_HALO_ALT_IDC),_Dist2MarkBuffer] call JTK_AdjustDistToMarker;
						
				//Create Drop Zone Marker
				_m1 = createMarkerlocal [format["JTK_HALO_DZ_Marker_%1",_unit],JTK_HaloPos];
				_m1 setMarkerShapelocal "ELLIPSE";
				_m1 setMarkerSizelocal [_m1_radius,_m1_radius];
				_m1 setMarkerColorlocal "ColorGreen";
		
				_m2_offset = [(markerpos _m1), _dist, (markerDir _m1)] call BIS_fnc_relPos;

				//Create C130 Marker
				_m2 = createMarkerlocal [format["JTK_HALO_Ingress_Marker_%1",_unit],_m2_offset];
				_m2 setMarkerTypelocal "empty";
				_m2 setmarkerSizelocal [0.65,0.65];
				_m2 setMarkerColorlocal "ColorBlue";
				_dir = [markerpos _m1, markerpos _m2] call BIS_fnc_dirTo;//Determine m2 and m3 directions
				_m2 setMarkerdirlocal _dir;
				_m2 setMarkerTypelocal "mil_arrow2";
				_m2 setmarkerAlphalocal 0.7;
		
		
				_m3_offset = [(markerpos _m1),(_dist/2), (markerDir _m1)] call BIS_fnc_relPos;
				
				//Create jump vector marker
				_m3 = createMarkerlocal [format["JTK_HALO_JumpVector_%1",_unit],_m3_offset];
				_m3 setMarkerShapelocal "RECTANGLE";
				_m3 setmarkerSizelocal [5,((markerpos _m1) distance (markerpos _m2))/2];
				_m3 setMarkerColorlocal "ColorBlue";
				_m3 setMarkerdirlocal _dir;
				
				//Store marker info as player variable
				_unit setVariable ["JTK_Halo_Markers",[_m1,_m2,_m3]];
				
				JTK_Call_PVEH = [_unit,compile "{_x setmarkerShapeLocal 'ICON';_x setmarkerTypelocal 'Empty'} foreach (_this getVariable 'JTK_Halo_Markers')"];
				publicVariable "JTK_Call_PVEH"; 
				
				if ((_sel) == "CAPTURE") then {
					[markerPos _m1,(ctrlText JTK_HALO_DIR_IDC),parseNumber(ctrlText JTK_HALO_ALT_IDC),markerPos _m2,_isWater,_aircraft] call JTK_CapTxt;
				}else{
					[_unit,_isWater,_aircraft] call JTK_HelpTxt;
				};
			}else{
				_isWater = _unit getVariable "JTK_HALO_Water_Insertion";
				_markers = _unit getVariable "JTK_Halo_Markers";
				_m1 = _markers select 0;
				_m2 = _markers select 1;
				_m3 = _markers select 2;
					
						
				_m1 setmarkerposlocal JTK_HaloPos;
				_dist = [parseNumber(ctrlText JTK_HALO_ALT_IDC),_Dist2Marker] call JTK_AdjustDistToMarker;
				
				_m2_offset = [(markerpos _m1), _dist, (markerDir _m2)] call BIS_fnc_relPos;
				_m3_offset = [(markerpos _m1),(_dist/2), (markerDir _m2)] call BIS_fnc_relPos;
				
				_m2 setmarkerposlocal _m2_offset;
				_m3 setmarkerposlocal _m3_offset;
				
				if ((_sel) == "CAPTURE") then {
					[markerPos _m1,(ctrlText JTK_HALO_DIR_IDC),parseNumber(ctrlText JTK_HALO_ALT_IDC),markerPos _m2,_isWater,_aircraft] call JTK_CapTxt;
				}else{
					[_unit,_isWater,_aircraft] call JTK_HelpTxt;
				};
			};
		};
	};
};

While {dialog} do {sleep 1};
_unit setVariable ["JTK_HALO_Aircraft_Type",nil];
_markers = _unit getVariable "JTK_Halo_Markers"; 
{deletemarker _x} foreach _markers;





