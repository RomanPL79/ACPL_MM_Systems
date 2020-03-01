class ACPL_MM_Core_AImods_VCOM_Module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_AImods_Category";
	displayName = "$STR_ACPL_MM_Core_AImods_VCOM_Module";
	function = "ACPL_MM_Core_fnc_VcomInit";
	functionPriority = 1;
	scope = 0;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_AImods_VCOM_Module_desc";
		sync[] = {};
	};
};