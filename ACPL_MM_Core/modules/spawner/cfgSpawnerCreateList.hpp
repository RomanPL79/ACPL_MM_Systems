class ACPL_MM_Core_Spawner_CreateList_Module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_Spawner_Category";
	displayName = "$STR_ACPL_MM_Core_Spawner_CreateList_Module";
	function = "ACPL_MM_Core_fnc_Spawner_CreateList";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_Spawner_CreateList_DisableGear {
			displayName = "$STR_ACPL_MM_Core_Spawner_CreateList_DisableGear";
			property = "ACPL_MM_Core_Spawner_CreateList_DisableGear";
			description = "$STR_ACPL_MM_Core_Spawner_CreateList_DisableGear_desc";
			typeName = "BOOL";
			defaultValue = 1;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Spawner_CreateList_Module_desc";
		sync[] = {};
	};
};