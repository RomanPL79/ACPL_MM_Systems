params [
	["_unit", ObjNull]
];

private _time = time + 60;

waitUntil {sleep 1;time > _time};

if (primaryweapon _unit == "" && handgunweapon _unit == "") then {
	[_unit] spawn ACPL_LooseHelmet_fnc_LookForWeap;
};