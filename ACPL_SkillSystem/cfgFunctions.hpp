class ACPL_SkillSystem {
	tag = "ACPL_SkillSystem";
	class Functions {
		file = "ACPL_SkillSystem\functions";
		
		//[_unit] call ACPL_SkillSystem_fnc_SetSkill;
		class SetSkill {};
		
		//[] call ACPL_SkillSystem_fnc_ReloadAll
		class ReloadAll {};
		
		//[] call ACPL_SkillSystem_fnc_NewSettings
		class NewSettings {};
		
		//[] call ACPL_SkillSystem_fnc_CBAsettings_changed
		class CBASettings_changed {};
		
		//[] call ACPL_SkillSystem_fnc_Exclude
		class Exclude {};
	};
};