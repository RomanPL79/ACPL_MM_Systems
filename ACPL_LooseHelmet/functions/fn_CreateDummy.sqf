params [
	["_unit", ObjNull],
	["_pos", [0,0,0]],
	["_holder", ObjNull],
	["_attachOffset", [0,0,0]],
	["_mass", 1]
];

private _dummy = createVehicle ["ACPL_LooseHelmet_invisible_can", _pos, [], 0, "CAN_COLLIDE"];
_holder disableCollisionWith _unit;
_dummy disableCollisionWith _unit;
_dummy allowdamage false;
_dummy setmass _mass;
_holder attachTo [_dummy, _attachOffset];
_holder setVariable ["ACPL_LooseHelmet_WH_dummy", _dummy, true];

_dummy