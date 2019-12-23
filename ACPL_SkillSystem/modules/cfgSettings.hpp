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
		class WEST_Acc {
			displayName = "WEST Accuracy";
			property = "ACPL_SkillSystem_WEST_Acc";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class WEST_Shake {
			displayName = "WEST Aim Shake";
			property = "ACPL_SkillSystem_WEST_Shake";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class WEST_Speed {
			displayName = "WEST Aim Speed";
			property = "ACPL_SkillSystem_WEST_Speed";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class WEST_Spot {
			displayName = "WEST Spotting Distance";
			property = "ACPL_SkillSystem_WEST_Spot";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class WEST_Time {
			displayName = "WEST Spotting Time";
			property = "ACPL_SkillSystem_WEST_Time";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class WEST_General {
			displayName = "WEST General";
			property = "ACPL_SkillSystem_WEST_General";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class WEST_Courage {
			displayName = "WEST Courage";
			property = "ACPL_SkillSystem_WEST_Courage";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class WEST_Reload {
			displayName = "WEST Reloading Time";
			property = "ACPL_SkillSystem_WEST_Reload";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
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
		class EAST_Acc {
			displayName = "EAST Accuracy";
			property = "ACPL_SkillSystem_EAST_Acc";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class EAST_Shake {
			displayName = "EAST Aim Shake";
			property = "ACPL_SkillSystem_EAST_Shake";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class EAST_Speed {
			displayName = "EAST Aim Speed";
			property = "ACPL_SkillSystem_EAST_Speed";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class EAST_Spot {
			displayName = "EAST Spotting Distance";
			property = "ACPL_SkillSystem_EAST_Spot";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class EAST_Time {
			displayName = "EAST Spotting Time";
			property = "ACPL_SkillSystem_EAST_Time";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class EAST_General {
			displayName = "EAST General";
			property = "ACPL_SkillSystem_EAST_General";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class EAST_Courage {
			displayName = "EAST Courage";
			property = "ACPL_SkillSystem_EAST_Courage";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class EAST_Reload {
			displayName = "EAST Reloading Time";
			property = "ACPL_SkillSystem_EAST_Reload";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
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
		class RESISTANCE_Acc {
			displayName = "RESISTANCE Accuracy";
			property = "ACPL_SkillSystem_RESISTANCE_Acc";
			description = "$STR_ACPL_SkillSystem_settings_module_Acc";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class RESISTANCE_Shake {
			displayName = "RESISTANCE Aim Shake";
			property = "ACPL_SkillSystem_RESISTANCE_Shake";
			description = "$STR_ACPL_SkillSystem_settings_module_Shake";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class RESISTANCE_Speed {
			displayName = "RESISTANCE Aim Speed";
			property = "ACPL_SkillSystem_RESISTANCE_Speed";
			description = "$STR_ACPL_SkillSystem_settings_module_Speed";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
		class RESISTANCE_Spot {
			displayName = "RESISTANCE Spotting Distance";
			property = "ACPL_SkillSystem_RESISTANCE_Spot";
			description = "$STR_ACPL_SkillSystem_settings_module_Spot";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class RESISTANCE_Time {
			displayName = "RESISTANCE Spotting Time";
			property = "ACPL_SkillSystem_RESISTANCE_Time";
			description = "$STR_ACPL_SkillSystem_settings_module_Time";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class RESISTANCE_General {
			displayName = "RESISTANCE General";
			property = "ACPL_SkillSystem_RESISTANCE_General";
			description = "$STR_ACPL_SkillSystem_settings_module_General";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class RESISTANCE_Courage {
			displayName = "RESISTANCE Courage";
			property = "ACPL_SkillSystem_RESISTANCE_Courage";
			description = "$STR_ACPL_SkillSystem_settings_module_Courage";
			typeName = "ARRAY";
			defaultValue = [0.4, 0.6];
		};
		class RESISTANCE_Reload {
			displayName = "RESISTANCE Reloading Time";
			property = "ACPL_SkillSystem_RESISTANCE_Reload";
			description = "$STR_ACPL_SkillSystem_settings_module_Reload";
			typeName = "ARRAY";
			defaultValue = [0.2, 0.4];
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_SkillSystem_settings_module_desc";
		sync[] = {};
	};
};