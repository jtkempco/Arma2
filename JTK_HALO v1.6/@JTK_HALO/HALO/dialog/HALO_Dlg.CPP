//by Kempco

#include "definitions.sqf"

class JTK_HALO_Dlg
{
	idd = JTK_HALO_IDD;
	movingenable = True;
	
	class controlsBackground 
	{
		
		class BackGround : JTK_RscPic 
		{
		   	
			idc = -1;
			x = 0.153263 * safezoneW + safezoneX;
			y = 0.171 * safezoneH + safezoneY;
			w = 0.822766 * safezoneW;
			h = 0.6815 * safezoneH;
			text = "\ca\ui\data\ui_background_video_ca.paa";
		};
		class BackGround_btm : JTK_RscPic 
		{
		   	
			idc = -1;
			x = -0.328643 * safezoneW + safezoneX;
			y = 0.8149 * safezoneH + safezoneY;
			w = 1.62594 * safezoneW;
			h = 0.149225 * safezoneH;
			text = "\ca\ui\data\ui_background_transparent_bottom_ca.paa";
		};

		class BackGround_top : JTK_RscPic 
		{
		   	
			idc = -1;
			x = -0.328643 * safezoneW + safezoneX;
			y = 0.1381 * safezoneH + safezoneY;
			w = 1.62594 * safezoneW;
			h = 0.149225 * safezoneH;
			text = "\ca\ui\data\ui_background_transparent_top_ca.paa";
		};
		class AltArrow_Up : JTK_RscPic 
		{
		   	
			idc = JTK_IncreaseAltitude_IDC;
			x = 0.274719 * safezoneW + safezoneX;
			y = 0.5705 * safezoneH + safezoneY;
			w = 0.0195897 * safezoneW;
			h = 0.0235 * safezoneH;
			text = "\ca\ui\data\arrow_up_ca.paa";
		};
		class AltArrow_Dwn : AltArrow_Up 
		{
			idc = JTK_DecreaseAltitude_IDC;
			y = 0.6081 * safezoneH + safezoneY;
			text = "\ca\ui\data\arrow_down_ca.paa";
		};
		class JTK_Left_Frame: JTK_RscFrame
		{
			idc = -1;
			x = 0.304103 * safezoneW + safezoneX;
			y = 0.265 * safezoneH + safezoneY;
			w = 0.117538 * safezoneW;
			h = 0.47 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.65};
		};
		class JTK_TextFrameCover: JTK_RscBackground
		{
			idc = -1;
			text = "";
			x = 0.304103 * safezoneW + safezoneX;
			y = 0.265 * safezoneH + safezoneY;
			w = 0.117538 * safezoneW;
			h = 0.47 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,0};
		};
					
	};
	class Controls
	{
		class JTK_Confirm_HDR: JTK_RscText
		{
			idc = JTK_Confirm_HDR_IDC;
			style = ST_CENTER;
			sizeEx = 0.045;
			x = 0.147386 * safezoneW + safezoneX;
			y = 0.265 * safezoneH + safezoneY;
			w = 0.156717 * safezoneW;
			h = 0.03431 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,0,0,1};
			text = "";
		};
		class JTK_Confirm_txt_ALTITUDE: JTK_RscText
		{
			idc = -1;
			text = "";
			x = 0.147386 * safezoneW + safezoneX;
			y = 0.29555 * safezoneH + safezoneY;
			w = 0.156717 * safezoneW;
			h = 0.0188 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class JTK_Confirm_txt_HEADING: JTK_Confirm_txt_ALTITUDE
		{
			idc = -1;
			text = "";
			y = 0.33315 * safezoneH + safezoneY;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class JTK_Confirm_txt_GRID: JTK_Confirm_txt_ALTITUDE
		{
			idc = -1;
			text = "";
			y = 0.37075 * safezoneH + safezoneY;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};

		};
//========================Buttons=====================================//

		class JTK_BttnEnter: JTK_RscGUIShortcutButton 
		{
			idc = JTK_HALO_EntBttn_IDC;
			x = 0.695897 * safezoneW + safezoneX;
			y = 0.8619 * safezoneH + safezoneY;
			w = 0.0685638 * safezoneW;
			h = 0.0235 * safezoneH;

			text = "Enter";
			onButtonClick = "call JTK_HALO_Enter";
		};
		class CloseButton: JTK_BttnEnter 
		{
			x = 0.582277 * safezoneW + safezoneX;
			text = "Close";
			onButtonClick = "CloseDialog 0;";
		};
		class JTK_HALO_HEADER: JTK_RscText
		{
			idc = JTK_HALO_txt_HEADER_IDC;
			text = "HALO SETUP";
			style = ST_CENTER;
			sizeEx = 0.045;
			x = 0.304103 * safezoneW + safezoneX;
			y = 0.22975 * safezoneH + safezoneY;
			w = 0.391793 * safezoneW;
			h = 0.03525 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.0};
		};

		class RotateRight: JTK_RscButton
		{
			colorText[] = { 0, 0, 0, 0 };
			colorDisabled[] = {0, 0, 0, 0};
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundActive[] = {0, 0, 0, 0};
			colorBorder[] = { 0, 0, 0, 0 };
			colorShadow[] = { 0, 0, 0, 0};
			colorFocused[] = {0, 0, 0, 0};
			sizeEx = 0.022;
			x = 0.274719 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0195897 * safezoneW;
			h = 0.02115 * safezoneH;
			text = "";
			onButtonClick = "'right' call JTK_RotateHeading";
		};
		class RotateLeft: RotateRight
		{
			x = 0.170894 * safezoneW + safezoneX;
			text = "";
			onButtonClick = "'left' call JTK_RotateHeading";
		};

		class Altitude_Increase: RotateRight
		{
			
			x = 0.274719 * safezoneW + safezoneX;
			y = 0.5705 * safezoneH + safezoneY;
			w = 0.0195897 * safezoneW;
			h = 0.0235 * safezoneH;
			text = "";
			onButtonClick = "'Up' call JTK_AdjustAltitude";
		};
		class Altitudde_Decrease: Altitude_Increase
		{
			y = 0.6081 * safezoneH + safezoneY;
			text = "";
			onButtonClick = "'Down' call JTK_AdjustAltitude";
		};

		class Right_Pic : JTK_RscPic 
		{
		   	
			idc = JTK_RotateRight_IDC;
			x = 0.274719 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.0195897 * safezoneW;
			h = 0.02115 * safezoneH;
			colorBackground[] = { 1, 1, 1, 1 };
			text = "";
		};
		class Left_Pic : Right_Pic 
		{
			idc = JTK_RotateLeft_IDC;
			x = 0.170894 * safezoneW + safezoneX;
			text = "";
		};

//========================ALT=====================================//
		class Alt_Txt_hdr: JTK_RscText
		{
			idc = -1;
			style = ST_CENTER;
			sizeEx = 0.045;
			text = "Altitude:";
			x = 0.149345 * safezoneW + safezoneX;
			y = 0.5846 * safezoneH + safezoneY;
			w = 0.0807094 * safezoneW;
			h = 0.0282 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class HALO_ALT: JTK_RscText
		{
			idc = JTK_HALO_ALT_IDC;
			style = ST_CENTER;
			sizeEx = 0.045;
			x = 0.21595 * safezoneW + safezoneX;
			y = 0.5846 * safezoneH + safezoneY;
			w = 0.0509331 * safezoneW;
			h = 0.027025 * safezoneH;

			colorBackground[] = {0,0,0,0.55};
		};
		class HALO_ALT_Frame: JTK_RscFrame
		{
			idc = -1;
			x = 0.21595 * safezoneW + safezoneX;
			y = 0.5846 * safezoneH + safezoneY;
			w = 0.0509331 * safezoneW;
			h = 0.027025 * safezoneH;

			colorBackground[] = { 0, 0, 0, 0};
		};
//========================DIR=====================================//

		class C130_Dir_Header: JTK_RscText
		{
			idc = C130_Dir_Header_IDC;
			style = ST_CENTER;
			sizeEx = 0.045;
			text = "";
			x = 0.194401 * safezoneW + safezoneX;
			y = 0.7068 * safezoneH + safezoneY;
			w = 0.0807094 * safezoneW;
			h = 0.0282 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class JTK_HALO_DIR: C130_Dir_Header
		{
			idc = JTK_HALO_DIR_IDC;
			sizeEx = 0.042;
			text = "";
			y = 0.735 * safezoneH + safezoneY;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class JTK_HALO_DIR_Cover: JTK_RscBackground
		{
			idc = -1;
			text = "";
			x = 0.186565 * safezoneW + safezoneX;
			y = 0.6275 * safezoneH + safezoneY;
			w = 0.0807094 * safezoneW;
			h = 0.0282 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,0};
		};		
//===============================================================//
		
		class JTK_TextField : JTK_RscText 
		{
			idc = -1;
			style = ST_LEFT;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = { 1, 1, 1, 1 };
			x = 0.105; y = 0.147; 
			w = 0.275; h = 0.05;
			sizeEx = 0.03;
			text = "";
		};
		class JTK_Instructuions : JTK_RscStructuredText
		{
			idc = JTK_Instructuions_IDC;
			x = 0.163058 * safezoneW + safezoneX;
			y = 0.265 * safezoneH + safezoneY;
			w = 0.141046 * safezoneW;
			h = 0.282 * safezoneH;
			text = "";
			colorBackground[] = {0,0,0,0.55};
		};
		class JTK_Directions_Frame : JTK_RscFrame
		{
			idc = -1;
			x = 0.163058 * safezoneW + safezoneX;
			y = 0.265 * safezoneH + safezoneY;
			w = 0.141046 * safezoneW;
			h = 0.282 * safezoneH;
			text = "";
			colorBackground[] = {0, 0, 0, 0.55};
		};
		class HALO_Map : JTK_RscMap
		{
			idc = HALO_Map_IDC;
			colorBackground[] = { 1, 1, 1, 1 };
			x = 0.304103 * safezoneW + safezoneX;
			y = 0.265 * safezoneH + safezoneY;
			w = 0.477988 * safezoneW;
			h = 0.5546 * safezoneH;
			default = true;
			showCountourInterval = false;	
		};
		
		class JTK_C130_L: JTK_RscText
		{
			idc = JTK_C130_L_IDC;
			x = -0.272727;
			y = 0.40;
			w = 0.136262;
			h = 0.0025;
			colorBackground[] = {0,0,1,0};
		};
		class JTK_LZ_L: JTK_RscText
		{
			idc =JTK_LZ_L_IDC;
			x = 0.196353 * safezoneW + safezoneX;
			y = 0.505555 * safezoneH + safezoneY;
			w = 0.0402083 * safezoneW;
			h = 0.0025;
			colorBackground[] = {0,1,0,0};
		};
		class JTK_JV_L: JTK_C130_L
		{
			idc = JTK_JV_L_IDC;
			x = -0.273988;
			y = 0.459596;
			w = 0.138787;
			h = 0.0025;
			colorBackground[] = {0,0,1,0};
		};
		class JTK_C130_Mrkr: JTK_RscPicture
		{
			idc = JTK_C130_Mrkr_IDC;
			x = -0.285;
			y = 0.387205;
			w = 0.0225;
			h = 0.055;
			text = "";
			colorText[] = {0,0,1,1};
		};		
		class JTK_DZ_Mrkr: JTK_RscPicture
		{
			idc = JTK_DZ_Mrkr_IDC;
			x = -0.3;
			y = 0.457913;
			w = 0.055;
			h = 0.055;
			text = "";
			colorText[] = {0,1,0,0};
		};
		class JTK_JV_Mrkr: JTK_RscText
		{
			idc = JTK_JV_Mrkr_IDC;
			x = -0.276515;
			y = 0.425927;
			w = 0.005;
			h = 0.0891247;
			colorBackground[] = {0,0,1,0};
		};
		class JTK_C130_ST: JTK_RscStructuredText
		{
			idc = JTK_C130_ST_IDC;
			x = -0.133838;
			y = 0.390572;
			w = 0.0747474;
			h = 0.03;
			colorBackground[] = {0,0,0,0};
			text = "";
		};
		class JTK_JV_ST: JTK_C130_ST
		{
			idc = JTK_JV_ST_IDC;
			x = -0.132576;
			y = 0.447811;
			w = 0.15;
		};
		class JTK_DZ_ST: JTK_C130_ST
		{
			idc = JTK_DZ_ST_IDC;
			x = -0.132576;
			y = 0.501684;
			w = 0.15;
			h = 0.0276094;
			colorBackground[] = {0,0,0,0};
			text = "";
		};

	};
};
		
		

class JTK_HALO_Reset_Dlg
{
	idd = JTK_Reset_Dlg_IDD;
	movingenable = false;
	
	onLoad = "";
	
	class controlsBackground 
	{
		class Ins_Bckgrnd : JTK_RscPic 
		{
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.39055 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.15125 * safezoneH;
			text = "\ca\ui\data\ui_background_controls_ca.paa";
		};
		class JTK_HALO_Reset_Text: JTK_RscStructuredText
		{
			idc = JTK_Reset_Text_IDC;
			x = 0.342708 * safezoneW + safezoneX;
			y = 0.410186 * safezoneH + safezoneY;
			w = 0.227187 * safezoneW;
			h = 0.10963 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
		};

	};
	class Controls
	{
		class JTK_Bttn_Close: JTK_RscGUIShortcutButton 
		{
			x = 0.5 * safezoneW + safezoneX;
			y = 0.51925 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0275 * safezoneH;
			text = "Close";
			onButtonClick = "closeDialog 0";
		};
		class JTK_Reset_Bttn: JTK_Bttn_Close 
		{
			idc = JTK_Reset_Bttn_IDC;
			x = 0.363875 * safezoneW + safezoneX;
			text = "Reset";
			onButtonClick = "[] spawn JTK_HALO_Reset";
		};
	};
};



