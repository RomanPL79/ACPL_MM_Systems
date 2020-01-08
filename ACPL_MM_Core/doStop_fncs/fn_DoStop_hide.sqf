params ["_unit"];

private _building = _unit getvariable ["ACPL_MM_Core_DoStop_building", Nil];
		
if (isNil "_building") then {
	_building = ((nearestObjects [_unit, ["House", "Building"], 50]) select 0);
	_unit setvariable ["ACPL_MM_Core_DoStop_building", _building];
};

private _positions = [_building] call BIS_fnc_buildingPositions;

if ((getposATL _unit) distance (_unit getvariable "ACPL_MM_Core_DoStop_startPos") > 2) then {
	_positions = _positions + [(_unit getvariable "ACPL_MM_Core_DoStop_startPos")];
};

private _positions_c = [_positions] call ACPL_MM_Core_fnc_CheckTakenPos;

private _check = [_positions_c, _unit] call ACPL_MM_Core_fnc_CheckSeeEnemy_FromPos;
_check = _check select 1;

private _check_c = [];

{
	private _data = _x select 0;
	_check_c = _check_c + [_data];
} foreach _check;

_positions_c = _positions_c - _check_c;

if (count _positions_c > 0) then {
	private _random = _positions_c select floor(random(count _positions_c));
	
	ACPL_MM_Core_TakenPos = ACPL_MM_Core_TakenPos + [_random];
	
	[_unit, _random] spawn ACPL_MM_Core_fnc_DoMove;
	
	waitUntil {sleep 1;!(_unit getvariable ["ACPL_MM_Core_DoMove", false])};
	
	_unit DisableAI "PATH";
	_unit setUnitPos "MIDDLE";
	_unit forceWalk true;
	
	while {([_unit] call ACPL_MM_Core_fnc_DoStop_checkSuppresed) && (alive _unit)} do {
		sleep 1;
	};
	
	ACPL_MM_Core_TakenPos = ACPL_MM_Core_TakenPos - [_random];
	
	_pos = _unit getvariable ["ACPL_MM_Core_DoStop_actPos", (getPosATL _unit)];

	[_unit, _pos] spawn ACPL_MM_Core_fnc_DoStop_DoMove;
	
	waitUntil {sleep 1;(_unit getvariable ["ACPL_MM_Core_DoStop_DoMove", false])};
	
	_unit setvariable ["ACPL_MM_Core_DoStop_Suppressed", false, true];
} else {
	[_unit] spawn ACPL_MM_Core_fnc_DoStop_duck;
};