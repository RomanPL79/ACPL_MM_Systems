if (!isserver) exitwith {};

ACPL_SkillSystem_Excluded = [];

//Looks for script version of SkillSystem and if it's loaded disable it

if (missionNamespace getVariable ["acpl_msc", false]) then {
	publicvariable "acpl_msc";
	acpl_msc = false;
	
	[] call ACPL_SkillSystem_fnc_mscCopy;
};