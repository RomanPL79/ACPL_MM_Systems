params [
	["_unit", ObjNull],
	["_distance", 20]
];

private _side = side _unit;
private _inveh = false;

if (!(vehicle _unit isEqualTo _unit)) then {_inveh = true;};

private _valid_units = [];
private _units = [];

if (_inveh) then {
	_units = crew (vehicle _unit);
	_units = _units - [_unit];
} else {
	_units = nearestObjects [_unit, ["Man"], _distance];
};

{
	private _wounded_var = _x getvariable ["ace_medical_bodypartdamage", [0]];
	private _wounded = 0;
	{_wounded = _wounded + _x;} foreach _wounded_var;
	if (side _x == _side && _wounded > 0) then {
		_valid_units pushback _x;
	};
} foreach _units;

_valid_units