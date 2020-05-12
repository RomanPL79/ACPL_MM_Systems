params [
	["_unit", ObjNull],
	["_distance", 2000]
];

private _return = false;

if (behaviour _unit == "COMBAT" || !isNull (assignedTarget _unit) || (currentCommand _unit in ["ATTACK", "FIRE", "ATTACKFIRE", "Suppress"])) then {
	_return = true
} else {
	private _side = side _unit;
	private _enemy = [_side] call ACPL_MM_Core_fnc_CheckEnemy;
	private _objects = nearestObjects [_unit, ["Man"], _distance];

	{
		if (side _x in _enemy) then {
			if (_unit knowsAbout (vehicle _x) > 1) exitwith {true};
		};
	} foreach _objects;
};

_return