class ACPL_MM_Core_CreateMedicalCentre_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_Medical_Category";
	displayName = "$STR_ACPL_MM_Core_MC_module";
	function = "ACPL_MM_Core_fnc_CreateMC";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_Medical_ban {
			displayName = "$STR_ACPL_MM_Core_Set_ban";
			property = "ACPL_MM_Core_Medical_ban";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 50;
		};
		class ACPL_MM_Core_Medical_e_ban {
			displayName = "$STR_ACPL_MM_Core_Set_e_ban";
			property = "ACPL_MM_Core_Medical_e_ban";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 30;
		};
		class ACPL_MM_Core_Medical_p_ban {
			displayName = "$STR_ACPL_MM_Core_Set_p_ban";
			property = "ACPL_MM_Core_Medical_p_ban";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 20;
		};
		class ACPL_MM_Core_Medical_atropine {
			displayName = "$STR_ACPL_MM_Core_Set_atropine";
			property = "ACPL_MM_Core_Medical_atropine";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 20;
		};
		class ACPL_MM_Core_Medical_adenosine {
			displayName = "$STR_ACPL_MM_Core_Set_adenosine";
			property = "ACPL_MM_Core_Medical_adenosine";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 20;
		};
		class ACPL_MM_Core_Medical_epinephrine {
			displayName = "$STR_ACPL_MM_Core_Set_epinephrine";
			property = "ACPL_MM_Core_Medical_epinephrine";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 40;
		};
		class ACPL_MM_Core_Medical_morphine {
			displayName = "$STR_ACPL_MM_Core_Set_morphine";
			property = "ACPL_MM_Core_Medical_morphine";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 40;
		};
		class ACPL_MM_Core_Medical_PAK {
			displayName = "$STR_ACPL_MM_Core_Set_PAK";
			property = "ACPL_MM_Core_Medical_PAK";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 5;
		};
		class ACPL_MM_Core_Medical_torniquet {
			displayName = "$STR_ACPL_MM_Core_Set_torniquet";
			property = "ACPL_MM_Core_Medical_torniquet";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 20;
		};
		class ACPL_MM_Core_Medical_plasma250 {
			displayName = "$STR_ACPL_MM_Core_Set_plasma250";
			property = "ACPL_MM_Core_Medical_plasma250";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 10;
		};
		class ACPL_MM_Core_Medical_plasma500 {
			displayName = "$STR_ACPL_MM_Core_Set_plasma500";
			property = "ACPL_MM_Core_Medical_plasma500";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 5;
		};
		class ACPL_MM_Core_Medical_plasma1 {
			displayName = "$STR_ACPL_MM_Core_Set_plasma1";
			property = "ACPL_MM_Core_Medical_plasma1";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class ACPL_MM_Core_Medical_saline250 {
			displayName = "$STR_ACPL_MM_Core_Set_saline250";
			property = "ACPL_MM_Core_Medical_saline250";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 10;
		};
		class ACPL_MM_Core_Medical_saline500 {
			displayName = "$STR_ACPL_MM_Core_Set_saline500";
			property = "ACPL_MM_Core_Medical_saline500";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 5;
		};
		class ACPL_MM_Core_Medical_saline1 {
			displayName = "$STR_ACPL_MM_Core_Set_saline1";
			property = "ACPL_MM_Core_Medical_saline1";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class ACPL_MM_Core_Medical_blood250 {
			displayName = "$STR_ACPL_MM_Core_Set_blood250";
			property = "ACPL_MM_Core_Medical_blood250";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 10;
		};
		class ACPL_MM_Core_Medical_blood500 {
			displayName = "$STR_ACPL_MM_Core_Set_blood500";
			property = "ACPL_MM_Core_Medical_blood500";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 5;
		};
		class ACPL_MM_Core_Medical_blood1 {
			displayName = "$STR_ACPL_MM_Core_Set_blood1";
			property = "ACPL_MM_Core_Medical_blood1";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class ACPL_MM_Core_Medical_quicklot {
			displayName = "$STR_ACPL_MM_Core_Set_quicklot";
			property = "ACPL_MM_Core_Medical_quicklot";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 20;
		};
		class ACPL_MM_Core_Medical_sewing {
			displayName = "$STR_ACPL_MM_Core_Set_sewing";
			property = "ACPL_MM_Core_Medical_sewing";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
		class ACPL_MM_Core_Medical_strecher {
			displayName = "$STR_ACPL_MM_Core_Set_strecher";
			property = "ACPL_MM_Core_Medical_sewing";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class ACPL_MM_Core_Medical_medicbag {
			displayName = "$STR_ACPL_MM_Core_Set_medicbag";
			property = "ACPL_MM_Core_Medical_medicbag";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class ACPL_MM_Core_Medical_bodybag {
			displayName = "$STR_ACPL_MM_Core_Set_bodybag";
			property = "ACPL_MM_Core_Medical_bodybag";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "NUMBER";
			defaultValue = 10;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_MC_module_desc";
		sync[] = {};
	};
};