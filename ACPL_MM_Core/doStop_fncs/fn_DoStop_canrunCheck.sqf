params ["_unit"];

private _return = false;

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

if (isNil {_unit getvariable "ACPL_MM_Core_DoStop_canrun_random"}) then {
	private _canrun_random = random 100;
	
	_unit setvariable ["ACPL_MM_Core_DoStop_canrun_random", _canrun_random, true];
	
	[_unit] spawn {
		params ["_unit"];
		
		sleep 10;
		
		_unit setvariable ["ACPL_MM_Core_DoStop_canrun_random", Nil, true];
	};
};

private _chance = _unit getvariable ["ACPL_MM_Core_DoStop_canrun_chance", 30, true];
private _random = random 100;
private _distance = _unit getvariable ["ACPL_MM_Core_DoStop_canrun_distance", 100, true];
private _side = side _unit;

if ((_chance > _random) && ([_unit, _side, _distance] call ACPL_MM_Core_fnc_EnemyToClose)) then {
	_return = true;
};

_return