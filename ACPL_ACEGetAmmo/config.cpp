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

class cfgMagazines
{
	#include "cfgMagazines.hpp"
};

class ACPL_ACEGetAmmo_GUI
{
	idd = -1;
	movingEnabled = 1;
	enablesimulation = 1;
	onLoad="with uiNamespace do {ACPL_ACEGetAmmo_GUI = _this select 0}";
};