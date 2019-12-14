if (!isserver) exitwith {};

//Inform SkillSystem is activated

publicvariable "ACPL_SkillSystem_Activated";
ACPL_SkillSystem_Activated = true;

//Defines Excluded list

ACPL_SkillSystem_Excluded = [];

//Looks for script version of SkillSystem and if it's loaded disable it

[] spawn {

	WaitUntil {sleep 1;time > 4};
	
	if (missionNamespace getVariable ["acpl_msc", false]) then {
		publicvariable "acpl_msc";
		acpl_msc = false;
		
		[] call ACPL_SkillSystem_fnc_mscCopy;
	};

};