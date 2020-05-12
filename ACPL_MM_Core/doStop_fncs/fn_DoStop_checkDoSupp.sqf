params ["_unit"];

private _return = false;

if (currentCommand _unit in ["ATTACK", "Suppress", "ATTACKFIRE", "FIRE"]) then {

	private _list = [_unit] call ACPL_MM_Core_fnc_DoSupp_ListAvaibleTargets;
	_unit setvariable ["ACPL_MM_Core_DoSupp_CustomTarget", _list];
	
	if (count _list > 0) then {_return = true};
};

_return