params ["_unit"];

private _return = false;

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

private _supp = getSuppression _unit;
private _supp_2 = _unit getvariable ["ACPL_MM_Core_Supp", 0];
private _courage = _unit skill "courage";

if ((_supp > _courage) || (_supp_2 > _courage)) then {
	_return = true;
};

_return