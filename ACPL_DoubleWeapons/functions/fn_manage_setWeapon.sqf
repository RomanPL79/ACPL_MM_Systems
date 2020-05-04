params [
	["_unit", ObjNull],
	["_new_weap", []],
	["_getoldweap", false]
];

private _old_weap = [];

_unit removeWeapon ((_new_weap select 1) select 0);

if (_getoldweap) then {
	_old_weap = _unit getvariable ["ACPL_DoubleWeapons_data", []];
	[_unit, _old_weap] call ACPL_DoubleWeapons_fnc_action_addWeapon;
};

_unit setvariable ["ACPL_DoubleWeapons_data", _new_weap];
[_unit, _new_weap, _getoldweap] call ACPL_DoubleWeapon_fnc_action_showWeapon;