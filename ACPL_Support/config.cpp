class CfgPatches {
	class ACPL_Support {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0;
		requiredAddons[] = {
			"ACPL_MM_Core"
		};
	
		version = 2;
		versionStr = "BETA-1";
		author = "[ACPL] Roman";
		authorUrl = "https://steamcommunity.com/groups/acpl_milsim";
	};
};

class CfgFunctions
{
	#include "CfgFunctions.hpp"
};

class Extended_PreInit_EventHandlers
{
	class ACPL_Support
	{
		init="call compile preProcessFileLineNumbers 'ACPL_Support\cba_settings.sqf'";
	};
};

class Extended_InitPost_EventHandlers
{
	class Man;
	class CAManBase: Man 
	{
		class ACPL_Support
		{
			init="params ['_unit'];[_unit] spawn ACPL_Support_fnc_medical_init;";
		};
	};
};

class cfgVehicles
{
	#include "cfgACEActions.hpp"
};