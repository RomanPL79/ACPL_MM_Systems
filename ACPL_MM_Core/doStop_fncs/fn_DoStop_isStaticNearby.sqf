params ["_unit"];

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

private _return = false;

private _objects = nearestObjects [_unit, ["StaticWeapon", "Static", "Static Weapon"], 50];
private _checked = [];

{
	private _gunner = gunner _x;
	private _reserved = _x getvariable ["ACPL_MM_Core_Static_Reserved", false];
	private _reserved_unit = _x getvariable ["ACPL_MM_Core_Static_Reserved_Unit", Nil];
	private _noammo = _x getvariable ["ACPL_MM_Core_Static_noammo", false];
	
	if ((isNull _gunner) && (!(_reserved) || !(alive _reserved_unit)) && !(_noammo)) then {
		_checked = _checked + [_x];
	};
} foreach _objects;

if (count _checked > 0) then {
	_return = true;
	
	_unit setvariable ["ACPL_DoStop_MM_Core_DoStop_Static", _checked, true];
};

_return