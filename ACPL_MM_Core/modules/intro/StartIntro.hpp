class ACPL_MM_Core_Intro_Start_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_Intro_Category";
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
		class ACPL_MM_Core_Intro_JIP {
			displayName = "$STR_ACPL_MM_Core_Set_ban";
			property = "ACPL_MM_Core_Intro_JIP";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_Intro_Music {
			displayName = "$STR_ACPL_MM_Core_Set_ban";
			property = "ACPL_MM_Core_Intro_Music";
			description = "$STR_ACPL_MM_Core_Set_Meds_MC_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_MC_module_desc";
		sync[] = {};
	};
};