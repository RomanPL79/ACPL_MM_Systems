class ACPL_MM_Core_Convoy_Destroy_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_CreateConvoy_Category";
	displayName = "$STR_ACPL_MM_Core_Convoy_Destroy_Module";
	function = "ACPL_MM_Core_fnc_Convoy_Destroy";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 1; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Convoy_Destroy_Module_desc";
		sync[] = {};
	};
};