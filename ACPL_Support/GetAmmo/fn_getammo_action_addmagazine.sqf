params [
	["_object", ObjNull],
	["_class", ""],
	["_player", ObjNull]
];

private _value = getNumber (configfile >> "CfgMagazines" >> _class >> "value");
private _ammo = _object getVariable ["ace_rearm_currentsupply", 0];

_value = (_ammo - _value);

_object setVariable ["ace_rearm_currentsupply", _value, true];

_object addmagazinecargoglobal [_class, 1];

private _text = ((getText (configFile >> "CfgMagazines" >> _x >> "displayName")) + localize "STR_ACPL_Support_GetAmmo_added");

[_text] remoteExec ["hint",_player];