params [
	["_unit", ObjNull],
	["_type", "SWAP"]
];

private _old_data = _unit getvariable ["ACPL_WeaponsOnBack_data", []];
private _swap = false;
private _old_type = "";
private _weap_type = _type;

if ((_type != "SWAP" && (count _old_data) > 0) || _type == "SWAP") then {
	_swap = true;
};

private _weap_data = [];

switch (_type) do {
	case "PRIMARY": {
		private _weap = primaryweapon _unit;
	};
	case "SECONDARY": {
		private _weap = secondaryweapon _unit;
	};
	case "SWAP": {
		
	};
};