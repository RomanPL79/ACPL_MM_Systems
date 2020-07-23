params [
	["_unit", ObjNull], 
	["_velocity", [0,0,0]]
];

// If unit is not local then exit
if (
	!(local _unit) || 
	vehicle _unit != _unit || 
	!(alive _unit) || 
	(currentWeapon _unit == "")
) exitwith {};

// Getting info about current weapon
private _primary = currentWeapon _unit == primaryWeapon _unit;
private _class = currentWeapon _unit;
private _weaponInfo = [];
if (_class != binocular _unit) then {
	_weaponInfo = ((weaponsItems _unit) select {_x # 0 == _class}) # 0;
} else {
	_weaponInfo = [_class];
};

// If weapon is fixed and primary weapon is in hands
if (_primary && _unit getvariable ["ACPL_LooseWeapon_fix_gun",false]) exitwith {};

// Checks that should drop the weapon
private _random = random 100;
if !(_random < ACPL_LooseHelmet_WeaponChance) exitwith {};

[_unit, _weaponInfo] call ACPL_LooseHelmet_fnc_LoseWeapon;