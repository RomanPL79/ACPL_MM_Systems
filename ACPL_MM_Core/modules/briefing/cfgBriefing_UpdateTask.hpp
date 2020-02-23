class ACPL_MM_Core_Taskmaster_UpdateTask_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_Briefing_Category";
	displayName = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Module";
	function = "ACPL_MM_Core_fnc_shk_actualize";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 1; //Wait for triggers
	isDisposable = 0;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_Taskmaster_UpdateTask_name {
			displayName = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Spawn_Name";
			property = "ACPL_MM_Core_Taskmaster_UpdateTask_name";
			description = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Spawn_Name_desc";
			typeName = "STRING";
			defaultValue = "";
		};
		class ACPL_MM_Core_Taskmaster_UpdateTask_status {
			displayName = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Status";
			property = "ACPL_MM_Core_Taskmaster_UpdateTask_status";
			description = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Status_desc";
			typeName = "STRING";
			defaultValue = "succeeded";
			class Values
			{
				class succeeded {
					name = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Status_succeeded";
					value = "succeeded";
				};
				class failed {
					name = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Status_failed";
					value = "failed";
				};
				class canceled {
					name = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Status_canceled";
					value = "canceled";
				};
			};
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_Taskmaster_UpdateTask_Module_desc";
		sync[] = {};
	};
};