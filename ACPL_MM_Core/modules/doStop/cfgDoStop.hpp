class ACPL_MM_Core_DoStop_module: Module_F {
	author = "[ACPL] Roman79";
	category = "ACPL_MM_Core_DoStop_Category";
	displayName = "$STR_ACPL_MM_Core_DoStop_Module_Name";
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
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_Position";
			property = "ACPL_MM_Core_DoStop_pos";
			description = "$STR_ACPL_MM_Core_DoStop_Module_Position_desc";
			typeName = "STRING";
			defaultValue = "UP";
			class Values
			{
				class up {
					name = "$STR_ACPL_MM_Core_DoStop_Module_Position_up";
					value = "UP";
				};
				class middle {
					name = "$STR_ACPL_MM_Core_DoStop_Module_Position_middle";
					value = "MIDDLE";
				};
				class down {
					name = "$STR_ACPL_MM_Core_DoStop_Module_Position_down";
					value = "DOWN";
				};
				class v_auto {
					name = "AUTO";
					value = "AUTO";
				};
			};
		};
		class ACPL_MM_Core_DoStop_duck {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_Duck";
			property = "ACPL_MM_Core_DoStop_duck";
			description = "$STR_ACPL_MM_Core_DoStop_Module_Duck_desc";
			typeName = "BOOL";
			defaultValue = 1;
		};
		class ACPL_MM_Core_DoStop_run {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_run";
			property = "ACPL_MM_Core_DoStop_run";
			description = "$STR_ACPL_MM_Core_DoStop_Module_run_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_DoStop_canrun {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_canrun";
			property = "ACPL_MM_Core_DoStop_canrun";
			description = "$STR_ACPL_MM_Core_DoStop_Module_canrun_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_DoStop_canrun_chance {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_canrun_chance";
			property = "ACPL_MM_Core_DoStop_canrun_chance";
			description = "$STR_ACPL_MM_Core_DoStop_Module_canrun_chance_desc";
			typeName = "NUMBER";
			defaultValue = 30;
		};
		class ACPL_MM_Core_DoStop_canrun_distance {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_canrun_distance";
			property = "ACPL_MM_Core_DoStop_canrun_distance";
			description = "$STR_ACPL_MM_Core_DoStop_Module_canrun_distance_desc";
			typeName = "NUMBER";
			defaultValue = 150;
		};
		class ACPL_MM_Core_DoStop_roam {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_roam";
			property = "ACPL_MM_Core_DoStop_roam";
			description = "$STR_ACPL_MM_Core_DoStop_Module_roam_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_DoStop_react {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_react";
			property = "ACPL_MM_Core_DoStop_react";
			description = "$STR_ACPL_MM_Core_DoStop_Module_react_desc";
			typeName = "BOOL";
			defaultValue = 0;
		};
		class ACPL_MM_Core_DoStop_anim {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_animation";
			property = "ACPL_MM_Core_DoStop_anim";
			description = "$STR_ACPL_MM_Core_DoStop_Module_animation_desc";
			typeName = "BOOL";
			defaultValue = 1;
		};
		class ACPL_MM_Core_DoStop_anim_list {
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_animlist";
			property = "ACPL_MM_Core_DoStop_anim_list";
			description = "$STR_ACPL_MM_Core_DoStop_Module_animlist_desc";
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
			displayName = "$STR_ACPL_MM_Core_DoStop_Module_dosupp";
			property = "ACPL_MM_Core_DoStop_dosupp";
			description = "$STR_ACPL_MM_Core_DoStop_Module_dosupp_desc";
			typeName = "BOOL";
			defaultValue = 1;
		};
	};
	class ModuleDescription: ModuleDescription {
		description = "$STR_ACPL_MM_Core_DoStop_Module_Name_desc";
		sync[] = {};
	};
};