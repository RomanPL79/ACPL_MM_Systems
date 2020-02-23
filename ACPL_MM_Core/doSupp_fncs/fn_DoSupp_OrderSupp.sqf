params ["_unit", ["_duration", 60], ["_density", "BURST"]];

if (!isserver) exitwith {};

private _starttime = time;
private _endtime = _starttime + _duration;

_unit setvariable ["ACPL_MM_Core_DoSupp_Enabled", true, true];
_unit setvariable ["ACPL_MM_Core_DoSupp_end", _endtime, true];
_unit setvariable ["ACPL_MM_Core_DoSupp_density", _density, true];

[_unit] spawn ACPL_MM_Core_fnc_DoSupp;

waitUntil {sleep 1;((time > _endtime) || !(_unit getvariable ["ACPL_MM_Core_DoSupp_Enabled", false]) || !(alive _unit))};

_unit setvariable ["ACPL_MM_Core_DoSupp_Enabled", false, true];