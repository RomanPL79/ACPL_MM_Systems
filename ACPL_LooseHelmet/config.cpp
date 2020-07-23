class CfgPatches {
  class ACPL_LooseHelmet {
    units[] = {
		ACPL_LooseHelmet_invisible_can,
		ACPL_LooseHelmet_Disable_Module
	};
    weapons[] = {};
    requiredVersion = 0;
    requiredAddons[] = {
		"A3_Data_F_Tank_Loadorder",
		"cba_common",
		"cba_settings",
		"ace_interaction",
		"A3_UI_F",
		"A3_UI_F_Curator",
		"A3_Functions_F",
		"A3_Functions_F_Curator",
		"A3_Modules_F",
		"A3_Modules_F_Curator"
	};
	
    version = 2;
    versionStr = "BETA-1";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

#include "cfgFactionClasses.hpp"

class CfgVehicles {
	#include "cfgVehicles.hpp"
};

class CfgFunctions
{
	#include "CfgFunctions.hpp"
};

//Load CBA Addon Settings
class Extended_PreInit_EventHandlers
{
	class ACPL_LooseHelmet
	{
		init="call compile preProcessFileLineNumbers 'ACPL_LooseHelmet\cba_settings.sqf'";
	};
};

class Extended_InitPost_EventHandlers
{
	class Man;
	class CAManBase: Man {
		class ACPL_LooseHelmet
		{
			init="_this call ACPL_LooseHelmet_fnc_Player_HandleSimulation;";
		};
	};
};

class Extended_HitPart_EventHandlers {
	class Man;
	class CAManBase: Man {
		class ACPL_LooseHelmet {
			HitPart = "(_this select 0) call ACPL_LooseHelmet_fnc_HitHandler;";
		};
	};
};

class Extended_InventoryOpened_EventHandlers {
	class Man;
	class CAManBase: Man {
		class ACPL_LooseHelmet {
			InventoryOpened = "params ['_unit', '_container'];[_unit, _container, true] call ACPL_LooseHelmet_fnc_inventoryhandler;";
		};
	};
};

class Extended_InventoryClosed_EventHandlers {
	class Man;
	class CAManBase: Man {
		class ACPL_LooseHelmet {
			InventoryClosed = "params ['_unit', '_container'];[_unit, _container, false] call ACPL_LooseHelmet_fnc_inventoryhandler;";
		};
	};
};

class ACPL_LooseHelmet_GUI_Module
{
	idd = -1;
	movingEnabled = 1;
	enablesimulation = 1;
	onLoad="with uiNamespace do {ACPL_LooseHelmet_GUI_Module_Display = _this select 0}";
};