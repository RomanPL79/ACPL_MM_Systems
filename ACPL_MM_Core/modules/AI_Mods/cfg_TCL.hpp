class ACPL_MM_Core_AImods_TCL_Module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_AImods_Category";
	displayName = "$STR_ACPL_MM_Core_AImods_TCL_Module";
	function = "ACPL_MM_Core_fnc_TCLInit";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_AImods_TCL_Module_desc";
		sync[] = {};
	};
};