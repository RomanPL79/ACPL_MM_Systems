params [
	["_unit", ObjNull]
];

private _return = [];

private _objects = nearestObjects [_unit, ["WeaponHolder", "ReammoBox_F", "Car"], 50];
if (count _objects > 0) then {
	{
		private _weapons = weaponsItemsCargo _x;
		private _holder = false;
		if (_x isKindOf "WeaponHolder") then {_holder = true;};
		if (count _weapons > 0) then {_return pushback [_x, _weapons, _holder];};
	} foreach _objects;
};

_return