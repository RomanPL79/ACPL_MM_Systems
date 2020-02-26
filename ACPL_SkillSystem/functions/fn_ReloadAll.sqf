if (!isserver) exitwith {};

{
	[_x, true] call ACPL_SkillSystem_fnc_SetSkill;
} foreach (allunits);