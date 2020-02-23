params [
	["_logic", objNull],
	["_synch", []],
	["_activated", false]
];

if (!isserver) exitwith {};

if (isNil "ACPL_SkillSystem_Excluded") then {ACPL_SkillSystem_Excluded = [];};

ACPL_SkillSystem_Excluded append _synch;