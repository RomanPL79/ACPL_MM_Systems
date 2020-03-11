class CfgPatches {
  class ACPL_WeaponsOnBack {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0;
    requiredAddons[] = {
		"cba_settings",
		"cba_main",
		"cba_common",
		"ace_common",
		"acpl_mm_core"
	};
	
    version = 2;
    versionStr = "BETA-1";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

class CfgFunctions
{
	#include "cfgFunctions.hpp"
};

class CfgVehicles {
	#include "cfgVehicles.hpp"
};