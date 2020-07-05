params [
	["_unit", ObjNull],
	["_buildings", []],
	["_startPos", []]
];

private _ground = 10 > (random 100);

if (count _buildings == 0) then {_ground = true;};

private _pos = _startPos;

if (_ground) then {
	private _list = [];

	{
		private _center = position _x;
		private _box = (0 boundingBox _x) # 1;
		_list pushBack [_center, _box];
	} foreach _buildings;

	_pos = [[[_startPos, 25]], _list] call BIS_fnc_randomPos;

	_pos = [(_pos # 0), (_pos # 1), 0];
} else {
	private _building = _buildings # floor(random(count _buildings));
	private _positions = [_building] call BIS_fnc_buildingPositions;

	_positions = _positions select {!(_x in ACPL_MM_Core_TakenPos) && (count (nearestObjects [_x, ["Man"], 2]) == 0)};

	if (count _positions == 0) exitwith {_pos = [0,0];};

	_pos = _positions select floor(random(count _positions));
};

if (_pos # 0 == 0 && _pos # 1 == 0) exitwith {};

_unit setvariable ["ACPL_MM_DoStop_Busy", true];
_unit setVariable ["ACPL_MM_DoStop_Roam_LastTime", time];

_unit forcewalk true;
_unit doMove _pos;
_unit EnableAI "PATH";
_unit setUnitPos "UP";
_unit setvariable ["ACPL_MM_Core_DoStop_stance", "UP"];
ACPL_MM_Core_TakenPos deleteAt (ACPL_MM_Core_TakenPos find (_unit getVariable ["ACPL_MM_Core_DoStop_pos", (getposATL _unit)]));
_unit setvariable ["ACPL_MM_Core_DoStop_pos", _pos];
ACPL_MM_Core_TakenPos pushBack _pos;

[_unit, _pos] call ACPL_MM_Core_fnc_DoStop_DoMove;