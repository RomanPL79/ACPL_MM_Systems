class CfgPatches {
  class ACPL_MM_Core {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {};
	
    version = 1;
    versionStr = "BETA-1";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
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