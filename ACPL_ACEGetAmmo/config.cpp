class CfgPatches {
	class ACPL_ACEGetAmmo {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0;
		requiredAddons[] = {
			"ace_common"
		};
	
		version = 2;
		versionStr = "BETA-1";
		author = "[ACPL] Roman";
		authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
	};
};

class CfgFunctions
{
	class ACPL_ACEGetAmmo
	{
		tag = "ACPL_ACEGetAmmo";

		#include "functions\functions.hpp"
	};
};

class cfgVehicles
{
	#include "cfgACEActions.hpp"
};