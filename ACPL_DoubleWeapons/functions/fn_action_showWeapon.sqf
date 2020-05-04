params [
	["_unit", ObjNull],
	["_new_weap", []],
	["_delete", false]
];

if (_delete) then {
	private _old = _unit getVariable ["ACPL_DoubleWeapons_WH", ObjNull];

	deletevehicle _old;
};

_new_weap params [
	["_type", ""],
	["_data", ""]
];

private _weaponHolder = createVehicle ["WeaponHolderSimulated_Scripted", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit setVariable ["ACPL_DoubleWeapons_WH", _weaponHolder];
_weaponHolder setvariable ["ACPL_DoubleWeapons_disallow", true, true];
_weaponHolder addWeaponWithAttachmentsCargoGlobal [_data, 1];

_weaponHolder attachto [_unit, [0,0,0], "Pelvis"];
_weaponHolder setVectorDirAndUp [[0,0,-1],[0,1,0]];