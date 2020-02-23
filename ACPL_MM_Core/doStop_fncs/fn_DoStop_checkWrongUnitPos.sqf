params ["_unit"];

private _return = false;

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

private _unitPos = _unit getvariable ["ACPL_MM_Core_DoStop_pos", "UP"];
private _unitPos_actual = UnitPos _unit;

_unitPos = toUpper _unitPos;
_unitPos_actual = toUpper _unitPos_actual;

if (_unitPos != "AUTO") then {

	if (_unitPos != _unitPos_actual) then {
		_return = true;
	};

};

_return