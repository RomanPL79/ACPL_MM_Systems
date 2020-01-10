class CfgPatches {
  class ACPL_SkillSystem {
    units[] = {
		ACPL_SkillSystem_settings_module,
		ACPL_SkillSystem_reset_module,
		ACPL_SkillSystem_exclude_module,
		ACPL_SkillSystem_custom_settings_module
	};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
		"A3_Characters_F",
		"cba_settings",
		"cba_main",
		"cba_common",
		"ace_common"
	};
	
    version = 28;
    versionStr = "1.0";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

class Extended_PreInit_EventHandlers
{
	class ACPL_SkillSystem
	{
		init="call compile preProcessFileLineNumbers 'ACPL_SkillSystem\cba_settings.sqf'";
	};
};

#include "cfgFactionClasses.hpp"

class CfgFunctions
{
	#include "cfgFunctions.hpp"
};

class Extended_PostInit_EventHandlers
{
	class ACPL_SkillSystem
	{
		init="call compile preProcessFileLineNumbers 'ACPL_SkillSystem\functions\Init.sqf'";
	};
};

// add init of SkillSystem for units
class CfgVehicles {
	#include "cfgVehicles.hpp"
};

class Extended_InitPost_EventHandlers {
	class Man;
	class CAManBase: Man {
		init = "params ['_unit'];[_unit] spawn ACPL_SkillSystem_fnc_SetSkill;";
    };
};