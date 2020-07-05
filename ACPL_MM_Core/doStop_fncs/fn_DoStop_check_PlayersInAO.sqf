params [
	["_unit", ObjNull]
];

private _return = false;

{
	if (_x distance _unit < 2000) exitwith {_return = true};
} foreach allPlayers;

_return