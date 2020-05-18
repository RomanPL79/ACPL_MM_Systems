params ["_unit"];

if ([_unit] call ACPL_MM_Core_fnc_DoSupp_isBusy) exitwith {};

_unit setvariable ["ACPL_MM_Core_DoStop_Reloading", true, true];

private _stance = stance _unit;
private _unitpos = _unit getvariable ["ACPL_MM_Core_DoStop_pos", "AUTO"];
private _duckpos = "";
private _duckstance = "";

switch (_stance) do {
	case "STAND": {
		_duckpos = "MIDDLE";
		_duckstance = "PlayerCrouch";
	};
	case "CROUCH": {
		_duckpos = "DOWN";
		_duckstance = "PlayerProne";
	};
	case "PRONE": {
		if (true) exitwith {
			_unit setvariable ["ACPL_MM_Core_DoStop_Reloading", false, true];
		};
	};
};

_time = time + random [3,5,6];

[_unit,_duckstance] remoteExecCall ["playAction",_unit];
[_unit,_duckpos] remoteExecCall ["setunitpos",_unit];

while {(_time > time) && (alive _unit)} do {
	if ((stance _unit) != _duckstance) then {
		[_unit,_duckstance] remoteExecCall ["playAction",_unit];
	};
	sleep 0.1;
};

_unit setvariable ["ACPL_MM_Core_DoStop_Reloading", false, true];

[_unit, _unitpos] remoteExecCall ["setunitpos",_unit];