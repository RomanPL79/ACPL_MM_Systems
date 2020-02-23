class ACPL_MM_Core_Custmomarker_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_MissionModules";
	displayName = "$STR_ACPL_MM_Core_Custmomarker_module";
	function = "ACPL_MM_Core_fnc_CM_add";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 1; //Wait for triggers
	isDisposable = 0;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_Custmomarker_type {
			displayName = "$STR_ACPL_MM_Core_Custmomarker_type";
			property = "ACPL_MM_Core_Custmomarker_type";
			description = "$STR_ACPL_MM_Core_Custmomarker_type_desc";
			typeName = "STRING";
			defaultValue = "building";
			class Values
			{
				class building {
					name = "$STR_ACPL_MM_Core_Custmomarker_type_building";
					value = "BUILDING";
				};
				class tree {
					name = "$STR_ACPL_MM_Core_Custmomarker_type_tree";
					value = "TREE";
				};
				class bush {
					name = "$STR_ACPL_MM_Core_Custmomarker_type_bush";
					value = "BUSH";
				};
			};
		};
		
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Custmomarker_module_desc";
		sync[] = {};
	};
};