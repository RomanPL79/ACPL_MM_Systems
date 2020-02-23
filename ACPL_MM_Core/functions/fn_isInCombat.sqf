params ["_unit"];

private _return = false;

private _side = side _unit;
private _enemy = [_side] call ACPL_MM_Core_fnc_CheckEnemy;
private _objects = nearestObjects [_unit, ["Man"], 2000];

{
	if (side _x in _enemy) then {
		if (_unit knowsAbout (vehicle _x) > 1) then {_return = true;};
	};
} foreach _objects;

_return