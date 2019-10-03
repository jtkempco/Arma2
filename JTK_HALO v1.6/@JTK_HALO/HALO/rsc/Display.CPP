class JTK_Halo_Bailout_Mask_RSC
{
	idd = -1;
	
      duration = 99999999999999999;
      fadein  = 0;
      fadeout = 0;

	onLoad = "uiNamespace setVariable ['JTK_Halo_Bailout_Mask', (_this select 0)]"; 

	class Controls
	{
		class BailOutMask : JTK_RscPic 
		{
		   	
			idc = 0;
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			text = "JTK\HALO\pics\ACE_GasmaskUS_Rsc_ca.paa";
		};
	};
};


class JTK_HALO_GOGGLES_RSC
{
	idd = -1;
	
      duration = 99999999999999999;
      fadein  = 0;
      fadeout = 0;

	onLoad = "uiNamespace setVariable ['JTK_Halo_Goggles', (_this select 0)]"; 

	class Controls
	{
		class JTK_HALO_Goggles : JTK_RscPic 
		{
		   	
			idc = 0;
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			text = "JTK\HALO\pics\goggles.paa";
		};
	};
};

class JTK_HALO_GPS_RSC
{
	idd = -1;
	
	duration = 99999999999999999;
      	fadein  = 0;
      	fadeout = 0;

	onLoad = "uiNamespace setVariable ['JTK_HALO_GPS', (_this select 0)]"; 
      
    
	 
	class controlsBackground 
	{
		class JTK_GPS_Settings_Pic: JTK_RscPic
		{
			idc = 0;
			x = 0.756717 * safezoneW + safezoneX;
			y = 0.6825 * safezoneH + safezoneY;
			w = 0.195897 * safezoneW;
			h = 0.325083 * safezoneH;		
			text = "\ca\ui\data\ui_gps_ca.paa";		
		};
		class GPS_Screen : JTK_RscText
		{
			idc = 1;
			x = 0.780225 * safezoneW + safezoneX;
			y = 0.7401 * safezoneH + safezoneY;
			w = 0.148881 * safezoneW;
			h = 0.1786 * safezoneH;	
			colorBackground[] = {0.408333,0.447222,0.316667,1};
		};
		class JTK_GPS_Coords_Frame: JTK_RscFrame
		{
			idc = 2;
			x = 0.780225 * safezoneW + safezoneX;
			y = 0.7401 * safezoneH + safezoneY;
			w = 0.148881 * safezoneW;
			h = 0.1786 * safezoneH;
			colorText[] = {0.075,0.075,0.075,1};
			
		};
	};
	class Controls
	{
		class JTK_GPS_Coords_Mode: JTK_RscText
		{
			idc = 3;
			x = 0.780225 * safezoneW + safezoneX;
			y = 0.901667 * safezoneH + safezoneY;
			w = 0.0744405 * safezoneW;
			h = 0.0203333 * safezoneH;
			colorBackground[] = {0.408333,0.447222,0.316667,1};
			colorText[] = {0.075,0.075,0.075,1};
			style = ST_CENTER; 
			sizeEx = 0.035;
			text = "COORDS";
		};
		
		class JTK_GPS_Map_Mode: JTK_GPS_Coords_Mode
		{
			idc = 4;
			x = 0.8546655 * safezoneW + safezoneX;
			colorBackground[] = {0.05,0.05,0.05,0.7};
			colorText[] = {0.408333,0.447222,0.316667,1};
			text = "MAP";
		};
		

		class JTK_GPS_Map_Mode_Frame: JTK_RscFrame
		{
			idc = 5;
			x = 0.780226 * safezoneW + safezoneX;
			y = 0.901667 * safezoneH + safezoneY;
			w = 0.0744404 * safezoneW;
			h = 0.0203333 * safezoneH;
			colorText[] = {0.075,0.075,0.075,1};
			
			
		};
		class JTK_GPS_Coords_Mode_Frame: JTK_GPS_Map_Mode_Frame
		{
			idc = 6;
			x = 0.854667 * safezoneW + safezoneX;
			colorText[] = {0.408333,0.447222,0.316667,1};
		};
		
		class JTK_GPS_Direction_Display: JTK_RscText
		{
			idc = 7;
			x = 0.780226 * safezoneW + safezoneX;
			y = 0.751323 * safezoneH + safezoneY;
			w = 0.148881 * safezoneW;
			h = 0.0353334 * safezoneH;
			sizeEx = 0.065;
			style = ST_CENTER;
			colorText[] = {0.075,0.075,0.075,1};
			text = "99";
			
		};
		class JTK_GPS_Speed_Display: JTK_GPS_Direction_Display
		{
			idc = 8;
			y = 0.798333 * safezoneH + safezoneY;
			text = "";
		};
		
		class GPS_Alt_Display: JTK_GPS_Direction_Display
		{
			idc = 9;
			y = 0.844999 * safezoneH + safezoneY;
			h = 0.0570002 * safezoneH;
			sizeEx = 0.1;
			text = "";
		};
			
		class JTK_GPS_Degree_Symbol: JTK_RscText
		{
			idc = 10;
			x = 0.86 * safezoneW + safezoneX;
			y = 0.755002 * safezoneH + safezoneY;
			w = 0.0122956 * safezoneW;
			h = 0.0153334 * safezoneH;
			sizeEx = 0.035;
			colorText[] = {0.075,0.075,0.075,1};
			text = " o";
		};
		
		
		class JTK_GPS_Dir_Header: JTK_RscText
		{
			idc = 11;
			x = 0.780225 * safezoneW + safezoneX;
			y = 0.74025 * safezoneH + safezoneY;
			w = 0.148881 * safezoneW;
			h = 0.0119999 * safezoneH;
			colorBackground[] = {0.05,0.05,0.05,0.7};
			colorText[] = {0.408333,0.447222,0.316667,1};
			style = ST_CENTER; 
			sizeEx = 0.03;
			text = "HEADING :";	
		};
		class JTK_GPS_Speed_Header: JTK_GPS_Dir_Header
		{
			idc = 12;
			y = 0.7866 * safezoneH + safezoneY;
			text = "SPEED :";	
		};
		class JTK_GPS_Alt_Header: JTK_GPS_Dir_Header
		{
			idc = 13;
			y = 0.83295* safezoneH + safezoneY;
			text = "Altitude :";	
		};
		class MAP_RSC : JTK_RscMap
		{
			idc = 14;
			x = 0.780225 * safezoneW + safezoneX;
			y = 0.7401 * safezoneH + safezoneY;
			w = 0.148881 * safezoneW;
			h = 0.1786 * safezoneH;	
		};
	};
};

class JTK_HALO_GPS_LOAD_SCREEN_RSC
{
	idd = -1;
	
	duration = 99999999999999999;
      fadein  = 0;
      fadeout = 0;

	onLoad = "uiNamespace setVariable ['JTK_HALO_GPS_Loadscreen', (_this select 0)]"; 

	class controlsBackground 
	{
		class JTK_GPS_Load_Screen: JTK_RscText
		{
			idc = 0;
			x = 0.780226 * safezoneW + safezoneX;
			y = 0.740099 * safezoneH + safezoneY;
			w = 0.149506 * safezoneW;
			h = 0.182767 * safezoneH;
			colorBackground[] = {0.408333,0.447222,0.316667,1};		
			text = "";		
		};
		class JTK_GPS_Load_Screen_Frame : JTK_RscFrame
		{
			idc = 1;
			x = 0.780226 * safezoneW + safezoneX;
			y = 0.740099 * safezoneH + safezoneY;
			w = 0.149506 * safezoneW;
			h = 0.182767 * safezoneH;	
			colorText[] = {0.075,0.075,0.075,1};
			
		};
	};
	class Controls
	{
		class JTK_GPS_Load_Pic: JTK_RscPic
		{
			idc = 2;
			x = 0.815488 * safezoneW + safezoneX;
			y = 0.765602 * safezoneH + safezoneY;
			w = 0.0783587 * safezoneW;
			h = 0.094 * safezoneH;

			text = "JTK\HALO\pics\7th_Skull.paa";
		};
		class JTK_GPS_Color_Filter: JTK_RscText
		{
			idc = 3;
			x = 0.780226 * safezoneW + safezoneX;
			y = 0.740099 * safezoneH + safezoneY;
			w = 0.149506 * safezoneW;
			h = 0.182767 * safezoneH;
			colorBackground[] = {0.408333,0.447222,0.316667,0.55};		
			text = "";		
		};
		
		class JTK_GPS_Satus_Frame : JTK_RscFrame
		{
			idc = 4;
			x = 0.805693 * safezoneW + safezoneX;
			y = 0.885832 * safezoneH + safezoneY;
			w = 0.0979483 * safezoneW;
			h = 0.0047 * safezoneH;	
			colorText[] = {0.075,0.075,0.075,1};
			
		};
		
		class JTK_GPS_Satus_Bar : JTK_RscText
		{
			idc = 5;
			x = 0.805693 * safezoneW + safezoneX;
			y = 0.885832 * safezoneH + safezoneY;
			w = 0;
			h = 0.0047 * safezoneH;	
			colorBackground[] = {0.05,0.05,0.05,0.7};
			
		};
		
		class JTK_GPS_Satus_Text : JTK_RscText
		{
			idc = 6;
			x = 0.805693 * safezoneW + safezoneX;
			y = 0.868931 * safezoneH + safezoneY;
			w = 0.0979483 * safezoneW;
			h = 0.01645 * safezoneH;
			colorText[] = {0.075,0.075,0.075,1};
			colorBackground[] = {0,0,0,0};
			style = ST_CENTER; 
			sizeEx = 0.0275;
			text = "Initializing..";
			
		};
		class JTK_GPS_NOTES_Hint : JTK_RscStructuredText
		{
			idc = 7;
			x = 0.780226 * safezoneW + safezoneX;
			y = 0.816765 * safezoneH + safezoneY;
			w = 0.149506 * safezoneW;
			h = 0.0327671 * safezoneH;
			colorBackground[] = {0,0,0,0};
			text = "";
			
		};
	};
};


class JTK_HALO_ACTION_WHEEL_RSC
{
	idd = -1;
      duration = 99999999999999999;
      fadein  = 0;
      fadeout = 0;
	onLoad = "uiNamespace setVariable ['JTK_HALO_Action_Wheel', (_this select 0)]"; 

	class Controls
	{
		class JTK_HALO_ActionWheel_1: JTK_RscStructuredText
		{
			idc = 0;
			text = "";
			x = 0.01325 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			SizeEx = 0;
		};
		class JTK_HALO_ActionWheel_2: JTK_HALO_ActionWheel_1
		{
			idc = 1;
			text = "";
			y = 0.5 * safezoneH + safezoneY;
		};
		class JTK_HALO_ActionWheel_3: JTK_HALO_ActionWheel_1
		{
			idc = 2;
			text = "";
			y = 0.522 * safezoneH + safezoneY;
		};
		class JTK_HALO_ActionWheel_4: JTK_HALO_ActionWheel_1
		{
			idc = 3;
			text = "";
			y = 0.544 * safezoneH + safezoneY;
		};
		class JTK_HALO_ActionWheel_5: JTK_HALO_ActionWheel_1
		{
			idc = 4;
			text = "";
			y = 0.566 * safezoneH + safezoneY;
		};
	};
};

class JTK_PROGRESS_BAR_RSC
{
	idd = -1;
	
      duration = 99999999999999999;
      fadein  = 0;
      fadeout = 0;

	onLoad = "uiNamespace setVariable ['JTK_ProgressBar', (_this select 0)]";

	class Controls
	{
		class JTK_ProgressBar_BG: JTK_RscText
		{
			idc = 0;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.0614818 * safezoneH;
			//colorBackground[] = {0.192,0.141,0.098,0.89};
			colorBackground[] = {0,0,0,0};
		};
		class JTK_ProgressBar_OutLine_Pic: JTK_RscPicture
		{
			idc = 1;
			text = "\ca\ui\data\loadscreen_progressbar_ca.paa";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.0259259 * safezoneH + safezoneY;
			w = 0.171187 * safezoneW;
			h = 0.012375 * safezoneH;
			colorText[] = {0,0,0,0.55};
		};
		class JTK_ProgressBar_Pic: JTK_RscPicture
		{
			idc = 2;
			text = "\ca\ui\data\loadscreen_progressbar_ca.paa";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.0259259 * safezoneH + safezoneY;
			w = 0;
			h = 0.012375 * safezoneH;
		};
		class JTK_ProgressBar_Header: JTK_RscStructuredText
		{
			idc = 3;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.00637499 * safezoneH + safezoneY;
			w = 0.171187 * safezoneW;
			h = 0.0170371 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};

class JTK_HALO_CINEMA_BORDER_RSC
{
      idd = -1;
	
      duration = 99999999999999999;
      fadein  = 0;
      fadeout = 0;
      onLoad = "uiNamespace setVariable ['JTK_CinemaBorder', (_this select 0)]";
      
      class controlsBackground 
	{
		class JTK_UpperBorder: JTK_RscText
		{
			idc = 0;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.13 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class JTK_LowerBorder: JTK_UpperBorder
		{
			idc = 1;
			y = 0.875 * safezoneH + safezoneY;
		};
	};
	class Controls
	{
		class JTK_UserInput_Warning: JTK_RscStructuredText
		{
			idc = 2;
			text = "*USER INPUT DISABLED";
			x = -0.721465;
			y = -0.271044;
			w = 0.466162;
			h = 0.0612793;
			colorText[] = {1,1,-1,1};
			colorBackground[] = {0,0,0,0};
		};
	};
};



