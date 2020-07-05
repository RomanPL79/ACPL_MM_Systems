params [
	["_unit", ObjNull],
	["_reload", false]
];

_unit setvariable ["ACPL_MM_DoStop_Busy", true];

_unit DisableAI "TARGET";
_unit DisableAI "AUTOTARGET";

if (_reload) exitwith {
	[_unit] call ACPL_MM_Core_fnc_DoStop_duck;
};

[_unit] call ACPL_MM_Core_fnc_DoStop_duck;