params [
	["_unit", ObjNull],
	["_chance", 30],
	["_distance", 150]
];

private _random = random 100;
if (
	_random < _chance && 
	(_unit findNearestEnemy _unit) distance _unit < _distance
) exitwith {true};

false