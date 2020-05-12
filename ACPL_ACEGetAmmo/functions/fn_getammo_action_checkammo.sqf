params [
	["_target", ObjNull]
];

private _status = _target getVariable ["ace_rearm_currentsupply", 0];
private _text = (localize "STR_ACPL_ACEGetAmmo_GetAmmo_hint" + str(_status));

hint _text;