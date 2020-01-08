params ["_unit"];

private _return = false;

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

private _pos = _unit getvariable ["ACPL_MM_Core_DoStop_actPos", (getPosATL _unit)];
private _actpos = getPosATL _unit;

if (_pos distance _actpos > 2) then {
	_return = true;
};

_return