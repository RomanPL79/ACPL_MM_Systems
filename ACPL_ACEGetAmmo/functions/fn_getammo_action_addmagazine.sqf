params [
	["_object", ObjNull],
	["_data", ""],
	["_player", ObjNull]
];

systemchat str(_data);

_data params ["_class", "_amouth"];

private _value = (getNumber (configfile >> "CfgMagazines" >> _class >> "value")) * _amouth;
private _ammo = _object getVariable ["ace_rearm_currentsupply", 0];

_value = (_ammo - _value);

_object setVariable ["ace_rearm_currentsupply", _value, true];

_object addmagazinecargoglobal [_class, _amouth];

private _text = ((getText (configFile >> "CfgMagazines" >> _class >> "displayName")) + localize "STR_ACPL_ACEGetAmmo_GetAmmo_added");

hint _text;