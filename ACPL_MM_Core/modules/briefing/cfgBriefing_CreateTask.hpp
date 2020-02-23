class ACPL_MM_Core_Taskmaster_CreateTask_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_Briefing_Category";
	displayName = "$STR_ACPL_MM_Core_Taskmaster_CreateTask_Module";
	function = "ACPL_MM_Core_fnc_shk_createNew";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 1; //Wait for triggers
	isDisposable = 0;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_Taskmaster_CreateTask_name {
			displayName = "$STR_ACPL_MM_Core_Spawner_Spawn_Name";
			property = "ACPL_MM_Core_Taskmaster_CreateTask_name";
			description = "$STR_ACPL_MM_Core_Spawner_Spawn_Name_desc";
			typeName = "STRING";
			defaultValue = "";
		};
		class ACPL_MM_Core_Taskmaster_CreateTask_title {
			displayName = "$STR_ACPL_MM_Core_Spawner_Spawn_Title";
			property = "ACPL_MM_Core_Taskmaster_CreateTask_title";
			description = "$STR_ACPL_MM_Core_Spawner_Spawn_Title_desc";
			typeName = "STRING";
			defaultValue = "";
		};
		class ACPL_MM_Core_Taskmaster_CreateTask_desc {
			displayName = "$STR_ACPL_MM_Core_Spawner_Spawn_Desc";
			property = "ACPL_MM_Core_Taskmaster_CreateTask_desc";
			description = "$STR_ACPL_MM_Core_Spawner_Spawn_Desc_desc";
			typeName = "STRING";
			defaultValue = "";
		};
		class ACPL_MM_Core_Taskmaster_CreateTask_side {
			displayName = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Side";
			property = "ACPL_MM_Core_Taskmaster_CreateTask_status";
			description = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Side_desc";
			typeName = "STRING";
			defaultValue = "ALL";
			class Values
			{
				class all {
					name = "ALL";
					value = "ALL";
				};
				class WEST {
					name = "WEST";
					value = "WEST";
				};
				class EAST {
					name = "EAST";
					value = "EAST";
				};
				class RESISTANCE {
					name = "RESISTANCE";
					value = "RESISTANCE";
				};
				class CIV {
					name = "CIVILIAN";
					value = "CIV";
				};
				class SYNCH {
					name = "SYNCHRONIZED";
					value = "SYNCH";
				};
			};
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Taskmaster_CreateTask_Module_desc";
		sync[] = {};
	};
};