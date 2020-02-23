class ACPL_MM_Core_Convoy_Create_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_CreateConvoy_Category";
	displayName = "$STR_ACPL_MM_Core_Convoy_Create_Module";
	function = "ACPL_MM_Core_fnc_Convoy_Create";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 1; //Wait for triggers
	isDisposable = 0;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_Convoy_Create_speed {
			displayName = "$STR_ACPL_MM_Core_Convoy_Create_speed";
			property = "ACPL_MM_Core_Convoy_Create_speed";
			description = "$STR_ACPL_MM_Core_Convoy_Create_speed_desc";
			typeName = "NUMBER";
			defaultValue = 50;
		};
		class ACPL_MM_Core_Convoy_Create_separation {
			displayName = "$STR_ACPL_MM_Core_Convoy_Create_separation";
			property = "ACPL_MM_Core_Convoy_Create_separation";
			description = "$STR_ACPL_MM_Core_Convoy_Create_separation_desc";
			typeName = "NUMBER";
			defaultValue = 100;
		};
		class ACPL_MM_Core_Convoy_Create_push {
			displayName = "$STR_ACPL_MM_Core_Convoy_Create_push";
			property = "ACPL_MM_Core_Convoy_Create_push";
			description = "$STR_ACPL_MM_Core_Convoy_Create_push_desc";
			typeName = "BOOL";
			defaultValue = 1;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Convoy_Create_Module_desc";
		sync[] = {};
	};
};