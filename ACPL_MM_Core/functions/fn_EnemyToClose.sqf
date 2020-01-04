params ["_unit", "_side", "_distance"];

private _return = false;

private _enemies = [_side] call ACPL_MM_Core_fnc_EnemyToClose;

private _objects = nearestObjects [_unit, ["Man"], _distance];

{
	if ((side _x) in _enemies) then {
		_return = true;
	};
} foreach _objects;