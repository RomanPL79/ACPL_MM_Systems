/* ----------------------------------------------------------------------------
//	Function: 		ACPL_LooseHelmet_fnc_Destroyed
//
//	Description: 	Checking that object was destroyed and preventing AI and players from picking
//					it up
//
//	Parameters: 
//		- object				what object are needed to check
//		- velocity				what velocity was when item was dropped
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

params ["_objects"];

private _random = random 100;

if (isNil "ACPL_LooseHelmet_Destroyed") then {ACPL_LooseHelmet_Destroyed = [];};

if (_random < ACPL_LooseHelmet_DestroyChance) then {
	[_objects,false] remoteExec ["enablesimulation",0,true];
	ACPL_LooseHelmet_Destroyed = ACPL_LooseHelmet_Destroyed + [_objects];
};