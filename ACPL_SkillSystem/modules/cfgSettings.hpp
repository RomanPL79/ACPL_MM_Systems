class ACPL_SkillSystem_settings_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_SkillSystem";
	displayName = "$STR_ACPL_SkillSystem_settings_module";
	function = "ACPL_SkillSystem_fnc_NewSettings";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon.paa";
	class Arguments {
		class System_Enable {
			displayName = "Enable Skill System";
			property = "ACPL_SkillSystem_System_Enable";
			description = "$STR_ACPL_SkillSystem_settings_module_enable";
			typeName = "Bool";
			defaultValue = 1;
		};
		class System_Reload {
			displayName = "Enable Skill Reload";
			property = "ACPL_SkillSystem_System_Reload";
			description = "$STR_ACPL_SkillSystem_reload_func_desc";
			typeName = "Bool";
			defaultValue = 0;
		};
		class WEST_Enable {
			displayName = "WEST";
			property = "ACPL_SkillSystem_WEST_Enable";
			description = "$STR_ACPL_SkillSystem_settings_module_WEST_enable";
			typeName = "Bool";
			defaultValue = 1;
		};
		class WEST_Random {
			displayName = "WEST Modifier";
			property = "ACPL_SkillSystem_WEST_Random";
			description = "$STR_ACPL_SkillSystem_settings_module_Random";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class WEST_Acc_min {
			displayName = "WEST Accuracy (min)";
			property = "ACPL_SkillSystem_WEST_Acc_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class WEST_Acc_max {
			displayName = "WEST Accuracy (max)";
			property = "ACPL_SkillSystem_WEST_Acc_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class WEST_Shake_min {
			displayName = "WEST Aim Shake (min)";
			property = "ACPL_SkillSystem_WEST_Shake_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class WEST_Shake_max {
			displayName = "WEST Aim Shake (max)";
			property = "ACPL_SkillSystem_WEST_Shake_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class WEST_Speed_min {
			displayName = "WEST Aim Speed (min)";
			property = "ACPL_SkillSystem_WEST_Speed_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class WEST_Speed_max {
			displayName = "WEST Aim Speed (max)";
			property = "ACPL_SkillSystem_WEST_Speed_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class WEST_Spot_min {
			displayName = "WEST Spotting Distance (min)";
			property = "ACPL_SkillSystem_WEST_Spot_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class WEST_Spot_max {
			displayName = "WEST Spotting Distance (max)";
			property = "ACPL_SkillSystem_WEST_Spot_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class WEST_Time_min {
			displayName = "WEST Spotting Time (min)";
			property = "ACPL_SkillSystem_WEST_Time_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class WEST_Time_max {
			displayName = "WEST Spotting Time (max)";
			property = "ACPL_SkillSystem_WEST_Time_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class WEST_General_min {
			displayName = "WEST General (min)";
			property = "ACPL_SkillSystem_WEST_General_min";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class WEST_General_max {
			displayName = "WEST General (max)";
			property = "ACPL_SkillSystem_WEST_General_max";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class WEST_Courage_min {
			displayName = "WEST Courage (min)";
			property = "ACPL_SkillSystem_WEST_Courage_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class WEST_Courage_max {
			displayName = "WEST Courage (max)";
			property = "ACPL_SkillSystem_WEST_Courage_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class WEST_Reload_min {
			displayName = "WEST Reloading Time (min)";
			property = "ACPL_SkillSystem_WEST_Reload_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class WEST_Reload_max {
			displayName = "WEST Reloading Time (max)";
			property = "ACPL_SkillSystem_WEST_Reload_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class EAST_Enable {
			displayName = "EAST";
			property = "ACPL_SkillSystem_EAST_Enable";
			description = "$STR_ACPL_SkillSystem_settings_module_EAST_enable";
			typeName = "Bool";
			defaultValue = 1;
		};
		class EAST_Random {
			displayName = "EAST Modifier";
			property = "ACPL_SkillSystem_EAST_Random";
			description = "$STR_ACPL_SkillSystem_settings_module_Random";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class EAST_Acc_min {
			displayName = "EAST Accuracy (min)";
			property = "ACPL_SkillSystem_EAST_Acc_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class EAST_Acc_max {
			displayName = "EAST Accuracy (max)";
			property = "ACPL_SkillSystem_EAST_Acc_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class EAST_Shake_min {
			displayName = "EAST Aim Shake (min)";
			property = "ACPL_SkillSystem_EAST_Shake_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class EAST_Shake_max {
			displayName = "EAST Aim Shake (max)";
			property = "ACPL_SkillSystem_EAST_Shake_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class EAST_Speed_min {
			displayName = "EAST Aim Speed (min)";
			property = "ACPL_SkillSystem_EAST_Speed_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class EAST_Speed_max {
			displayName = "EAST Aim Speed (max)";
			property = "ACPL_SkillSystem_EAST_Speed_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class EAST_Spot_min {
			displayName = "EAST Spotting Distance (min)";
			property = "ACPL_SkillSystem_EAST_Spot_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class EAST_Spot_max {
			displayName = "EAST Spotting Distance (max)";
			property = "ACPL_SkillSystem_EAST_Spot_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class EAST_Time_min {
			displayName = "EAST Spotting Time (min)";
			property = "ACPL_SkillSystem_EAST_Time_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class EAST_Time_max {
			displayName = "EAST Spotting Time (max)";
			property = "ACPL_SkillSystem_EAST_Time_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class EAST_General_min {
			displayName = "EAST General (min)";
			property = "ACPL_SkillSystem_EAST_General_min";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class EAST_General_max {
			displayName = "EAST General (max)";
			property = "ACPL_SkillSystem_EAST_General_max";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class EAST_Courage_min {
			displayName = "EAST Courage (min)";
			property = "ACPL_SkillSystem_EAST_Courage_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class EAST_Courage_max {
			displayName = "EAST Courage (max)";
			property = "ACPL_SkillSystem_EAST_Courage_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class EAST_Reload_min {
			displayName = "EAST Reloading Time (min)";
			property = "ACPL_SkillSystem_EAST_Reload_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class EAST_Reload_max {
			displayName = "EAST Reloading Time (max)";
			property = "ACPL_SkillSystem_EAST_Reload_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class RESISTANCE_Enable {
			displayName = "RESISTANCE";
			property = "ACPL_SkillSystem_RESISTANCE_Enable";
			description = "$STR_ACPL_SkillSystem_settings_module_RESISTANCE_enable";
			typeName = "Bool";
			defaultValue = 1;
		};
		class RESISTANCE_Random {
			displayName = "RESISTANCE Modifier";
			property = "ACPL_SkillSystem_RESISTANCE_Random";
			description = "$STR_ACPL_SkillSystem_settings_module_Random";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class RESISTANCE_Acc_min {
			displayName = "RESISTANCE Accuracy (min)";
			property = "ACPL_SkillSystem_RESISTANCE_Acc_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class RESISTANCE_Acc_max {
			displayName = "RESISTANCE Accuracy (max)";
			property = "ACPL_SkillSystem_RESISTANCE_Acc_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class RESISTANCE_Shake_min {
			displayName = "RESISTANCE Aim Shake (min)";
			property = "ACPL_SkillSystem_RESISTANCE_Shake_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class RESISTANCE_Shake_max {
			displayName = "RESISTANCE Aim Shake (max)";
			property = "ACPL_SkillSystem_RESISTANCE_Shake_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class RESISTANCE_Speed_min {
			displayName = "RESISTANCE Aim Speed (min)";
			property = "ACPL_SkillSystem_RESISTANCE_Speed_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class RESISTANCE_Speed_max {
			displayName = "RESISTANCE Aim Speed (max)";
			property = "ACPL_SkillSystem_RESISTANCE_Speed_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class RESISTANCE_Spot_min {
			displayName = "RESISTANCE Spotting Distance (min)";
			property = "ACPL_SkillSystem_RESISTANCE_Spot_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class RESISTANCE_Spot_max {
			displayName = "RESISTANCE Spotting Distance (max)";
			property = "ACPL_SkillSystem_RESISTANCE_Spot_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class RESISTANCE_Time_min {
			displayName = "RESISTANCE Spotting Time (min)";
			property = "ACPL_SkillSystem_RESISTANCE_Time_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class RESISTANCE_Time_max {
			displayName = "RESISTANCE Spotting Time (max)";
			property = "ACPL_SkillSystem_RESISTANCE_Time_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class RESISTANCE_General_min {
			displayName = "RESISTANCE General (min)";
			property = "ACPL_SkillSystem_RESISTANCE_General_min";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class RESISTANCE_General_max {
			displayName = "RESISTANCE General (max)";
			property = "ACPL_SkillSystem_RESISTANCE_General_max";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class RESISTANCE_Courage_min {
			displayName = "RESISTANCE Courage (min)";
			property = "ACPL_SkillSystem_RESISTANCE_Courage_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
		class RESISTANCE_Courage_max {
			displayName = "RESISTANCE Courage (max)";
			property = "ACPL_SkillSystem_RESISTANCE_Courage_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "NUMBER";
			defaultValue = 0.6;
		};
		class RESISTANCE_Reload_min {
			displayName = "RESISTANCE Reloading Time (min)";
			property = "ACPL_SkillSystem_RESISTANCE_Reload_min";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "NUMBER";
			defaultValue = 0.2;
		};
		class RESISTANCE_Reload_max {
			displayName = "RESISTANCE Reloading Time (max)";
			property = "ACPL_SkillSystem_RESISTANCE_Reload_max";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "NUMBER";
			defaultValue = 0.4;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_SkillSystem_settings_module_desc";
		sync[] = {};
	};
};