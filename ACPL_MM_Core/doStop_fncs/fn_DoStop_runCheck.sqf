params ["_unit"];

private _return = false;

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

private _distance = _unit getvariable ["ACPL_MM_Core_DoStop_canrun_distance", 100];
private _side = side _unit;

if ([_unit, _side, _distance] call ACPL_MM_Core_fnc_EnemyToClose) then {
	_return = true;
};

_return