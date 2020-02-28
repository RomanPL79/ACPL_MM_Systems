/* ----------------------------------------------------------------------------
//	Function: 		ACPL_LooseHelmet_fnc_Destroyed
//
//	Description: 	Checking that object was destroyed and preventing AI and players from picking
//					it up
//
//	Parameters: 
//		- object				what object are needed to check
//		- is destroyed?			bool
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

params [
	["_object", ObjNull],
	["_destroy", true]
];

if (_destroy) then {
	[_object, false] remoteExec ["enablesimulation", 0, true];
	
	_object setvariable ["ACPL_LooseHelmet_Destroyed", true];
} else {
	[_object, true] remoteExec ["enablesimulation", 0, true];
	
	_object setvariable ["ACPL_LooseHelmet_Destroyed", false];
};