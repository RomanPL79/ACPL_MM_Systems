class CfgPatches {
  class ACPL_LooseHelmet {
    units[] = {
		ACPL_LooseHelmet_invisible_can
	};
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

#include "cfgFactionClasses.hpp"

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
		class ACPL_LooseHelmet {
			HitPart = "(_this select 0) params ['_unit', '_shooter', '_projectile', '_position', '_velocity', '_selection', '_ammo', '_vector', '_radius', '_surfaceType', '_isDirect'];[[_unit, _shooter, _projectile, _position, _velocity, _selection, _ammo, _vector, _radius, _surfaceType, _isDirect],ACPL_LooseHelmet_fnc_HitHandler] remoteExec ['spawn',2];";
		};
	};
};

class Extended_InventoryOpened_EventHandlers {
	class Man;
	class CAManBase: Man {
		class ACPL_LooseHelmet {
			InventoryOpened = "params ['_unit', '_container'];[[_unit, _container, true], ACPL_LooseHelmet_fnc_inventoryhandler] remoteExec ['spawn',_unit];";
		};
	};
};

class Extended_InventoryClosed_EventHandlers {
	class Man;
	class CAManBase: Man {
		class ACPL_LooseHelmet {
			InventoryClosed = "params ['_unit', '_container'];[[_unit, _container, false], ACPL_LooseHelmet_fnc_inventoryhandler] remoteExec ['spawn',_unit];";
		};
	};
};