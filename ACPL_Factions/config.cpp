class CfgPatches {
  class ACPL_Factions {
    units[] = {
		ACPL_Factions_B_Rifleman_Base,
		ACPL_Factions_B_RiflemanAT_Base,
		ACPL_Altis_Army_Rifleman,
		ACPL_Altis_Army_Rifleman_Colt,
		ACPL_Altis_Army_Rifleman_Colt_s,
		ACPL_Altis_Army_RiflemanAT,
		ACPL_Altis_Army_RiflemanAT_Colt,
		ACPL_Altis_Army_RiflemanAT_Colt_s
	};
    weapons[] = {};
    requiredVersion = 0;
    requiredAddons[] = {a3_characters_F, a3_characters_f_beta, a3_characters_f_gamma};
	
    version = 2;
    versionStr = "BETA-1";
    author = "[ACPL] Roman";
    authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
  };
};

#define mag_2(a) a, a
#define mag_3(a) a, a, a
#define mag_4(a) a, a, a, a
#define mag_5(a) a, a, a, a, a
#define mag_6(a) a, a, a, a, a, a
#define mag_7(a) a, a, a, a, a, a, a
#define mag_8(a) a, a, a, a, a, a, a, a
#define mag_9(a) a, a, a, a, a, a, a, a, a
#define mag_10(a) a, a, a, a, a, a, a, a, a, a
#define mag_11(a) a, a, a, a, a, a, a, a, a, a, a
#define mag_12(a) a, a, a, a, a, a, a, a, a, a, a, a

#include "cfgFactionClasses.hpp"

class cfgVehicles
{
	class B_Soldier_base_F;
	
	class ACPL_Factions_B_Rifleman_Base: B_Soldier_base_F
	{
		author = "[ACPL] Roman";									// The name of the author of the asset, which is displayed in the editor.
		scope = 0;													// 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).
        scopeCurator = 0;											// 2 = class is available in Zeus; 0 = class is unavailable in Zeus.
        scopeArsenal = 0;											// 2 = class is available in the Virtual Arsenal; 0 = class is unavailable in the Virtual Arsenal.
		displayName = "ACPL B Rifleman";							// The name of the soldier, which is displayed in the editor.
		cost = 200000;												// How likely the enemies attack this character among some others.
		camouflage = 1.5;											// How likely this character is spotted (smaller number = more stealthy).
        sensitivity = 2.5;											// How likely this character spots enemies when controlled by AI.
        threat[] = {1, 0.2, 0.2};										// Multiplier of the cost of the character in the eyes of soft, armoured and air enemies.
        model = "\A3\Characters_F\BLUFOR\b_soldier_01.p3d";			// The path to the model this character uses.
		canDeactivateMines = false;									// Can this character deactivate mines?
        engineer = false;											// Can this character repair vehicles?
        attendant = 0;												// Can this character heal soldiers?
		icon="iconMan";
		role="Rifleman";
	};
	
	class ACPL_Factions_B_RiflemanAT_Base: B_Soldier_base_F
	{
		author = "[ACPL] Roman";									// The name of the author of the asset, which is displayed in the editor.
		scope = 0;													// 2 = class is available in the editor; 1 = class is unavailable in the editor, but can be accessed via a macro; 0 = class is unavailable (and used for inheritance only).
        scopeCurator = 0;											// 2 = class is available in Zeus; 0 = class is unavailable in Zeus.
        scopeArsenal = 0;											// 2 = class is available in the Virtual Arsenal; 0 = class is unavailable in the Virtual Arsenal.
		displayName = "ACPL B Rifleman AT";							// The name of the soldier, which is displayed in the editor.
		cost = 205000;												// How likely the enemies attack this character among some others.
		camouflage = 1.5;											// How likely this character is spotted (smaller number = more stealthy).
        sensitivity = 2.5;											// How likely this character spots enemies when controlled by AI.
        threat[] = {1, 0.5, 0.2};										// Multiplier of the cost of the character in the eyes of soft, armoured and air enemies.
        model = "\A3\Characters_F\BLUFOR\b_soldier_01.p3d";			// The path to the model this character uses.
		canDeactivateMines = false;									// Can this character deactivate mines?
        engineer = false;											// Can this character repair vehicles?
        attendant = 0;												// Can this character heal soldiers?
		icon="iconManAT";
		role="MissileSpecialist";
	};
	
    #include "Altis_Army\cfgSoldiers.hpp"
};