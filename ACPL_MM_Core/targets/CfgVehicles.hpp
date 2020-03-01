class CfgVehicles {
	class Static;
	class ACPL_MM_Core_TargetBase: Static {	// TODO CHECK A3
		armor = 0.1;
		cost = 1;
		displayname = "Target";
		ladders[] = {};
		namesound = "obj_target";
		scope = 0;
		type = 0;
	};
	class ACPL_MM_Core_InvisibleTarget: ACPL_MM_Core_TargetBase {
		scope = 2;
		audible = 10;
		camouflage = 10;
		threat[] = {1,1,1};
		cost = 65535;
		icon = "\A3\data_f\Unknown_object";
		mapSize = 0.2;
		destrType = 0;
		model = "ACPL_MM_Core\targets\ACPL_invisibletarget";
		vehicleClass = "ACPL_MM_Core_Targets_Invisible";
		class EventHandlers {};
	};
	class ACPL_MM_Core_InvisibleTarget_Infantry: ACPL_MM_Core_InvisibleTarget {
		scope = 1;
		displayName = "Infantry";	// TODO STR
		displayNameShort = "Infantry";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Infantry_O: ACPL_MM_Core_InvisibleTarget_Infantry {
		scope = 1;
		side = 0;
		displayName = "OPFOR Infantry";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Infantry_B: ACPL_MM_Core_InvisibleTarget_Infantry {
		scope = 1;
		side = 1;
		displayName = "BLUFOR Infantry";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Infantry_R: ACPL_MM_Core_InvisibleTarget_Infantry {
		scope = 1;
		side = 2;
		displayName = "INDEP Infantry";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Infantry_C: ACPL_MM_Core_InvisibleTarget_Infantry {
		scope = 2;
		side = 3;
		displayName = "Infantry";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Laser: ACPL_MM_Core_InvisibleTarget {
		scope = 1;
		displayName = "Laser";	// TODO STR
		displayNameShort = "Laser";	// TODO STR
		lasertarget = 1;
	};
	class ACPL_MM_Core_InvisibleTarget_Laser_O: ACPL_MM_Core_InvisibleTarget_Laser {
		scope = 1;
		side = 0;
		displayName = "OPFOR Laser";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Laser_B: ACPL_MM_Core_InvisibleTarget_Laser {
		scope = 1;
		side = 1;
		displayName = "BLUFOR Laser";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Laser_R: ACPL_MM_Core_InvisibleTarget_Laser {
		scope = 1;
		side = 2;
		displayName = "INDEP Laser";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Laser_C: ACPL_MM_Core_InvisibleTarget_Laser {
		scope = 2;
		side = 3;
		displayName = "Laser";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Wheeled: ACPL_MM_Core_InvisibleTarget {
		scope = 1;
		displayName = "Wheeled";	// TODO STR
		displayNameShort = "Wheeled";	// TODO STR
		armor = 500;
		irTarget = 1;
	};
	class ACPL_MM_Core_InvisibleTarget_Wheeled_O: ACPL_MM_Core_InvisibleTarget_Wheeled {
		scope = 1;
		side = 0;
		displayName = "OPFOR Wheeled";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Wheeled_B: ACPL_MM_Core_InvisibleTarget_Wheeled {
		scope = 1;
		side = 1;
		displayName = "BLUFOR Wheeled";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Wheeled_R: ACPL_MM_Core_InvisibleTarget_Wheeled {
		scope = 1;
		side = 2;
		displayName = "INDEP Wheeled";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Wheeled_C: ACPL_MM_Core_InvisibleTarget_Wheeled {
		scope = 2;
		side = 3;
		displayName = "Wheeled";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Tracked: ACPL_MM_Core_InvisibleTarget {
		scope = 1;
		displayName = "Tracked";	// TODO STR
		displayNameShort = "Tracked";	// TODO STR
		armor = 1500;
		irTarget = 1;
	};
	class ACPL_MM_Core_InvisibleTarget_Tracked_O: ACPL_MM_Core_InvisibleTarget_Tracked {
		scope = 1;
		side = 0;
		displayName = "OPFOR Tracked";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Tracked_B: ACPL_MM_Core_InvisibleTarget_Tracked {
		scope = 1;
		side = 1;
		displayName = "BLUFOR Tracked";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Tracked_R: ACPL_MM_Core_InvisibleTarget_Tracked {
		scope = 1;
		side = 2;
		displayName = "INDEP Tracked";	// TODO STR
	};
	class ACPL_MM_Core_InvisibleTarget_Tracked_C: ACPL_MM_Core_InvisibleTarget_Tracked {
		scope = 2;
		side = 3;
		displayName = "Tracked";	// TODO STR
	};
};
