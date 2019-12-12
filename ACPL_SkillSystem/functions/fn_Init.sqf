if (!isserver) exitwith {};

//Looks for script version of SkillSystem and if it's loaded disable it

if (missionNamespace getVariable ["acpl_msc", false]) then {
	publicvariable "acpl_msc";
	acpl_msc = false;
};

//Saying that addon is enabled

ACPL_SkillSystem_Excluded = [];