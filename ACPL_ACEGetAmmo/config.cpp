class CfgPatches {
	class ACPL_ACEGetAmmo {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0;
		requiredAddons[] = {
			"ace_common",
			"cba_common"
		};
	
		version = 2;
		versionStr = "BETA-1";
		author = "[ACPL] Roman";
		authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
	};
};

#include "defines.hpp"

class CfgFactionClasses {
    class NO_CATEGORY;
    class ACPL_ACEgetAmmo_modules: NO_CATEGORY
	{
		displayName = "$STR_ACPL_ACEgetAmmo_modules_category";
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

#include "cfgEvents.hpp"

class cfgVehicles
{
	#include "cfgACEActions.hpp"
	#include "modules\modules.hpp"
};

class cfgMagazines
{
	#include "cfgMagazines.hpp"
};

class cfgWeapons
{
	#include "items\items.hpp"
};

class ACPL_ACEGetAmmo_GUI
{
	idd = -1;
	movingEnabled = 1;
	enablesimulation = 1;
	onLoad="with uiNamespace do {ACPL_ACEGetAmmo_GUI = _this select 0}";
};

class Cfg3DEN {
	#include "cfg3DEN.hpp"
};