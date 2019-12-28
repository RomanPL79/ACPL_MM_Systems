params ["_logic", "_synch", "_activated"];

if (!isserver) exitwith {};

ACPL_SkillSystem_Excluded = ACPL_SkillSystem_Excluded + _synch;