if (isNil "ACPL_SkillSystem_Excluded") then {ACPL_SkillSystem_Excluded = [];};

private _excluded = ACPL_SkillSystem_Excluded;

if (!isserver) exitwith {};

{
	[_x] call ACPL_SkillSystem_fnc_SetSkill;
} foreach (allunits - _excluded);