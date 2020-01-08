params ["_unit"];

_unit setvariable ["ACPL_MM_Core_DoStop_Suppressed", true, true];

private _courage = _unit skill "courage";
private _modifier = 100 * _courage;
private _random = random 100;

_unit DisableAI "TARGET";
_unit DisableAI "AUTOTARGET";

if (_modifier > _random) then {
	//duck
	
	[_unit] spawn ACPL_MM_Core_fnc_DoStop_duck;
} else {
	//hide
	
	[_unit] spawn ACPL_MM_Core_fnc_DoStop_hide;
};