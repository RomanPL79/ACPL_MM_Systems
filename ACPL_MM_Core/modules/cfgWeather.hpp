class ACPL_MM_Core_Weather_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_MissionModules";
	displayName = "$STR_ACPL_MM_Core_Weather_module";
	function = "ACPL_MM_Core_fnc_WeatherLoop";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_Weather_random {
			displayName = "$STR_ACPL_MM_Core_Weather_module_random";
			property = "ACPL_MM_Core_Weather_random";
			description = "$STR_ACPL_MM_Core_Weather_module_random_desc";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class ACPL_MM_Core_Weather_changetime_min {
			displayName = "$STR_ACPL_MM_Core_Weather_module_changetime_min";
			property = "ACPL_MM_Core_Weather_changetime_min";
			description = "$STR_ACPL_MM_Core_Weather_module_changetime_desc";
			typeName = "NUMBER";
			defaultValue = 10;
		};
		class ACPL_MM_Core_Weather_changetime_max {
			displayName = "$STR_ACPL_MM_Core_Weather_module_changetime_max";
			property = "ACPL_MM_Core_Weather_changetime_max";
			description = "$STR_ACPL_MM_Core_Weather_module_changetime_desc";
			typeName = "NUMBER";
			defaultValue = 60;
		};
		class ACPL_MM_Core_Weather_overcast_min {
			displayName = "$STR_ACPL_MM_Core_Weather_module_overcast_min";
			property = "ACPL_MM_Core_Weather_overcast_min";
			description = "$STR_ACPL_MM_Core_Weather_module_overcast_desc";
			typeName = "NUMBER";
			defaultValue = 0;
		};
		class ACPL_MM_Core_Weather_overcast_max {
			displayName = "$STR_ACPL_MM_Core_Weather_module_overcast_max";
			property = "ACPL_MM_Core_Weather_overcast_max";
			description = "$STR_ACPL_MM_Core_Weather_module_overcast_desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
		class ACPL_MM_Core_Weather_rain_min {
			displayName = "$STR_ACPL_MM_Core_Weather_module_rain_min";
			property = "ACPL_MM_Core_Weather_rain_min";
			description = "$STR_ACPL_MM_Core_Weather_module_rain_desc";
			typeName = "NUMBER";
			defaultValue = 0;
		};
		class ACPL_MM_Core_Weather_rain_max {
			displayName = "$STR_ACPL_MM_Core_Weather_module_rain_max";
			property = "ACPL_MM_Core_Weather_rain_max";
			description = "$STR_ACPL_MM_Core_Weather_module_rain_desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
		class ACPL_MM_Core_Weather_fog_min {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fog_min";
			property = "ACPL_MM_Core_Weather_fog_min";
			description = "$STR_ACPL_MM_Core_Weather_module_fog_desc";
			typeName = "NUMBER";
			defaultValue = 0;
		};
		class ACPL_MM_Core_Weather_fog_max {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fog_max";
			property = "ACPL_MM_Core_Weather_fog_max";
			description = "$STR_ACPL_MM_Core_Weather_module_fog_desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
		class ACPL_MM_Core_Weather_fog_d_min {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fogdecay_min";
			property = "ACPL_MM_Core_Weather_fog_d_min";
			description = "$STR_ACPL_MM_Core_Weather_module_fogdecay_desc";
			typeName = "NUMBER";
			defaultValue = -1;
		};
		class ACPL_MM_Core_Weather_fog_d_max {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fogdecay_max";
			property = "ACPL_MM_Core_Weather_fog_d_max";
			description = "$STR_ACPL_MM_Core_Weather_module_fogdecay_desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
		class ACPL_MM_Core_Weather_fog_a_min {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fogbase_min";
			property = "ACPL_MM_Core_Weather_fog_a_min";
			description = "$STR_ACPL_MM_Core_Weather_module_fogbase_desc";
			typeName = "NUMBER";
			defaultValue = -5000;
		};
		class ACPL_MM_Core_Weather_fog_a_max {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fogbase_max";
			property = "ACPL_MM_Core_Weather_fog_a_max";
			description = "$STR_ACPL_MM_Core_Weather_module_fogbase_desc";
			typeName = "NUMBER";
			defaultValue = 5000;
		};
		class ACPL_MM_Core_Weather_thunder_min {
			displayName = "$STR_ACPL_MM_Core_Weather_module_thunder_min";
			property = "ACPL_MM_Core_Weather_thunder_min";
			description = "$STR_ACPL_MM_Core_Weather_module_thunder_desc";
			typeName = "NUMBER";
			defaultValue = 0;
		};
		class ACPL_MM_Core_Weather_thunder_max {
			displayName = "$STR_ACPL_MM_Core_Weather_module_thunder_max";
			property = "ACPL_MM_Core_Weather_thunder_max";
			description = "$STR_ACPL_MM_Core_Weather_module_thunder_desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Weather_module_desc";
		sync[] = {};
	};
};