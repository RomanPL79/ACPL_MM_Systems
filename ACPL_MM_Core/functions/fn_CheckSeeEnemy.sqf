params ["_eye", "_unit", ["_specified", false], ["_enemy", ObjNull]];

private _return = false;

private _side = side _unit;
private _enemy = [_side] call ACPL_MM_Core_fnc_CheckEnemy;
private _objects = [];
if (_specified) then {
	_objects = [_enemy];
} else {
	_objects = nearestObjects [_unit, ["Man"], 2000];
};

{
	private _eyepos = eyepos _x;
	
	if ((side _x) in _enemy) then {
		if ([_eye, _eyepos] call ACPL_MM_Core_fnc_CheckVisFrom) then {
			_return = true;
		};
	};
} foreach _objects;

_return