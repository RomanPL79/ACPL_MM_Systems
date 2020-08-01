class LandVehicle;
class Car: LandVehicle {
	class ACE_SelfActions {
		class ACPL_ACEGetAmmo_GetAmmo {
			displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo";
			condition = "_target getvariable ['ace_rearm_currentsupply', 0] > 0";
			statement = "";
			insertChildren = "_this call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
			exceptions[] = {"isNotInside"};
		};
			
		class ACPL_ACEGetAmmo_CheckAmmo {
			displayName = "$STR_ACPL_ACEGetAmmo_CheckAmmo";
			condition = "_target getvariable ['ace_rearm_currentsupply', 0] > 0";
			statement = "[_target] call ACPL_ACEGetAmmo_fnc_getammo_action_checkammo;";
			exceptions[] = {"isNotInside"};
		};
	};
	class ACE_Actions {
		class ACE_MainActions {
			class ACPL_ACEGetAmmo_GetAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo";
				condition = "_target getvariable ['ace_rearm_currentsupply', 0] > 0";
				statement = "";
				insertChildren = "_this call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
				exceptions[] = {"isNotInside"};
			};
			
			class ACPL_ACEGetAmmo_CheckAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_CheckAmmo";
				condition = "_target getvariable ['ace_rearm_currentsupply', 0] > 0";
				statement = "[_target] call ACPL_ACEGetAmmo_fnc_getammo_action_checkammo;";
			};
		};
	};
};

class ThingX;
class ReammoBox_F: ThingX {
	class ACE_Actions {
		class ACE_MainActions {
			class ACPL_ACEGetAmmo_GetAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo";
				condition = "_target getvariable ['ace_rearm_currentsupply', 0] > 0";
				statement = "";
				insertChildren = "_this call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
			};
			
			class ACPL_ACEGetAmmo_CheckAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_CheckAmmo";
				condition = "_target getvariable ['ace_rearm_currentsupply', 0] > 0";
				statement = "[_target] call ACPL_ACEGetAmmo_fnc_getammo_action_checkammo;";
			};
		};
	};
};