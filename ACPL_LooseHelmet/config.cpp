class CfgPatches {
  class ACPL_LooseHelmet {
    units[] = {
		ACPL_LooseHelmet_invisible_can
	};
    weapons[] = {};
    requiredVersion = 0;
    requiredAddons[] = {
		"A3_Characters_F",
		"cba_settings",
		"cba_main",
		"A3_Structures_F",
		"ace_interaction",
		"ACPL_MM_Core",
		"cba_common",
		"ace_common"
	};
	
    version = 2;
    versionStr = "BETA-1";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

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

class Extended_PostInit_EventHandlers
{
	class ACPL_LooseHelmet
	{
		init="call compile preProcessFileLineNumbers 'ACPL_LooseHelmet\functions\Init.sqf'";
	};
};