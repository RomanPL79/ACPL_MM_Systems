params [
	["_unit", ObjNull],
	["_holder", ObjNull],
	["_dummy", ObjNull],
	["_type", ""],
	["_class", ""],
	["_queued", false]
];

// Plays animation for the unit
[_unit, "PutDown"] remoteExec ["playAction",0];

// Checks type
switch (_type) do {
	case "HELMET": {
		_unit addHeadgear _class;
	};
	case "NVG": {
		_unit linkItem _class;
	};
	case "WEAPON": {
		_class params [
			["_weaponClass", ""],
			["_attachments", []]
		];

		_unit addweapon _weaponClass;
		{_unit addWeaponItem [_weaponClass, _x];} foreach _attachments;
	};
	case "CONTAINER": {
		_class params [
			["_weaponClass", ""],
			["_attachments", []]
		];

		_unit addweapon _weaponClass;
		{_unit addWeaponItem [_weaponClass, _x];} foreach _attachments;
	};
};

// Sending info about unit not being busy
_unit setVariable ["ACPL_LooseHelmet_Busy", false, true];
_holder setVariable ["ACPL_LooseHelmet_WH_reserved", false, true];

// If DoStop activated then go back to position
if (_unit getVariable ["ACPL_MM_DoStop", false] && !_queued) then {
	private _pos = _unit getVariable ["ACPL_MM_Core_DoStop_pos", (getPosATL _unit)];
	[_unit, _pos] call ACPL_MM_Core_fnc_DoStop_DoMove;
};

// If container then exiting
if (_type == "CONTAINER") exitwith {};

// Deleting weaponHolder and dummy
deleteVehicle _holder;
deleteVehicle _dummy;