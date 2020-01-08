if (!isserver) exitwith {};

if (isNil "ACPL_MM_Core_Medicaments_Excluded") then {ACPL_MM_Core_Medicaments_Excluded = [];};

if (missionNamespace getVariable ["acpl_medical", false]) then {
	acpl_medical = false;
	acpl_medical_AI = false;
};

[2000,30,false,200000,300000,200000,false,false,false] execvm "ACPL_MM_Core\zbe_cache\main.sqf";

[false] remoteExec ["enableDynamicSimulationSystem",0,true];

if (isNil "ACPL_MM_Core_TakenPos") then {ACPL_MM_Core_TakenPos = [];};