params [
	["_unit", ObjNull]
];

private _pos = _unit getvariable ["ACPL_MM_Core_DoStop_actPos", (getPosATL _unit)];

[_unit, _pos] spawn ACPL_MM_Core_fnc_DoStop_DoMove;
	
WaitUntil {sleep 1;!(_unit getvariable ["ACPL_MM_Core_DoMove", false])};
	
[_unit, true] spawn ACPL_MM_Core_fnc_DoStop_Prepare;