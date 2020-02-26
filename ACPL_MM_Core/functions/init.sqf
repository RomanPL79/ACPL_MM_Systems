if (!isserver) exitwith {};

if (missionNamespace getVariable ["acpl_medical", false]) then {
	acpl_medical = false;
	acpl_medical_AI = false;
};

[2000,30,false,200000,300000,200000,false,false,false] execvm "ACPL_MM_Core\zbe_cache\main.sqf";

[false] remoteExec ["enableDynamicSimulationSystem",0,true];

if (isNil "ACPL_MM_Core_TakenPos") then {ACPL_MM_Core_TakenPos = [];};
if (isNil "ACPL_MM_Core_BeeingSuppressed") then {ACPL_MM_Core_BeeingSuppressed = [];};
if (isNil "ACPL_MM_Core_DoStop_StaticReserved") then {ACPL_MM_Core_DoStop_StaticReserved = [];};

ACPL_MM_Core_Started = true;

[] spawn {
	sleep 2;
	
	acpl_medical = false;
	acpl_medical_AI = false;
	
	acpl_camoscript = false;
	acpl_camoscript_players = false;	
};

[] spawn {
	waitUntil {time > 5;};
	
	if (isNil "ACPL_MM_Core_Headless") then {ACPL_MM_Core_Headless = false;};
	
	if (ACPL_MM_Core_Headless) then {
		[] spawn ACPL_MM_Core_fnc_headless_givecontrol;
	};
};