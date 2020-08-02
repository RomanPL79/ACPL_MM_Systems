class Land;
class LandVehicle: Land {
	class ACPL_ACEgetAmmo {
		value = 0;
	};
	class ACE_SelfActions {
		class ACPL_ACEGetAmmo_GetAmmo {
			displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo";
			condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgMagazines' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
			statement = "";
			insertChildren = "[_this # 0, _this # 1] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
			exceptions[] = {"isNotInside"};
		};
			
		class ACPL_ACEGetAmmo_CheckAmmo {
			displayName = "$STR_ACPL_ACEGetAmmo_CheckAmmo";
			condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgMagazines' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
			statement = "[_target] call ACPL_ACEGetAmmo_fnc_getammo_action_checkammo;";
			exceptions[] = {"isNotInside"};
		};

		class ACPL_ACEGetAmmo_Vehicle {
			displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo_Vehicle";
			condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgMagazines' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
			exceptions[] = {"isNotInside"};
			statement = "";
			insertChildren = "[_this # 0, _this # 1, true] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
		};
	};
	class ACE_Actions {
		class ACE_MainActions {
			class ACPL_ACEGetAmmo_GetAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo";
				condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgMagazines' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
				statement = "";
				insertChildren = "[_this # 0, _this # 1] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
				exceptions[] = {"isNotInside"};
			};
			
			class ACPL_ACEGetAmmo_CheckAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_CheckAmmo";
				condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgMagazines' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
				statement = "[_target] call ACPL_ACEGetAmmo_fnc_getammo_action_checkammo;";
			};

			class ACPL_ACEGetAmmo_Vehicle {
				displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo_Vehicle";
				condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgVehicles' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
				exceptions[] = {"isNotInside"};
				statement = "";
				insertChildren = "[_this # 0, _this # 1, true] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
			};
		};
	};
};

class Air;
class Helicopter: Air {
	class ACPL_ACEgetAmmo {
		value = 0;
	};
	class ACE_SelfActions {
		class ACPL_ACEGetAmmo_GetAmmo {
			displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo";
			condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || ((getNumber (configfile >> 'CfgVehicles' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0)";
			statement = "";
			insertChildren = "[_this # 0, _this # 1] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
			exceptions[] = {"isNotInside"};
		};
			
		class ACPL_ACEGetAmmo_CheckAmmo {
			displayName = "$STR_ACPL_ACEGetAmmo_CheckAmmo";
			condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgVehicles' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
			statement = "[_target] call ACPL_ACEGetAmmo_fnc_getammo_action_checkammo;";
			exceptions[] = {"isNotInside"};
		};

		class ACPL_ACEGetAmmo_Vehicle {
			displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo_Vehicle";
			condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgVehicles' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
			exceptions[] = {"isNotInside"};
			statement = "";
			insertChildren = "[_this # 0, _this # 1, true] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
		};
	};
	class ACE_Actions {
		class ACE_MainActions {
			class ACPL_ACEGetAmmo_GetAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo";
				condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgVehicles' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
				statement = "";
				insertChildren = "[_this # 0, _this # 1] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
				exceptions[] = {"isNotInside"};
			};
			
			class ACPL_ACEGetAmmo_CheckAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_CheckAmmo";
				condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgVehicles' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
				statement = "[_target] call ACPL_ACEGetAmmo_fnc_getammo_action_checkammo;";
			};

			class ACPL_ACEGetAmmo_Vehicle {
				displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo_Vehicle";
				condition = "_target getvariable ['acpl_acegetammo_value', 0] != 0 || (getNumber (configfile >> 'CfgVehicles' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value')) != 0";
				exceptions[] = {"isNotInside"};
				statement = "";
				insertChildren = "[_this # 0, _this # 1, true] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
			};
		};
	};
};

class ThingX;
class ReammoBox_F: ThingX {
	class ACPL_ACEgetAmmo {
		value = 50;
	};
	class ACE_Actions {
		class ACE_MainActions {
			class ACPL_ACEGetAmmo_GetAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_GetAmmo";
				condition = "_target getvariable ['acpl_acegetammo_value', 0] > 0";
				statement = "";
				insertChildren = "[_this # 0, _this # 1] call ACPL_ACEGetAmmo_fnc_getammo_action_createchildren";
			};
			
			class ACPL_ACEGetAmmo_CheckAmmo {
				displayName = "$STR_ACPL_ACEGetAmmo_CheckAmmo";
				condition = "_target getvariable ['acpl_acegetammo_value', 0] > 0";
				statement = "[_target] call ACPL_ACEGetAmmo_fnc_getammo_action_checkammo;";
			};
		};
	};
};

