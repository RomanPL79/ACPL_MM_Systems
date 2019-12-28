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
		class custom_Acc_min {
			displayName = "Accuracy (min)";
			property = "ACPL_SkillSystem_custom_Acc_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class custom_Acc_max {
			displayName = "Accuracy (max)";
			property = "ACPL_SkillSystem_custom_Acc_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class custom_Shake_min {
			displayName = "Aim Shake (min)";
			property = "ACPL_SkillSystem_custom_Shake_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class custom_Shake_max {
			displayName = "Aim Shake (max)";
			property = "ACPL_SkillSystem_custom_Shake_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class custom_Speed_min {
			displayName = "Aim Speed (min)";
			property = "ACPL_SkillSystem_custom_Speed_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class custom_Speed_max {
			displayName = "Aim Speed (max)";
			property = "ACPL_SkillSystem_custom_Speed_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class custom_Spot_min {
			displayName = "Spotting Distance (min)";
			property = "ACPL_SkillSystem_custom_Spot_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class custom_Spot_max {
			displayName = "Spotting Distance (max)";
			property = "ACPL_SkillSystem_custom_Spot_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class custom_Time_min {
			displayName = "Spotting Time (min)";
			property = "ACPL_SkillSystem_custom_Time_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class custom_Time_max {
			displayName = "Spotting Time (max)";
			property = "ACPL_SkillSystem_custom_Time_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class custom_General_min {
			displayName = "General (min)";
			property = "ACPL_SkillSystem_custom_General_min";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class custom_General_max {
			displayName = "General (max)";
			property = "ACPL_SkillSystem_custom_General_max";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class custom_Courage_min {
			displayName = "Courage (min)";
			property = "ACPL_SkillSystem_custom_Courage_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class custom_Courage_max {
			displayName = "Courage (max)";
			property = "ACPL_SkillSystem_custom_Courage_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class custom_Reload_min {
			displayName = "Reloading Time (min)";
			property = "ACPL_SkillSystem_custom_Reload_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class custom_Reload_max {
			displayName = "Reloading Time (max)";
			property = "ACPL_SkillSystem_custom_Reload_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_SkillSystem_custom_settings_module_desc";
		sync[] = {};
	};
};