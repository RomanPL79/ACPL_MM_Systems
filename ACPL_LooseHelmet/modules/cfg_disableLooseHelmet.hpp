class ACPL_MM_Core_AImods_TCL_Module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_LooseHelmet_Category";
	displayName = "$STR_ACPL_LooseHelmet_Module";
	function = "ACPL_LooseHelmet_fnc_DisableLooseHelmet_module";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_LooseHelmet_Module_desc";
		sync[] = {};
	};
};