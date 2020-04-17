class ACPL_MM_Core_zbecache_exclude_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_MissionModules";
	displayName = "$STR_ACPL_MM_Core_zbecache_exclude_module";
	function = "ACPL_MM_Core_fnc_zbecache_exclude_module";
	functionPriority = 100;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_zbecache_exclude_type {
			displayName = "$STR_ACPL_MM_Core_zbecache_exclude_type";
			property = "ACPL_MM_Core_zbecache_exclude_type";
			description = "$STR_ACPL_MM_Core_zbecache_exclude_type_desc";
			typeName = "STRING";
			defaultValue = "GROUP";
			class Values
			{
				class up {
					name = "$STR_ACPL_MM_Core_zbecache_exclude_type_group";
					value = "GROUP";
				};
				class middle {
					name = "$STR_ACPL_MM_Core_zbecache_exclude_type_unit";
					value = "UNIT";
				};
			};
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_zbecache_exclude_module_desc";
		sync[] = {};
	};
};