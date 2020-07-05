params [
	["_unit", ObjNull],
	["_distance", 1000],
	["_threshold", 10]
];

if !(local _unit) exitwith {false};

private _return = false;

private _targets = _unit nearTargets _distance;

{ // forEach _targets;
	_x params ["", "", "", "_cost", "", "_certainity"];

	// TODO: Verify that certainity works OK
	if (_cost > 0 && _certainity < _threshold) exitWith {_return = true};

} forEach _targets;

_return