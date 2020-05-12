params ["_unit", "_list"];

if (isNil "ACPL_MM_Core_BeeingSuppressed") then {ACPL_MM_Core_BeeingSuppressed = [];};

_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", true, true];

private _time = _unit getvariable ["ACPL_MM_Core_DoSupp_end", (time + 20)];
private _density = _unit getvariable ["ACPL_MM_Core_DoSupp_density", "BURST"];
private _lastweapon = _unit getvariable ["ACPL_MM_Core_DoSupp_LastWeapon", ""];

private _check = _list select {!(_x in ACPL_MM_Core_BeeingSuppressed)};

if (count _check == 0 && count _list != 0) then {
	_list = _check;
};

private _random = _list select floor(random(count _list));
private _target = _random select 0;
private _target_pos = getposATL _target;
private _positions = _random select 1;

ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed + [_target];

private _targets = [];

for "_i" from 0 to 9 do {
	private _pos = [((random [0,10,20]) * ([1, -1] select floor(random 2))),((random [0,10,20]) * ([1, -1] select floor(random 2))), ((random [0,2,5]) * ([1, -1] select floor(random 2)))];
	
	_targets = _targets + [_pos];
};

_unit setVariable ["VCOM_NOAI",true];
_unit setVariable ["Vcm_Disable",true];
_unit setvariable ["TCL_Disabled",true];
_unit setVariable ["lambs_danger_disableAI",true];

private _vehicle = false;
private _gunner = false;

private _typeof = typeof _target;

private _distance = _unit distance _target;
if (_distance < 20) exitwith {
	ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed - [_target];
	
	_unit setVariable ["VCOM_NOAI",false];
	_unit setVariable ["Vcm_Disable",false];
	_unit setvariable ["TCL_Disabled",false];
	_unit setVariable ["lambs_danger_disableAI",false];
};

private _turret = [];
private _weapons = [];
private _shooter = _unit;
private _currentWeapon = "";

if (vehicle _unit != _unit) then {
	_vehicle = true;
	
	if (gunner (vehicle _unit) == _unit) then {
		_gunner = true;

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

		private _turrets = allTurrets _veh;
		{
			if (_veh turretUnit _x == _unit) then {
				_turret = _x;
			};
		} foreach _turrets;
		_weapons = _veh weaponsTurret _turret;

		_shooter = vehicle _unit;
		_currentWeapon = _weapons select 0;
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

	if (primaryWeapon _unit != "") then {_currentWeapon = primaryweapon _unit;} else {
		if (handgunWeapon _unit != "") then {_currentWeapon = handgunWeapon _unit;} else {
			if (true) exitwith {
				ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed - [_target];
	
				_unit setVariable ["VCOM_NOAI",false];
				_unit setVariable ["Vcm_Disable",false];
				_unit setvariable ["TCL_Disabled",false];
				_unit setVariable ["lambs_danger_disableAI",false];
			};
		};
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

_shooter forcespeed 0;

private _firemode = "";
_unit setvariable ["ACPL_MM_Core_DoSupp_LastWeapon", _currentWeapon];
_lastweapon = _currentWeapon;
private _weapons = weapons _shooter;
private _modes = (getArray (configFile >> "cfgweapons" >> _currentWeapon >> "modes"));
_modes apply {toUpper _x};
private _position = "AUTO";

switch (_density) do {
	case "SINGLE": {
		_firemode = "SINGLE";
	};
	case "BURST": {
		if ("BURST" in _modes && !_vehicle) then {
			_firemode = "BURST";
		} else {
			if ("FULLAUTO" in _modes && !_vehicle) then {
				_firemode = "BURST_R";
			};
		};
	};
	case "FULLAUTO": {
		if ("FULLAUTO" in _modes && !_vehicle) then {
			_firemode = "FULLAUTO";
		} else {
			_firemode = "SINGLE";
		};
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
_shooter disableAI "AUTOTARGET";

if (!"AUTO" in _positions) then {
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
};

if (_position != "AUTO" && !_vehicle) then {
	[_unit, _position] spawn ACPL_MM_Core_fnc_DoSupp_StayInPos;
};

_unit setBehaviour "COMBAT";

sleep _wait;
_time = _time + _wait;
		
while {(alive _unit) && (time < _time) && (_unit getvariable ["ACPL_MM_Core_DoSupp_FSM", false])} do {
	if (_unit getvariable ["ACPL_MM_Core_DoSupp_Reload", false] && _gunner && count _weapons > 1) then {
				
		_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", false, true];
				
		_weapons = _weapons - [_currentWeapon];
		_weapons pushback _currentWeapon;
				
		_currentWeapon = _weapons select 0;
		_unit setvariable ["ACPL_MM_Core_DoSupp_LastWeapon", _currentWeapon];
	};
	if (_unit getvariable ["ACPL_MM_Core_DoStop_Reloading", false]) then {
		waitUntil {sleep 0.1;!(_unit getvariable ["ACPL_MM_Core_DoStop_Reloading", false])};
	};
	
	sleep 0.1;
	
	if (_gunner) then {
		[_unit, _currentWeapon, _firemode, true, _turret] spawn ACPL_MM_Core_fnc_DoSupp_fire;
	} else {
		[_unit, _weap, _firemode] spawn ACPL_MM_Core_fnc_DoSupp_fire;
	};
	
	WaitUntil {sleep 0.1;_unit getvariable ["ACPL_MM_Core_DoSupp_Done", false]};
	
	deletevehicle _dummy;
	
	_shot = _targets select floor(random(count _targets));
	_dummy = "ACPL_MM_Core_InvisibleTarget" createVehicle [0,0,0];
	
	private _shooter_lof = eyepos _shooter;
	
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

_shooter forcespeed 99999;
_unit enableAI "AUTOTARGET";
_shooter enableAI "AUTOTARGET";
//_unit enableAI "TARGET";
		
deletevehicle _dummy;

_unit setBehaviour "AWARE";

ACPL_MM_Core_BeeingSuppressed = ACPL_MM_Core_BeeingSuppressed - [_target];

_unit setVariable ["VCOM_NOAI",false];
_unit setVariable ["Vcm_Disable",false];
_unit setvariable ["TCL_Disabled",false];
_unit setVariable ["lambs_danger_disableAI",false];