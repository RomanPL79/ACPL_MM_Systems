class ACPL_SkillSystem_custom_settings_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_SkillSystem";
	displayName = "$STR_ACPL_SkillSystem_custom_settings_module";
	function = "ACPL_SkillSystem_fnc_CustomSettings";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class custom_Random {
			displayName = "Modifier";
			property = "ACPL_SkillSystem_custom_Random";
			description = "$STR_ACPL_SkillSystem_settings_module_Random";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class custom_Acc {
			displayName = "Accuracy";
			property = "ACPL_SkillSystem_custom_Acc";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class custom_Shake {
			displayName = "Aim Shake";
			property = "ACPL_SkillSystem_custom_Shake";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class custom_Speed {
			displayName = "Aim Speed";
			property = "ACPL_SkillSystem_custom_Speed";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class custom_Spot {
			displayName = "Spotting Distance";
			property = "ACPL_SkillSystem_custom_Spot";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class custom_Time {
			displayName = "Spotting Time";
			property = "ACPL_SkillSystem_custom_Time";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class custom_General {
			displayName = "General";
			property = "ACPL_SkillSystem_custom_General";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class custom_Courage {
			displayName = "Courage";
			property = "ACPL_SkillSystem_custom_Courage";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class custom_Reload {
			displayName = "Reloading Time";
			property = "ACPL_SkillSystem_custom_Reload";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_SkillSystem_custom_settings_module_desc";
		sync[] = {};
	};
};