params ["_unit"];

private _statics = _unit getvariable ["ACPL_DoStop_MM_Core_DoStop_Static", []];

{
	if (_x getvariable ["ACPL_MM_Core_Static_Reserved", false]) then {_statics = _statics - [_x];};
} foreach _statics;

_unit setvariable ["ACPL_DoStop_MM_Core_DoStop_Static_Done", false, true];

if (count _statics > 0) then {
	private _random = _statics select floor(random(count _statics));
	
	if (_random getvariable ["ACPL_MM_Core_Static_Reserved", false]) then {
		_statics = _statics - [_random];
		if (count _statics > 0) then {
			_random = _statics select floor(random(count _statics));
		} else {
			_unit setvariable ["ACPL_DoStop_MM_Core_DoStop_Static_Done", true, true];
		};
	};
	
	private _actpos = _unit getvariable ["ACPL_MM_Core_DoStop_actPos", (getposATL _unit)];
	
	private _pos = getposATL _random;
	
	[_unit, _pos, "UP"] spawn ACPL_MM_Core_fnc_DoStop_ChangePos;
	
	_random setvariable ["ACPL_MM_Core_Static_Reserved", true, true];
	_random setvariable ["ACPL_MM_Core_Static_Reserved_Unit", _unit, true];
	
	WaitUntil {sleep 1;(_unit getvariable ["ACPL_MM_Core_DoStop_DoMove", false])};
	
	_unit action ["getInGunner", _random];
	
	WaitUntil {sleep 1;(gunner _random == _unit)};
	
	_unit setvariable ["ACPL_DoStop_MM_Core_DoStop_Static_Done", true, true];
	
	_random setvariable ["ACPL_MM_Core_Static_Reserved", false, true];
	_random setvariable ["ACPL_MM_Core_Static_Reserved_Unit", Nil, true];
	
	ACPL_MM_Core_TakenPos = ACPL_MM_Core_TakenPos - [_actpos];
	
	if (!(_random getvariable ["ACPL_MM_Core_DoStop_Reloaded_EH", false])) then {
		_random setvariable ["ACPL_MM_Core_DoStop_Reloaded_EH", true, true];
		_random addEventHandler ["Reloaded", {
			params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
			
			if (!((gunner _unit) in allPlayers)) then {
				[_unit,(_oldMagazine select 0)] remoteExec ["addmagazine",_unit];
			};
		}];
	};
} else {
	_unit setvariable ["ACPL_DoStop_MM_Core_DoStop_Static_Done", true, true];
};

_unit setvariable ["ACPL_DoStop_MM_Core_DoStop_Static_Done", true, true];