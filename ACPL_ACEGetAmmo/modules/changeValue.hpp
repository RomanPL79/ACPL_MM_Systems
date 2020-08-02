class A3_DoW_module_EnableHunger: Module_F
{
	scope = 2;
	scopeCurator = 2;
	displayName = "$STR_ACPL_ACEgetAmmo_module_name";
	// icon = "\A3_DoW\modules\hunger\data\hunger_ca.paa";
	category = "ACPL_ACEgetAmmo_modules";

	function = "ACPL_ACEgetAmmo_fnc_moduleInit";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 1;
	is3DEN = 1;

	// NEEDS TO BE ADDED!!!
	// Menu displayed when the module is placed or double-clicked on by Zeus
	// curatorInfoType = "RscDisplayAttributeModuleNuke";

	class Attributes: AttributesBase
	{
		class value: Edit
		{
			displayName = "$STR_ACPL_ACEgetAmmo_module_name";
			tooltip = "$STR_ACPL_ACEgetAmmo_module_desc";
			property = "ACPL_ACEgetAmmo_value";
			typeName = "NUMBER";
			defaultValue = 0.1;
		};
		class ModuleDescription: ModuleDescription{};
	};

	class ModuleDescription: ModuleDescription
		{
		description = "$STR_ACPL_ACEgetAmmo_module_desc";
		sync[] = {};
	};
};