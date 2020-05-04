class CfgPatches {
  class ACPL_EqNecro {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {"cba_common"};
	
    version = 2;
    versionStr = "1.0";
    author = "[ACPL] Roman79";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

class CfgFunctions
{
	class ACPL_EqNecro {
        tag = "ACPL_EqNecro";
        class Functions {
            file = "ACPL_EqNecro";

            class badtouch {};
        };
    };
};

class Extended_InventoryOpened_EventHandlers {
	class Man;
	class CAManBase: Man {
		class ACPL_EqNecro {
			InventoryOpened = "params ['_unit', '_container'];[[_unit, _container, true], ACPL_EqNecro_fnc_badtouch] remoteExec ['spawn',_unit];";
		};
	};
};

class Extended_InventoryClosed_EventHandlers {
	class Man;
	class CAManBase: Man {
		class ACPL_EqNecro {
			InventoryClosed = "params ['_unit', '_container'];[[_unit, _container, false], ACPL_EqNecro_fnc_badtouch] remoteExec ['spawn',_unit];";
		};
	};
};