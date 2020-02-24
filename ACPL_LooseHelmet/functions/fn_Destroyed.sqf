/* ----------------------------------------------------------------------------
//	Function: 		ACPL_LooseHelmet_fnc_Destroyed
//
//	Description: 	Checking that object was destroyed and preventing AI and players from picking
//					it up
//
//	Parameters: 
//		- object				what object are needed to check
//
//	Returns: nothing
//
//	Author: [ACPL] Roman79
//	
//	Version: 1
//	
//	Execution: call or spawn
//
---------------------------------------------------------------------------- */

params ["_object"];

if (random 100 > ACPL_LooseHelmet_DestroyChance) exitWith {};

if (isNil "ACPL_LooseHelmet_Destroyed") then {ACPL_LooseHelmet_Destroyed = [];};
ACPL_LooseHelmet_Destroyed append _object;

[_object, false] remoteExec ["enablesimulation", 0, true];
