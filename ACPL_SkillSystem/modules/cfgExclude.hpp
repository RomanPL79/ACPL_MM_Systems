class ACPL_SkillSystem_exclude_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_SkillSystem";
	displayName = "$STR_ACPL_SkillSystem_exclude_module";
	function = "ACPL_SkillSystem_fnc_Exclude";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class ModuleDescription: ModuleDescription {
	description = "$STR_ACPL_SkillSystem_exclude_module_desc";
	sync[] = {};
	};
};