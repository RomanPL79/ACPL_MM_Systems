params [
	["_class", ""],
	["_data", []]
];

private _return = [];

{
	private _check = _x select 0;
	if (_check = _class) then {_return = _x;};
} foreach _data;

_return