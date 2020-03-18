class ACPL_MM_Core_zbecache_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_MissionModules";
	displayName = "$STR_ACPL_MM_Core_zbecache_module";
	function = "ACPL_MM_Core_fnc_zbecache_module";
	functionPriority = 100;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_zbecache_distance {
			displayName = "$STR_ACPL_MM_Core_zbecache_module_distance";
			property = "ACPL_MM_Core_zbecache_distance";
			description = "$STR_ACPL_MM_Core_zbecache_module_distance_desc";
			typeName = "NUMBER";
			defaultValue = 2000;
		};
		class ACPL_MM_Core_zbecache_frames {
			displayName = "$STR_ACPL_MM_Core_zbecache_module_frames";
			property = "ACPL_MM_Core_zbecache_frames";
			description = "$STR_ACPL_MM_Core_zbecache_module_frames_desc";
			typeName = "NUMBER";
			defaultValue = -1;
		};
		class ACPL_MM_Core_zbecache_debug {
			displayName = "$STR_ACPL_MM_Core_zbecache_module_debug";
			property = "ACPL_MM_Core_zbecache_debug";
			description = "$STR_ACPL_MM_Core_zbecache_module_debug_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_zbecache_distance_car {
			displayName = "$STR_ACPL_MM_Core_zbecache_module_distance_car";
			property = "ACPL_MM_Core_Weather_overcast_min";
			description = "$STR_ACPL_MM_Core_zbecache_module_distance_car_desc";
			typeName = "NUMBER";
			defaultValue = 2500;
		};
		class ACPL_MM_Core_zbecache_distance_air {
			displayName = "$STR_ACPL_MM_Core_zbecache_module_distance_air";
			property = "ACPL_MM_Core_Weather_overcast_max";
			description = "$STR_ACPL_MM_Core_zbecache_module_distance_air_desc";
			typeName = "NUMBER";
			defaultValue = 3000;
		};
		class ACPL_MM_Core_zbecache_distance_boat {
			displayName = "$STR_ACPL_MM_Core_zbecache_module_distance_boat";
			property = "ACPL_MM_Core_Weather_rain_min";
			description = "$STR_ACPL_MM_Core_zbecache_module_distance_boat_desc";
			typeName = "NUMBER";
			defaultValue = 2000;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_zbecache_module_desc";
		sync[] = {};
	};
};