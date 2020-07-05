params [
	["_unit", ObjNull]
];

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

private _return = false;

private _objects = _unit nearEntities [["StaticWeapon", "Static", "Static Weapon"], 50];

_objects = _objects select {
	isNull (gunner _x) && 
	!(alive (_x getvariable ["ACPL_MM_Core_Static_Reserved", (gunner _x)])) &&
	count (magazines _x) > 0
};

if (count _objects > 0) then {
	_return = true;
};

_return