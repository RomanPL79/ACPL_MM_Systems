class ACPL_MM_Core_Spawner_Spawn_Module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_Spawner_Category";
	displayName = "$STR_ACPL_MM_Core_Spawner_Spawn_Module";
	function = "ACPL_MM_Core_fnc_Spawner_Spawn";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 1; //Wait for triggers
	isDisposable = 0;
	is3DEN = 0;
	//icon = "\ACPL_MM_Core\icons\acpl_icon_ca.paa";
	class Arguments {
		class ACPL_MM_Core_Spawner_Spawn_Number_min {
			displayName = "$STR_ACPL_MM_Core_Spawner_Spawn_Number_min";
			property = "ACPL_MM_Core_Spawner_Spawn_Number_min";
			description = "$STR_ACPL_MM_Core_Spawner_Spawn_Number_desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
		class ACPL_MM_Core_Spawner_Spawn_Number_max {
			displayName = "$STR_ACPL_MM_Core_Spawner_Spawn_Number_max";
			property = "ACPL_MM_Core_Spawner_Spawn_Number_max";
			description = "$STR_ACPL_MM_Core_Spawner_Spawn_Number_desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Spawner_Spawn_Module_desc";
		sync[] = {};
	};
};