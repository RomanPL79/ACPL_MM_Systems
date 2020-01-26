params ["_unit", "_distance"];

private _return = false;

private _players = allPlayers;

private _objects = nearestObjects [_unit, ["Man"], _distance];

{
	if (_x in _players) then {
		_return = true;
	};
} foreach _objects;

_return