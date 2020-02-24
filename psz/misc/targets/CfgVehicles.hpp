class CfgVehicles {
	class Static;
	class PSZ_TargetBase: Static {	// TODO CHECK A3
		armor = 0.1;
		cost = 1;
		displayname = "Target";
		ladders[] = {};
		namesound = "obj_target";
		scope = 0;
		type = 0;
	};
	class PSZ_InvisibleTarget: PSZ_TargetBase {
		scope = 1;
		audible = 10;
		camouflage = 10;
		threat[] = {1,1,1};
		cost = 65535;
		icon = "\A3\data_f\Unknown_object";
		mapSize = 0.2;
		destrType = 0;
		model = "psz\misc\targets\psz_invisibletarget";
		vehicleClass = "PSZ_Misc_Targets_Invisible";
		class EventHandlers {};
	};
	class PSZ_InvisibleTarget_Infantry: PSZ_InvisibleTarget {
		displayName = "Infantry";	// TODO STR
		displayNameShort = "Infantry";	// TODO STR
	};
	class PSZ_InvisibleTarget_Infantry_O: PSZ_InvisibleTarget_Infantry {
		scope = 2;
		side = 0;
		displayName = "OPFOR Infantry";	// TODO STR
	};
	class PSZ_InvisibleTarget_Infantry_B: PSZ_InvisibleTarget_Infantry {
		scope = 2;
		side = 1;
		displayName = "BLUFOR Infantry";	// TODO STR
	};
	class PSZ_InvisibleTarget_Infantry_R: PSZ_InvisibleTarget_Infantry {
		scope = 2;
		side = 2;
		displayName = "INDEP Infantry";	// TODO STR
	};
	class PSZ_InvisibleTarget_Infantry_C: PSZ_InvisibleTarget_Infantry {
		scope = 2;
		side = 3;
		displayName = "CIVIL Infantry";	// TODO STR
	};
	class PSZ_InvisibleTarget_Laser: PSZ_InvisibleTarget {
		displayName = "Laser";	// TODO STR
		displayNameShort = "Laser";	// TODO STR
		lasertarget = 1;
	};
	class PSZ_InvisibleTarget_Laser_O: PSZ_InvisibleTarget_Laser {
		scope = 2;
		side = 0;
		displayName = "OPFOR Laser";	// TODO STR
	};
	class PSZ_InvisibleTarget_Laser_B: PSZ_InvisibleTarget_Laser {
		scope = 2;
		side = 1;
		displayName = "BLUFOR Laser";	// TODO STR
	};
	class PSZ_InvisibleTarget_Laser_R: PSZ_InvisibleTarget_Laser {
		scope = 2;
		side = 2;
		displayName = "INDEP Laser";	// TODO STR
	};
	class PSZ_InvisibleTarget_Laser_C: PSZ_InvisibleTarget_Laser {
		scope = 2;
		side = 3;
		displayName = "CIVIL Laser";	// TODO STR
	};
	class PSZ_InvisibleTarget_Wheeled: PSZ_InvisibleTarget {
		displayName = "Wheeled";	// TODO STR
		displayNameShort = "Wheeled";	// TODO STR
		armor = 500;
		irTarget = 1;
	};
	class PSZ_InvisibleTarget_Wheeled_O: PSZ_InvisibleTarget_Wheeled {
		scope = 2;
		side = 0;
		displayName = "OPFOR Wheeled";	// TODO STR
	};
	class PSZ_InvisibleTarget_Wheeled_B: PSZ_InvisibleTarget_Wheeled {
		scope = 2;
		side = 1;
		displayName = "BLUFOR Wheeled";	// TODO STR
	};
	class PSZ_InvisibleTarget_Wheeled_R: PSZ_InvisibleTarget_Wheeled {
		scope = 2;
		side = 2;
		displayName = "INDEP Wheeled";	// TODO STR
	};
	class PSZ_InvisibleTarget_Wheeled_C: PSZ_InvisibleTarget_Wheeled {
		scope = 2;
		side = 3;
		displayName = "CIVIL Wheeled";	// TODO STR
	};
	class PSZ_InvisibleTarget_Tracked: PSZ_InvisibleTarget {
		displayName = "Tracked";	// TODO STR
		displayNameShort = "Tracked";	// TODO STR
		armor = 1500;
		irTarget = 1;
	};
	class PSZ_InvisibleTarget_Tracked_O: PSZ_InvisibleTarget_Tracked {
		scope = 2;
		side = 0;
		displayName = "OPFOR Tracked";	// TODO STR
	};
	class PSZ_InvisibleTarget_Tracked_B: PSZ_InvisibleTarget_Tracked {
		scope = 2;
		side = 1;
		displayName = "BLUFOR Tracked";	// TODO STR
	};
	class PSZ_InvisibleTarget_Tracked_R: PSZ_InvisibleTarget_Tracked {
		scope = 2;
		side = 2;
		displayName = "INDEP Tracked";	// TODO STR
	};
	class PSZ_InvisibleTarget_Tracked_C: PSZ_InvisibleTarget_Tracked {
		scope = 2;
		side = 3;
		displayName = "CIVIL Tracked";	// TODO STR
	};
};
