params [
	["_unit", ObjNull]
];

if !(primaryWeapon _unit != "" && handgunWeapon _unit != "" && !(_unit getvariable ["ACPL_LooseHelmet_Busy", false])) exitwith {};

[_unit] call ACPL_LooseHelmet_fnc_AI_LookForWeapon;