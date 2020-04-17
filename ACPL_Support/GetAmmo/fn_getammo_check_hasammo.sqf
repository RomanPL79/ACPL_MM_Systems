params [
	["_object", ObjNull],
	["_class", ""]
];

private _return = false;
private _value = getNumber (configfile >> "CfgMagazines" >> _class >> "value");
private _ammo = _object getVariable ["ace_rearm_currentsupply", 0];

if (_ammo >= _value) then {_return = true;};

_return