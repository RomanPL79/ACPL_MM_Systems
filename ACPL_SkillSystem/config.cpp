class CfgPatches {
  class ACPL_SkillSystem {
    units[] = {
		ACPL_SkillSystem_settings_module,
		ACPL_SkillSystem_reset_module
	};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
		"A3_Characters_F",
		"cba_settings",
		"cba_main"
	};
	
    version = 19;
    versionStr = "BETA-1";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

#include "cfgFactionClasses.hpp"
#include "BIS_AddonInfo.hpp"

class CfgFunctions
{
	#include "cfgFunctions.hpp"
	class ACPL_Initialization
	{
		class Init
		{
			file = "\Init.sqf";
			preInit = 1;
		};
	};
};

// add init of SkillSystem for units
class CfgVehicles {
	#include "cfgVehicles.hpp"
};

class Extended_InitPost_EventHandlers {
    class CAManBase;
	class SoldierWB: CAManBase {
        class ACPL_SkillSystem_CAManBase_W_initpost_eh {
            init = "params ['_entity'];[_entity] spawn ACPL_SkillSystem_fnc_SetSkill;";
        };
    };
	class SoldierEB: CAManBase {
        class ACPL_SkillSystem_CAManBase_E_initpost_eh {
            init = "params ['_entity'];[_entity] spawn ACPL_SkillSystem_fnc_SetSkill;";
        };
    };
	class SoldierGB: CAManBase {
        class ACPL_SkillSystem_CAManBase_G_initpost_eh {
            init = "params ['_entity'];[_entity] spawn ACPL_SkillSystem_fnc_SetSkill;";
        };
    };
};

//Load CBA Addon Settings
class Extended_PreInit_EventHandlers
{
	class ACPL_SkillSystem_CBAsettings
	{
		init="call compile preProcessFileLineNumbers '\ACPL_SkillSystem\cba_settings.sqf'";
	};
};