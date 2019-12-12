params ["_logic"];

if (!isserver) exitwith {};

private _units = synchronizedObjects _logic;

ACPL_SkillSystem_Excluded = ACPL_SkillSystem_Excluded + _units;