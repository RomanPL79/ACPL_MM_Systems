params [
	["_unit", ObjNull], 
	["_velocity", [0, 0, 0]]
];

// If unit is not local or is in vehicle then exit
if (!(local _unit) || vehicle _unit != _unit || !(alive _unit)) exitwith {};

// Checks that should lose anything
private _random = random 100;
if (_random > ACPL_LooseHelmet_HelmetChance) exitwith {};

// Gets unit's headgear
private _nvg = hmd _unit;
private _helmet = headgear _unit;

// Checks conditions
if (!(_unit getvariable ["ACPL_LooseWeapon_fix_helmet", false])) then {
	// If has helmet then lose it
	if (_helmet != "") then {

		[_unit, _velocity, _helmet] call ACPL_LooseHelmet_fnc_LoseHelmet;
	};

	// If has NVG then lose it
	if (_nvg != "") then {
		[_unit, _nvg] call ACPL_LooseHelmet_fnc_LoseNVG;
	};
} else {
	// If helmet fastened and has nvgs then lose it
	if (ACPL_LooseHelmet_Enabled_Losenvgs && _nvg != "") then {
		[_unit, _nvg] call ACPL_LooseHelmet_fnc_LoseNVG;
	};
};