params [
	["_object", ObjNull],
	["_data", ""],
	["_player", ObjNull],
	["_vehicle", false]
];

_data params ["_class", "_amouth"];

private _ammo = _object getVariable ["acpl_acegetammo_value", 0];

if !(_ammo isEqualTo -1) then {
	private _value = (getNumber (configfile >> "CfgMagazines" >> _class >> "ACPL_GetAmmo" >> "cost")) * _amouth;
	_value = (_ammo - _value);

	_object setVariable ["acpl_acegetammo_value", _value, true];
};

if (_vehicle) then {
	[_object, [_class, _amouth]] remoteExecCall ["addMagazines", _object];
} else {
	_object addmagazinecargoglobal [_class, _amouth];
};

private _text = ((getText (configFile >> "CfgMagazines" >> _class >> "displayName")) + localize "STR_ACPL_ACEGetAmmo_GetAmmo_added");

hint _text;