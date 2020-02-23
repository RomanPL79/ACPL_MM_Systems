params ["_logic", "_synch", "_activated"];

if (!isserver) exitwith {};

if (isNil "ACPL_SkillSystem_Excluded") then {ACPL_SkillSystem_Excluded = [];};

ACPL_SkillSystem_Excluded = ACPL_SkillSystem_Excluded + _synch;