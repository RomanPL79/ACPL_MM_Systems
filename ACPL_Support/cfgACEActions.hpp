class LandVehicle;
class Car: LandVehicle {
	class ACE_Actions {
		class ACE_MainActions {
			class ACPL_Support_GetAmmo {
				displayName = "$STR_ACPL_Support_GetAmmo";
				condition = "_target getvariable ['ace_rearm_issupplyvehicle', false]";
				statement = "";
				insertChildren = "_this call ACPL_Support_fnc_getammo_action_createchildren";
			};
			
			class ACPL_Support_CheckAmmo {
				displayName = "$STR_ACPL_Support_CheckAmmo";
				condition = "_target getvariable ['ace_rearm_issupplyvehicle', false]";
				statement = "[_target] call ACPL_Support_fnc_getammo_action_checkammo;";
			};
		};
	};
};

class ThingX;
class ReammoBox_F: ThingX {
	class ACE_Actions {
		class ACE_MainActions {
			class ACPL_Support_GetAmmo {
				displayName = "$STR_ACPL_Support_GetAmmo";
				condition = "_target getvariable ['ace_rearm_issupplyvehicle', false]";
				statement = "";
				insertChildren = "_this call ACPL_Support_fnc_getammo_action_createchildren";
			};
			
			class ACPL_Support_CheckAmmo {
				displayName = "$STR_ACPL_Support_CheckAmmo";
				condition = "_target getvariable ['ace_rearm_issupplyvehicle', false]";
				statement = "[_target] call ACPL_Support_fnc_getammo_action_checkammo;";
			};
		};
	};
};