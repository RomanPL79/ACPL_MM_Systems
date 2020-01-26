params ["_unit", "_list"];

if (isNil "ACPL_MM_Core_BeeingSuppressed") then {ACPL_MM_Core_BeeingSuppressed = [];};

_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", true, true];

private _time = _unit getvariable ["ACPL_MM_Core_DoSupp_end", 0];
private _density = _unit getvariable ["ACPL_MM_Core_DoSupp_density", "BURST"];

private _check = [];
{
	private _x_0 = _x select 0;
	
	if (!(_x_0 in ACPL_MM_Core_BeeingSuppressed)) then {
		_check = _check + [_x];
	};
} foreach _list;

if (!(count _check) == (count _list) && !(count _check == 0)) then {
	_list = _check;
};

private _random = _list select floor(random(count _list));
private _target = _list select 0;
private _target_pos = getposATL _target;
private _positions = _list select 1;

private _targets = [];

for "_i" from 0 to 9 do {
	private _pos = [(_target_pos select 0) + (random [-10,0,10]),(_target_pos select 1) + (random [-10,0,10]),(_target_pos select 2) + (random [-2,0,2])];
	
	_targets = _targets + [_pos];
};

ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed + [_target];

private _vehicle = false;
private _gunner = false;

if (vehicle _unit != _unit) then {
	_vehicle = true;
	
	if (gunner (vehicle _unit) == _unit) then {
		_gunner = true;
	};
};

switch (_vehicle) do {
	case true: {
		if (_gunner) then {
			private _veh = vehicle _unit;
			
			_veh forcespeed 0;
			
			private _turrets = allTurrets _veh;
			private _turret = [];
			{
				if (_veh turretUnit _x == _unit) then {
					_turret = _x;
				};
			} foreach _turrets;
			
			private _weapons = _veh weaponsTurret _turret;
			private _currentWeapon = _weapons select 0;
			
			while {(alive _unit) && (time < _time) && (_unit getvariable ["ACPL_MM_Core_DoSupp", false])} do {
				private _shot = _targets select floor(random(count _targets));
				_unit lookAt objNull;
				_unit doWatch objNull;
				_unit doWatch _shot;
				_unit lookAt _shot;
				_unit lookAt _shot;
				_unit doTarget _shot;
				_unit doTarget _shot;
				
				private _shotASL = ATLToASL _shot;
				_unit doSuppressiveFire _shotASL;
				
				sleep (random [0.2, 0.5, 1]);
			};
		};
	};
	case false: {
		private _position = "AUTO";

		if ("DOWN" in _positions) then {
			_position = "DOWN";
		} else {
			if ("MIDDLE" in _positions) then {
				_position = "MIDDLE";
			} else {
				if ("UP" in _positions) then {
					_position = "UP";
				};
			};
		};

		_unit setunitpos _position;
		
		_unit forcespeed 0;
		
		while {(alive _unit) && (time < _time) && (_unit getvariable ["ACPL_MM_Core_DoSupp", false])} do {
			sleep (random [0.2, 0.4, 1]);
		};
	};
};

ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed - [_target];