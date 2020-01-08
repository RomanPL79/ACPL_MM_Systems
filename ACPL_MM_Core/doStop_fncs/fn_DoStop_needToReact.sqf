params ["_unit"];

private _return = false;

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

if (([_unit] call ACPL_MM_Core_fnc_isInCombat)) then {
	private _eyepos = eyepos _unit;
	if ([_eyepos, _unit] call ACPL_MM_Core_fnc_CheckSeeEnemy) then {
		_return = false;
	} else {
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
		private _status = _check select 0;
		_positions = _check select 1;
		
		if (_status) then {
			_return = true;
			
			_unit setvariable ["ACPL_MM_Core_DoStop_PPL_React", _positions, true];
		} else {
			_unit setvariable ["ACPL_MM_Core_DoStop_PPL_React", [], true];
		};
	};
};

_return