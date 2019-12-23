class CfgPatches {
  class ACPL_LooseHelmet {
    units[] = {
		ACPL_LooseHelmet_invisible_can
	};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
		"A3_Characters_F",
		"cba_settings",
		"cba_main",
		"A3_Structures_F",
		"ace_interaction"
	};
	
    version = 2;
    versionStr = "WIP";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

class CfgVehicles {
	#include "cfgVehicles.hpp"
};

class CfgFunctions
{
	#include "cfgFunctions.hpp"
	class ACPL_LooseHelmet_Initialization
	{
		class Init
		{
			file = "\ACPL_LooseHelmet\functions\Init.sqf";
			preInit = 1;
		};
	};
};

class Extended_InitPost_EventHandlers {
    class CAManBase;
	class SoldierWB: CAManBase {
        class ACPL_LooseHelmet_CAManBase_W_initpost_eh {
            hitpart = "(_this select 0) params ['_unit', '_shooter', '_projectile', '_position', '_velocity', '_selection', '_ammo', '_vector', '_radius', '_surfaceType', '_isDirect'];[[_unit, _shooter, _projectile, _position, _velocity, _selection, _ammo, _vector, _radius, _surfaceType, _isDirect],acpl_event_hit_function] remoteExec ['spawn',2];";
        };
    };
	class SoldierEB: CAManBase {
        class ACPL_LooseHelmet_CAManBase_E_initpost_eh {
            hitpart = "(_this select 0) params ['_unit', '_shooter', '_projectile', '_position', '_velocity', '_selection', '_ammo', '_vector', '_radius', '_surfaceType', '_isDirect'];[[_unit, _shooter, _projectile, _position, _velocity, _selection, _ammo, _vector, _radius, _surfaceType, _isDirect],acpl_event_hit_function] remoteExec ['spawn',2];";
        };
    };
	class SoldierGB: CAManBase {
        class ACPL_LooseHelmet_CAManBase_G_initpost_eh {
            hitpart = "(_this select 0) params ['_unit', '_shooter', '_projectile', '_position', '_velocity', '_selection', '_ammo', '_vector', '_radius', '_surfaceType', '_isDirect'];[[_unit, _shooter, _projectile, _position, _velocity, _selection, _ammo, _vector, _radius, _surfaceType, _isDirect],acpl_event_hit_function] remoteExec ['spawn',2];";
        };
    };
	class Civilian_F : CAManBase {
        class ACPL_LooseHelmet_CAManBase_C_initpost_eh {
            hitpart = "(_this select 0) params ['_unit', '_shooter', '_projectile', '_position', '_velocity', '_selection', '_ammo', '_vector', '_radius', '_surfaceType', '_isDirect'];[[_unit, _shooter, _projectile, _position, _velocity, _selection, _ammo, _vector, _radius, _surfaceType, _isDirect],acpl_event_hit_function] remoteExec ['spawn',2];";
        };
    }; 
};

//Load CBA Addon Settings
class Extended_PreInit_EventHandlers
{
	class ACPL_SkillSystem_CBAsettings
	{
		init="call compile preProcessFileLineNumbers '\ACPL_LooseHelmet\cba_settings.sqf'";
	};
};