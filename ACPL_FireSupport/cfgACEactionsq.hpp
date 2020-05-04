class Man;
class CAManBase: Man {
	class ACE_SelfActions {
		class ACPL_FireSupport_Main {
			displayName = "$STR_ACPL_FireSupport_Menu";
			condition = "[_player] call ACPL_FireSupport_fnc_check_hasFireSupport;";
			statement = "";
			exceptions[] = {"isNotInside", "isNotSitting"};
			
			class ACPL_FireSupport_Arty {
				displayName = "$STR_ACPL_FireSupport_Artillery";
				condition = "[_player, 'ARTY'] call ACPL_FireSupport_fnc_check_hasFireSupport;";
				statement = "";
				exceptions[] = {"isNotInside", "isNotSitting"};

				class ACPL_FireSupport_Punctual {
					displayName = "$STR_ACPL_FireSupport_Artillery";
					condition = "[_player, 'ARTY'] call ACPL_FireSupport_fnc_check_hasFireSupport;";
					statement = "";
					exceptions[] = {"isNotInside", "isNotSitting"};
				};
				class ACPL_FireSupport_Linear {
					displayName = "$STR_ACPL_FireSupport_Artillery";
					condition = "[_player, 'ARTY'] call ACPL_FireSupport_fnc_check_hasFireSupport;";
					statement = "";
					exceptions[] = {"isNotInside", "isNotSitting"};
				};
				class ACPL_FireSupport_Circular {
					displayName = "$STR_ACPL_FireSupport_Artillery";
					condition = "[_player, 'ARTY'] call ACPL_FireSupport_fnc_check_hasFireSupport;";
					statement = "";
					exceptions[] = {"isNotInside", "isNotSitting"};
				};
			};

			class ACPL_FireSupport_Heli {
				displayName = "$STR_ACPL_FireSupport_Heli";
				condition = "[_player, 'HELI'] call ACPL_FireSupport_fnc_check_hasFireSupport;";
				statement = "";
				exceptions[] = {"isNotInside", "isNotSitting"};
			};

			class ACPL_FireSupport_Plane {
				displayName = "$STR_ACPL_FireSupport_Plane";
				condition = "[_player, 'PLANE'] call ACPL_FireSupport_fnc_check_hasFireSupport;";
				statement = "";
				exceptions[] = {"isNotInside", "isNotSitting"};
			};
		};
	};
};
