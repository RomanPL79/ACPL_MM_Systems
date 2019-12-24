class ACPL_MM_Core_Weather_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_SkillSystem";
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
		class Weather_random {
			displayName = "$STR_ACPL_MM_Core_Weather_module_random";
			property = "ACPL_MM_Core_Weather_random";
			description = "$STR_ACPL_MM_Core_Weather_module_random_desc";
			typeName = "NUMBER";
			defaultValue = 2;
		};
		class Weather_changetime {
			displayName = "$STR_ACPL_MM_Core_Weather_module_changetime";
			property = "ACPL_MM_Core_Weather_changetime";
			description = "$STR_ACPL_MM_Core_Weather_module_changetime_desc";
			typeName = "ARRAY";
			defaultValue = [10, 60];
		};
		class Weather_overcast {
			displayName = "$STR_ACPL_MM_Core_Weather_module_overcast";
			property = "ACPL_MM_Core_Weather_overcast";
			description = "$STR_ACPL_MM_Core_Weather_module_overcast_desc";
			typeName = "ARRAY";
			defaultValue = [0, 1];
		};
		class Weather_rain {
			displayName = "$STR_ACPL_MM_Core_Weather_module_rain";
			property = "ACPL_MM_Core_Weather_rain";
			description = "$STR_ACPL_MM_Core_Weather_module_rain_desc";
			typeName = "ARRAY";
			defaultValue = [0, 1];
		};
		class Weather_fog {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fog";
			property = "ACPL_MM_Core_Weather_fog";
			description = "$STR_ACPL_MM_Core_Weather_module_fog_desc";
			typeName = "ARRAY";
			defaultValue = [0, 1];
		};
		class Weather_fogdecay {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fogdecay";
			property = "ACPL_MM_Core_Weather_fog";
			description = "$STR_ACPL_MM_Core_Weather_module_fogdecay_desc";
			typeName = "ARRAY";
			defaultValue = [-1, 1];
		};
		class Weather_fogbase {
			displayName = "$STR_ACPL_MM_Core_Weather_module_fogbase";
			property = "ACPL_MM_Core_Weather_fog";
			description = "$STR_ACPL_MM_Core_Weather_module_fogbase_desc";
			typeName = "ARRAY";
			defaultValue = [-5000, 5000];
		};
		class Weather_thunders {
			displayName = "$STR_ACPL_MM_Core_Weather_module_";
			property = "ACPL_MM_Core_Weather_thunders";
			description = "$STR_ACPL_MM_Core_Weather_module_";
			typeName = "ARRAY";
			defaultValue = [0, 1];
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Weather_module_desc";
		sync[] = {};
	};
};