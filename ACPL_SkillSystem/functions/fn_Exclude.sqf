params [
	["_logic", objNull],
	["_synch", []],
	["_activated", false]
];

if (!isserver || !_activated) exitwith {};

{_x setvariable ["ACPL_SkillSystem_Excluded", true]} foreach _synch;

deletevehicle _logic;