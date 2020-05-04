class CfgPatches {
  class ACPL_MM_Core {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
		"cba_settings",
		"cba_main",
		"cba_common",
		"ace_common",
		"ace_medical"
	};
	
    version = 2;
    versionStr = "BETA-2";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

class Extended_PreInit_EventHandlers
{
	class ACPL_MM_Core
	{
		init="call compile preProcessFileLineNumbers 'ACPL_MM_Core\cba_settings.sqf'";
	};
};

class Extended_PostInit_EventHandlers
{	
	class ACPL_MM_Core
	{
		init="call compile preProcessFileLineNumbers 'ACPL_MM_Core\functions\Init.sqf'";
	};
};

class Extended_InitPost_EventHandlers
{	
	class CAManBase
	{
		class ACPL_MM_Core_Init {
			init = "params ['_unit'];[_unit] spawn ACPL_MM_Core_fnc_AddMedicaments;";
		};
	};
	
	class HeadlessClient_F
	{
		class HeadlessClient_F_init 
		{
			scope = 0;
			init = "params ['_unit'];[_unit] spawn ACPL_MM_Core_fnc_init_headless;";
		};
	};
};

#include "cfgFactionClasses.hpp"

class CfgFunctions
{
	#include "cfgFunctions.hpp"
};

class CfgVehicles {
	#include "cfgVehicles.hpp"
};