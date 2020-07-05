params [
	["_unit", ObjNull]
];

private _return = false;

if (isNil "ACPL_MM_Core_TakenPos") then {ACPL_MM_Core_TakenPos = [];};
private _target = assignedTarget _unit;
private _targets = (_unit nearTargets 1000) select {_x select 3 > 0};

if (
	isNull _target &&
	count _targets == 0
) exitwith {false};

if (isNull _target) then {
	_target = _targets # floor(random(count _targets));
	_target = _target # 4;
	_unit doTarget _target;
};

if (
	currentCommand _unit in ["ATTACK", "Suppress", "ATTACKFIRE", "FIRE"] && 
	[_unit, "VIEW", _target] checkVisibility [eyePos _unit, eyePos _target] < 0.1
) then {
	_return = true;
} else {
	_return = false;
};

_return