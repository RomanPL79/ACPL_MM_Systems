if (!isserver) exitwith {};

//Inform SkillSystem is activated

ACPL_SkillSystem_Activated = true;
publicVariable "ACPL_SkillSystem_Activated";

//Defines Excluded list

ACPL_SkillSystem_Excluded = [];

//Looks for script version of SkillSystem and if it's loaded disable it

[] spawn {

	WaitUntil {sleep 1;time > 4};
	
	if (missionNamespace getVariable ["acpl_msc", false]) then {
		acpl_msc = false;
		publicVariable "acpl_msc";
		
		[] call ACPL_SkillSystem_fnc_mscCopy;
	};

};

//load settings from cba settings

[] call ACPL_SkillSystem_fnc_CBAsettings_changed;
