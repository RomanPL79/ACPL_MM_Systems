params [
	["_unit", ObjNull],
	["_buildings", []]
];

if (count _buildings == 0) exitwith {};

_buildings = [_buildings, [_unit], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy;
private _building = _buildings # 0;

private _target = assignedTarget _unit;
private _positions = [_building] call BIS_fnc_buildingPositions;

_positions = _positions select {!(_x in ACPL_MM_Core_TakenPos) && (count nearestObjects [_x, ["Man"], 2] == 0)};

private _check = [_positions, _unit, _target] call ACPL_MM_Core_fnc_DoStop_check_SeeEnemy_FromPos;
private _status = _check select 0;
_positions = _check select 1;

if !(_status) exitwith {};

private _data = _positions select floor(random(count _positions));
_data params ["_pos", "_stance"];

_unit setvariable ["ACPL_MM_DoStop_Busy", true];

_unit forcewalk false;
_unit doMove _pos;
_unit EnableAI "PATH";
_unit setUnitPos "UP";
_unit setvariable ["ACPL_MM_Core_DoStop_stance", _stance];
ACPL_MM_Core_TakenPos deleteAt (ACPL_MM_Core_TakenPos find (_unit getVariable ["ACPL_MM_Core_DoStop_pos", (getposATL _unit)]));
_unit setvariable ["ACPL_MM_Core_DoStop_pos", _pos];
ACPL_MM_Core_TakenPos pushBack _pos;

[_unit, _pos] call ACPL_MM_Core_fnc_DoStop_DoMove;