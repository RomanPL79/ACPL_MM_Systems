params ["_unit"];

while {([_unit] call ACPL_MM_Core_fnc_DoStop_checkSuppresed) && (alive _unit)} do {
	private _pos = _unit getvariable ["ACPL_MM_Core_DoStop_pos", "UP"];
	_pos = toUpper _pos;
	
	switch (_pos) do {
		case "UP": {
			[_unit,"PlayerCrouch"] remoteExecCall ["playAction",_unit];
			[_unit,_pos] remoteExecCall ["setunitpos",_unit];
		};
		case "MIDDLE": {
			[_unit,"PlayerProne"] remoteExecCall ["playAction",_unit];
			[_unit,_pos] remoteExecCall ["setunitpos",_unit];
		};
		case "DOWN": {
			[_unit,"PlayerProne"] remoteExecCall ["playAction",_unit];
			[_unit,_pos] remoteExecCall ["setunitpos",_unit];
		};
		case "AUTO": {
			[_unit,"PlayerProne"] remoteExecCall ["playAction",_unit];
			[_unit,_pos] remoteExecCall ["setunitpos",_unit];
		};
	};
	
	sleep 0.1;
};

_unit setvariable ["ACPL_MM_Core_DoStop_Suppressed", false, true];