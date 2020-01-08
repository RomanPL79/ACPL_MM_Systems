params ["_unit"];

private _vehicle = vehicle _unit;

_unit action ["Eject", _vehicle];

_unit setvariable ["ACPL_MM_Core_DoStop_Enabled" , false, true];

[_unit, false] call ACPL_MM_Core_fnc_DoStop_Prepare;