class CfgPatches {
  class ACPL_FireSupport {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0;
    requiredAddons[] = {
		"A3_Data_F_Tank_Loadorder",
		"cba_common",
		"cba_settings",
		"ace_interaction"
	};
	
    version = 2;
    versionStr = "BETA-1";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

class CfgVehicles {
	#include "cfgACEactions.hpp";
    #include "Modules\modules.hpp";
};

class CfgFunctions
{
  tag = "ACPL_FireSupport";

	#include "Artillery_fncs\Functions.hpp";
  #include "Artillery_fncs\AI\Functions.hpp";
  #include "Main_fncs\functions.hpp";
};