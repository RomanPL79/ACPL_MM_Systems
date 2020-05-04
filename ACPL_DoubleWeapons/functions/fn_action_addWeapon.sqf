params [
	["_unit", ObjNull],
	["_weap_data", []]
];

_weap_data params [
	["_type", ""],
	["_data", ""]
];

private _class = _data select 0;
_data = _data = [_class];

_unit addweapon _class;
{
	_unit addWeaponItem [_class, _x, true];
} foreach _data;