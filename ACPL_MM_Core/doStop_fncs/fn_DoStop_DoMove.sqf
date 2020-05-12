params ["_unit", "_pos"];

_unit EnableAI "PATH";
_unit setUnitPos "UP";
_unit forceWalk false;

[_unit, _pos] spawn ACPL_MM_Core_fnc_DoMove;

_unit setvariable ["ACPL_MM_Core_DoStop_DoMove", false, true];
private _time = time + 30;

WaitUntil {sleep 1;!(_unit getvariable ["ACPL_MM_Core_DoMove", false]) || (_unit distance _pos < 5 && time > _time)};

_unit setvariable ["ACPL_MM_Core_DoMove", false]);
_unit setvariable ["ACPL_MM_Core_DoStop_DoMove", true, true];

private _unitpos = _unit getvariable ["ACPL_MM_Core_DoStop_pos", "UP"];

_unit DisableAI "PATH";
_unit setUnitPos _unitpos;
_unit forceWalk true;