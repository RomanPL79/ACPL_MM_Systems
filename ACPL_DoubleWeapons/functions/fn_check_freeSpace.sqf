params [
	["_unit", ObjNull],
	["_type", ""]
];

private _return = false;

if (_type == "PRIMARY") then {
	if (primaryWeapon _unit == "") then {_return = true;};
} else {
	if (secondaryWeapon _unit == "") then {_return = true;}
};

_return