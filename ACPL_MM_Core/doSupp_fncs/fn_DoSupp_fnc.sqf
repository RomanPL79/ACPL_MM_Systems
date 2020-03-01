params ["_unit", "_list"];

if (isNil "ACPL_MM_Core_BeeingSuppressed") then {ACPL_MM_Core_BeeingSuppressed = [];};

_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", true, true];

private _time = _unit getvariable ["ACPL_MM_Core_DoSupp_end", (time + 20)];
private _density = _unit getvariable ["ACPL_MM_Core_DoSupp_density", "BURST"];
private _lastweapon = _unit getvariable ["ACPL_MM_Core_DoSupp_LastWeapon", ""];

private _check = [];
{
	private _x_0 = _x select 0;
	
	if (!(_x_0 in ACPL_MM_Core_BeeingSuppressed)) then {
		_check = _check + [_x];
	};
} foreach _list;

if (!((count _check) == (count _list)) && !(count _check == 0)) then {
	_list = _check;
};

private _random = _list select floor(random(count _list));
private _target = _random select 0;
private _target_pos = getposATL _target;
private _positions = _random select 1;

private _targets = [];

for "_i" from 0 to 9 do {
	private _pos = [((random [0,10,20]) * ([1, -1] select floor(random 2))),((random [0,10,20]) * ([1, -1] select floor(random 2))), ((random [0,2,5]) * ([1, -1] select floor(random 2)))];
	
	_targets = _targets + [_pos];
};

ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed + [_target];

_unit setVariable ["VCOM_NOAI",true];
_unit setVariable ["Vcm_Disable",true];
_unit setvariable ["TCL_Disabled",true];
_unit setVariable ["lambs_danger_disableAI",true];

private _vehicle = false;
private _gunner = false;

private _typeof = typeof _target;

if (vehicle _unit != _unit) then {
	_vehicle = true;
	
	if (gunner (vehicle _unit) == _unit) then {
		_gunner = true;
	};
};

private _angle = [_unit, _target] call {
	params ["_unit", "_target"];
	
	private _return = 0;
	
	private _vd = (getpos _target) vectorDiff (getpos _unit);
	private _angle = (_vd select 0) atan2 (_vd select 1);
	
	if (_angle < 0) then {
		_angle = _angle * -1;
	};
	
	_return = _angle;
	
	_return
};

private _wait = _angle / 30;

private _distance = _unit distance _target;
if (_distance < 20) exitwith {
	ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed - [_target];
	
	_unit setVariable ["VCOM_NOAI",false];
	_unit setVariable ["Vcm_Disable",false];
	_unit setvariable ["TCL_Disabled",false];
	_unit setVariable ["lambs_danger_disableAI",false];
};


if (_vehicle) then {
	if (_gunner) then {
		if (_distance > 20 && _distance < 300) then {
			_unit setvariable ["ACPL_MM_Core_DoSupp_density", "FULLAUTO", true];
			_density = "FULLAUTO";
		};
		if (_distance > 300 && _distance < 900) then {
			_unit setvariable ["ACPL_MM_Core_DoSupp_density", "BURST", true];
			_density = "BURST";
		};
		if (_distance > 900) then {
			_unit setvariable ["ACPL_MM_Core_DoSupp_density", "SINGLE", true];
			_density = "SINGLE";
		};
		
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
		if (_lastweapon in _weapons) then {_currentWeapon = _lastweapon};
		_unit setvariable ["ACPL_MM_Core_DoSupp_LastWeapon", _currentWeapon];
		
		private _config = (getArray (configFile >> "cfgweapons" >> _currentWeapon >> "modes"));
		private _modes = [];
		{
			_modes = _modes + [toUpper(_x)];
		} foreach _config;
		private _firemode = "";
		
		switch (_density) do {
			case "SINGLE": {
				_firemode = "SINGLE";
			};
			case "BURST": {
				_firemode = "BURST_R";
			};
			case "FULLAUTO": {
				_firemode = "FULLAUTO";
			};
		};
		
		if (_firemode == "") then {_firemode = "SINGLE";};
		
		_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", true, true];
		
		_shot = _targets select floor(random(count _targets));
		private _dummy = "ACPL_MM_Core_InvisibleTarget" createVehicle [0,0,0];
		private _pos = _target modelToWorld _shot;
		_dummy setpos _pos;
		_dummy allowdamage false;
		
		_unit reveal [_dummy, 4];
		_unit doTarget _dummy;
		
		_unit disableAI "AUTOTARGET";
		_veh disableAI "AUTOTARGET";
		//_unit disableAI "TARGET";
		
		sleep _wait;
		_time = _time + _wait;
		
		while {(alive _unit) && (time < _time) && (_unit getvariable ["ACPL_MM_Core_DoSupp_FSM", false])} do {
			if (_unit getvariable ["ACPL_MM_Core_DoSupp_Reload", false]) then {
				
				_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", false, true];
				
				_weapons = _weapons - [_currentWeapon];
				_weapons pushback _currentWeapon;
				
				_currentWeapon = _weapons select 0;
				_unit setvariable ["ACPL_MM_Core_DoSupp_LastWeapon", _currentWeapon];
			};
			
			sleep 0.1;
			
			[_unit, _currentWeapon, _firemode, true, _turret] spawn ACPL_MM_Core_fnc_DoSupp_fire;
			
			WaitUntil {sleep 0.1;_unit getvariable ["ACPL_MM_Core_DoSupp_Done", false]};
			
			deletevehicle _dummy;
			
			_shot = _targets select floor(random(count _targets));
			_dummy = "ACPL_MM_Core_InvisibleTarget" createVehicle [0,0,0];
			
			private _shooter_lof = eyepos _unit;
			
			if (([_unit, "VIEW", _dummy] checkVisibility [_shooter_lof, eyepos _target]) > 0) then {
				_pos = _target modelToWorld _shot;
				_dummy setpos _pos;
			} else {
				_pos = _target_pos;
				_pos set [0, (_pos select 0) + (_shot select 0)];
				_pos set [1, (_pos select 1) + (_shot select 1)];
				_pos set [2, (_pos select 2) + (_shot select 2)];
				_dummy setposATL _pos;
			};
			
			_pos = _target modelToWorld _shot;
			_dummy setpos _pos;
			_dummy allowdamage false;
			
			_unit reveal [_dummy, 4];
			_unit doTarget _dummy;
			
			sleep (random [0.25, 0.6, 2]);
		};
		
		_unit lookAt objNull;
		_unit doWatch objNull;
		
		_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", false, true];
		
		_veh forcespeed 99999;
		_unit enableAI "AUTOTARGET";
		_veh enableAI "AUTOTARGET";
		//_unit enableAI "TARGET";
		
		deletevehicle _dummy;
	};
} else {
	if (_distance > 20 && _distance < 150) then {
		_unit setvariable ["ACPL_MM_Core_DoSupp_density", "FULLAUTO", true];
		_density = "FULLAUTO";
	};
	if (_distance > 150 && _distance < 400) then {
		_unit setvariable ["ACPL_MM_Core_DoSupp_density", "BURST", true];
		_density = "BURST";
	};
	if (_distance > 400) then {
		_unit setvariable ["ACPL_MM_Core_DoSupp_density", "SINGLE", true];
		_density = "SINGLE";
	};
	
	private _position = "AUTO";
	
	private _weapons = weapons _unit;
	private _p_weap = primaryweapon _unit;
	private _s_weap = secondaryweapon _unit;
	private _h_weap = handgunweapon _unit;
	
	private _weap = "";
	
	if (_p_weap in _weapons) then {
		_weap = _p_weap;
	} else {
		if (_s_weap in _weapons) then {
			_weap = _s_weap;
		} else {
			if (_h_weap in _weapons) then {
				_weap = _h_weap;
			} else {
				if (true) exitwith {
					_unit lookAt objNull;
					_unit doWatch objNull;
						
					_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", false, true];
						
					_unit forcespeed 99999;
					
					ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed - [_target];
					
					_unit setVariable ["VCOM_NOAI",false];
					_unit setVariable ["Vcm_Disable",false];
					_unit setvariable ["TCL_Disabled",false];
					_unit setVariable ["lambs_danger_disableAI",false];
				};
			};
		};
	};
	
	private _config = (getArray (configFile >> "cfgweapons" >> _weap >> "modes"));
	private _modes = [];
	
	{
		_modes = _modes + [toUpper(_x)];
	} foreach _config;
	
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
	
	[_unit, _position] spawn ACPL_MM_Core_fnc_DoSupp_StayInPos;
	
	_unit forcespeed 0;
	
	private _firemode = "";
	
	switch (_density) do {
		case "SINGLE": {
			_firemode = "SINGLE";
		};
		case "BURST": {
			if ("BURST" in _modes) then {
				_firemode = "BURST";
			} else {
				if ("FULLAUTO" in _modes) then {
					_firemode = "BURST_R";
				};
			};
		};
		case "FULLAUTO": {
			if ("FULLAUTO" in _modes) then {
				_firemode = "FULLAUTO";
			} else {
				_firemode = "SINGLE";
			};
		};
	};
	
	if (_firemode == "") then {_firemode = "SINGLE";};
	
	_shot = _targets select floor(random(count _targets));
	private _dummy = "ACPL_MM_Core_InvisibleTarget" createVehicle [0,0,0];
	private _pos = _target modelToWorld _shot;
	_dummy setpos _pos;
	_dummy allowdamage false;
	
	_unit setBehaviour "COMBAT";
	
	_unit lookAt objNull;
	_unit doWatch objNull;
	_unit doWatch _dummy;
	_unit lookAt _dummy;
	_unit lookAt _dummy;
	_unit doTarget _dummy;
	_unit doTarget _dummy;
	
	//_unit disableAI "AUTOTARGET";
	_unit disableAI "TARGET";
	
	_wait = _wait / 2;
		
	sleep _wait;
	_time = _time + _wait;
	
	_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", true, true];
	sleep 0.5;
	
	while {(alive _unit) && (time < _time) && (_unit getvariable ["ACPL_MM_Core_DoSupp_FSM", false])} do {
		if (_unit getvariable ["ACPL_MM_Core_DoStop_Reloading", false]) then {
			waitUntil {sleep 0.1;!(_unit getvariable ["ACPL_MM_Core_DoStop_Reloading", false])};
		};
		
		[_unit, _weap, _firemode] spawn ACPL_MM_Core_fnc_DoSupp_fire;
			
		WaitUntil {sleep 0.1;_unit getvariable ["ACPL_MM_Core_DoSupp_Done", false]};
		
		deletevehicle _dummy;
		
		sleep (random [0.5, 1, 2]);
		
		_shot = _targets select floor(random(count _targets));
		
		_dummy = "ACPL_MM_Core_InvisibleTarget" createVehicle [0,0,0];
		
		private _shooter_lof = eyepos _unit;
		_shooter_lof set [2, (_shooter_lof select 2) - 0.2];
		
		if (([_unit, "VIEW", _dummy] checkVisibility [_shooter_lof, eyepos _target]) > 0) then {
			_pos = _target modelToWorld _shot;
			_dummy setpos _pos;
		} else {
			_pos = _target_pos;
			_pos set [0, (_pos select 0) + (_shot select 0)];
			_pos set [1, (_pos select 1) + (_shot select 1)];
			_pos set [2, (_pos select 2) + (_shot select 2)];
			_dummy setposATL _pos;
		};
		
		_dummy allowdamage false;
		
		_unit doWatch _dummy;
		_unit lookAt _dummy;
		_unit lookAt _dummy;
		_unit doTarget _dummy;
		_unit doTarget _dummy;
	};
	
	_unit lookAt objNull;
	_unit doWatch objNull;
		
	_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", false, true];
		
	_unit forcespeed 99999;
	//_unit enableAI "AUTOTARGET";
	_unit enableAI "TARGET";
	
	deletevehicle _dummy;
	
	_unit setBehaviour "AWARE";
};

_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", false, true];

ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed - [_target];

_unit setVariable ["VCOM_NOAI",false];
_unit setVariable ["Vcm_Disable",false];
_unit setvariable ["TCL_Disabled",false];
_unit setVariable ["lambs_danger_disableAI",false];