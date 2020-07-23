class ACPL_LooseHelmet_Disable_Module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_LooseHelmet_Category";
	displayName = "$STR_ACPL_LooseHelmet_Module";
	function = "ACPL_LooseHelmet_fnc_DisableLooseHelmet_module";
	functionPriority = 1;
	scope = 2;  //show in editor
	scopeCurator = 2;
	isGlobal = 2; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 1;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";

	class Attributes: AttributesBase
	{
		class Enable: Checkbox
		{
			property = "ACPL_LooseHelmet_Enable";
			displayName = "$STR_ACPL_LooseHelmet_Module_State"; // Argument label
			tooltip = "$STR_ACPL_LooseHelmet_Module_State_desc"; // Tooltip description
			typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			defaultValue = 0; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_LooseHelmet_Module_desc";
		sync[] = {};
	};
};