class ACPL_MM_Core_MedicalChangeRole_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core";
	displayName = "$STR_ACPL_MM_Core_MedicalChangeRole_module";
	function = "ACPL_MM_Core_fnc_MedicalChangeRole";
	functionPriority = 1;
	scope = 2;  //show in editor
	isGlobal = 0; //run on server
	isTriggerActivated  = 0; //Wait for triggers
	isDisposable = 1;
	is3DEN = 0;
	//icon = "\SkillSystem\icons\acpl_icon(.paa)";
	class Arguments {
		class ACPL_MM_Core_Medical_medic {
			displayName = "$STR_ACPL_MM_Core_CustomMedical_module_medic";
			property = "ACPL_MM_Core_Medical_e_ban";
			description = "$STR_ACPL_MM_Core_CustomMedical_module_medic_desc";
			typeName = "STRING";
			defaultValue = "nonmedic";
			class Values
			{
				class nonmedic {
					name = "$STR_ACPL_MM_Core_CustomMedical_module_medic_nonmedic";
					value = "nonmedic";
				};
				class medic {
					name = "$STR_ACPL_MM_Core_CustomMedical_module_medic_medic";
					value = "medic";
				};
				class doctor {
					name = "$STR_ACPL_MM_Core_CustomMedical_module_medic_doctor";
					value = "doctor";
				};
			};
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_MedicalChangeRole_module_desc";
		sync[] = {};
	};
};