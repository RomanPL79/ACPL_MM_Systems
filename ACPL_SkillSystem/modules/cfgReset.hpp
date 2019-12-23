class ACPL_SkillSystem_reset_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_SkillSystem";
	displayName = "$STR_ACPL_SkillSystem_reload_module";
	function = "ACPL_SkillSystem_fnc_ReloadAll";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class ModuleDescription: ModuleDescription {
	description = "$STR_ACPL_SkillSystem_reload_module_desc";
	sync[] = {};
	};
};