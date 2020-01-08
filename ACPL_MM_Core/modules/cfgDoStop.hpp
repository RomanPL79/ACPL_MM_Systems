class ACPL_MM_Core_DoStop_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_MissionModules";
	displayName = "$STR_ACPL_MM_Core_MedicalChangeRole_module";
	function = "ACPL_MM_Core_fnc_DoStop_init";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_DoStop_pos {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_pos";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "STRING";
			defaultValue = "UP";
			class Values
			{
				class up {
					name = "$STR_ACPL_MM_Core_CustomMedical_module_medic_nonmedic";
					value = "UP";
				};
				class middle {
					name = "$STR_ACPL_MM_Core_CustomMedical_module_medic_medic";
					value = "MIDDLE";
				};
				class down {
					name = "$STR_ACPL_MM_Core_CustomMedical_module_medic_doctor";
					value = "DOWN";
				};
			};
		};
		class ACPL_MM_Core_DoStop_duck {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_duck";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "BOOL";
			defaultValue = 1;
		};
		class ACPL_MM_Core_DoStop_run {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_run";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_DoStop_canrun {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_canrun";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_DoStop_canrun_chance {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_canrun_chance";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "NUMBER";
			defaultValue = 30;
		};
		class ACPL_MM_Core_DoStop_canrun_distance {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_canrun_distance";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "NUMBER";
			defaultValue = 150;
		};
		class ACPL_MM_Core_DoStop_roam {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_roam";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_DoStop_react {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_react";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_DoStop_anim {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_anim";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "BOOL";
			defaultValue = 1;
		};
		class ACPL_MM_Core_DoStop_anim_list {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_anim_list";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "STRING";
			defaultValue = "STAND";
			class Values
			{
				class stand {
					name = "STAND";
					value = "STAND";
				};
				class guard {
					name = "GUARD";
					value = "GUARD";
				};
				class sit {
					name = "SIT";
					value = "SIT";
				};
			};
		};
		class ACPL_MM_Core_DoStop_dosupp {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_DoStop_dosupp";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "BOOL";
			defaultValue = 1;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_MedicalChangeRole_module_desc";
		sync[] = {};
	};
};