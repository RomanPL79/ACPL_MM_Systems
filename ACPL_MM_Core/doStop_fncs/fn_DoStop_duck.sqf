params [
	["_unit", ObjNull],
	["_reload", false]
];

private _pos = _unit getvariable ["ACPL_MM_Core_DoStop_stance", "UP"];

if (
	!(alive _unit) ||
	(
		!([_unit] call ACPL_MM_Core_fnc_DoStop_check_Suppresed) && !_reload ||
		_reload && _unit getvariable ["ACPL_MM_DoStop_Reloaded", false]
	)
) exitwith {
	_unit setVariable ["ACPL_MM_DoStop_Reloaded", true];
	_unit setvariable ["ACPL_MM_DoStop_Busy", false];
	_unit setUnitPos _pos;
	_unit EnableAI "TARGET";
	_unit EnableAI "AUTOTARGET";
};

_pos = toUpper _pos;

switch (_pos) do {
	case "UP": {
		_unit playAction "PlayerCrouch";
		_unit setunitpos "MIDDLE";
	};
	case "MIDDLE": {
		_unit playAction "PlayerProne";
		_unit setunitpos "DOWN";
	};
	case "DOWN": {
		if (true) exitwith {
			_unit setvariable ["ACPL_MM_DoStop_Busy", false];
			_unit setVariable ["ACPL_MM_DoStop_Reloaded", true];
		};
	};
	case "AUTO": {
		_unit playAction "PlayerProne";
		_unit setunitpos "DOWN";
	};
};

[{_this call ACPL_MM_Core_fnc_DoStop_Duck;}, [_unit, _reload], 0.1] call CBA_fnc_waitAndExecute;