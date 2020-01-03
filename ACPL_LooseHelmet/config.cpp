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

class Extended_HitPart_EventHandlers {
	class Man;
	class CAManBase: Man {
		HitPart = "(_this select 0) params ['_unit', '_shooter', '_projectile', '_position', '_velocity', '_selection', '_ammo', '_vector', '_radius', '_surfaceType', '_isDirect'];[[_unit, _shooter, _projectile, _position, _velocity, _selection, _ammo, _vector, _radius, _surfaceType, _isDirect],ACPL_LooseHelmet_fnc_HitHandler] remoteExec ['spawn',2];";
    };
};