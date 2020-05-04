params [
	["_unit", ObjNull],
	["_type", "PRIMARY"]
];

private _DoubleWeapons = count (_unit getvariable ["ACPL_DoubleWeapons_data", []]) > 0;
private _DoubleWeapons_type = (_unit getvariable ["ACPL_DoubleWeapons_data", []]) select 0;

if (_DoubleWeapons && _DoubleWeapons_type != _type && !([_unit, _DoubleWeapons_type] call ACPL_DoubleWeapons_fnc_check_freeSpace) && _type != "GET") exitwith {
	//add hint about no free space to add weapon
};

if (_DoubleWeapons && _type == "GET" && !([_unit, _DoubleWeapons_type] call ACPL_DoubleWeapons_fnc_check_freeSpace)) exitwith {
	//add info about no free space to get weapon
};

private _data = [];
private _weaponItems = weaponsItems _unit;

switch (_type) do {
	case "PRIMARY": {
		private _t_weap = "PRIMARY";
		private _c_weap = primaryWeapon _unit;

		_data = [_c_weap, _weaponItems] call ACPL_DoubleWeapons_fnc_check_WeaponsItems;

		private _weap = [_t_weap, _data];
		[_unit, _weap, _DoubleWeapons] call ACPL_DoubleWeapons_fnc_manage_SetWeapon;
	};
	case "SECONDARY": {
		private _t_weap = "PRIMARY";
		private _c_weap = primaryWeapon _unit;

		_data = [_c_weap, _weaponItems] call ACPL_DoubleWeapons_fnc_check_WeaponsItems;

		private _weap = [_t_weap, _data];
		[_unit, _weap, _DoubleWeapons] call ACPL_DoubleWeapons_fnc_manage_SetWeapon;
	};
	case "GET": {

	};
};