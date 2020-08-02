params [
	["_target", ObjNull]
];

private _status = _target getVariable ["acpl_acegetammo_value", 0];
if (_status isEqualTo 0) then {
	_status = getNumber (configfile >> 'CfgVehicles' >> (typeOf _target) >> 'ACPL_ACEgetAmmo' >>'value');
	_target setVariable ["acpl_acegetammo_value", _status, true];
};
private _text = (localize "STR_ACPL_ACEGetAmmo_GetAmmo_hint" + str(_status));

hint _text;