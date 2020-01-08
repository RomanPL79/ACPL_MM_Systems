params ["_unit", "_pos", "_unitpos"];

_unit EnableAI "PATH";
_unit setUnitPos "UP";
_unit forceWalk false;

[_unit, _pos] spawn ACPL_MM_Core_fnc_DoMove;

private _oldpos = _unit getvariable ["ACPL_MM_Core_DoStop_actPos", (getPosATL _unit)];
_unit setvariable ["ACPL_MM_Core_DoStop_actPos", _pos, true];

_unit setvariable ["ACPL_MM_Core_DoStop_DoMove", false, true];

WaitUntil {sleep 1;!(_unit getvariable ["ACPL_MM_Core_DoMove", false])};

_unit setvariable ["ACPL_MM_Core_DoStop_DoMove", true, true];

_unit setvariable ["ACPL_MM_Core_DoStop_pos", _unitpos, true];

_unit DisableAI "PATH";
_unit setUnitPos _unitpos;
_unit forceWalk true;