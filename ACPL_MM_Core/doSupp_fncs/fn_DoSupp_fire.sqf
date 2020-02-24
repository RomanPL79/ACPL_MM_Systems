params ["_unit", "_weap", "_mode", ["_veh", false], ["_turret", [0]]];

_unit setvariable ["ACPL_MM_Core_DoSupp_Done", false, true];

private _bullets = 0;
private _gun = _unit;
private _rof = (getNumber (configFile >> "cfgweapons" >> _weap >> "reloadTime"));
private _toslow = false;
private _bc = 0;

if (_rof < 0.05) then {
		_rof = 0.05;
	};
	if (_rof > 10) then {
		_rof = 10;
		_toslow = true;
};

if (_veh) then {
	_gun = vehicle _unit;
	
	_gun selectWeaponTurret [_weap, _turret];
	private _current_class = _gun currentMagazineTurret _turret;
	private _magazines = magazinesAmmoFull _gun;
	
	{
		if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
	} foreach _magazines;
};

if (_gun getvariable ["ACPL_MM_Core_Reloaded_eh", true]) then {
	_gun setvariable ["ACPL_MM_Core_Reloaded_eh", false];
	private _id = _gun addEventHandler ["Reloaded", {
		params ["_unit", "_weapon", "_muzzle", "_nmag", "_omag"];
		
		_unit setvariable ["ACPL_MM_Core_Reloaded", true, false];
	}];
};

if (_mode == "SINGLE") then {
	if (_veh && _bullets == 1) then {
		_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, false];
	};
	
	[_gun, _weap] call BIS_fnc_fire;
	
	sleep 0.1;
	
	_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
} else {
	switch (_mode) do {
		case "BURST": {_bc = 3;};
		case "BURST_R": {_bc = random [2, 3, 5];};
		case "FULLAUTO": {_bc = random [5, 10, 30];};
	};
	
	if (_toslow && _veh) then {
		_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
		_bc = 1;
	} else {
		if (_bc <= _bullets) then {
			_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
			_bc = _bullets;
		};
	};
	
	for "_i" from 1 to _bc do {
		[_gun, _weap] call BIS_fnc_fire;
		sleep _rof;
	};
	
	if (_unit getvariable ["ACPL_MM_Core_DoSupp_Reload", false]) then {
		WaitUntil {sleep 1;(_gun getvariable ["ACPL_MM_Core_Reloaded", false])};
		
		_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true];
		_gun setvariable ["ACPL_MM_Core_DoSupp_Reloaded", false];
	};
	
	sleep 0.1;
	
	_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
};