params ["_unit"];

private _return = false;

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

private _nexttime = _unit getvariable ["ACPL_MM_Core_DoStop_Roam_NextTime", 0];

if (!([_unit] call ACPL_MM_Core_fnc_isInCombat)) then {
	if (time > _nexttime) then {
		private _random = random [60, 300, 600];
	
		_nexttime = time + _random;
		_unit setvariable ["ACPL_MM_Core_DoStop_Roam_NextTime", _nexttime, true];
		
		private _building = _unit getvariable ["ACPL_MM_Core_DoStop_building", ObjNull];
		
		if (isNull _building) then {
			_building = ((nearestObjects [_unit, ["House", "Building"], 50]) select 0);
			_unit setvariable ["ACPL_MM_Core_DoStop_building", _building];
		};
		
		private _positions = [_building] call BIS_fnc_buildingPositions;
		
		if ((getposATL _unit) distance (_unit getvariable "ACPL_MM_Core_DoStop_startPos") > 2) then {
			_positions = _positions + [(_unit getvariable "ACPL_MM_Core_DoStop_startPos")];
		};
		
		private _positions_c = [_positions] call ACPL_MM_Core_fnc_CheckTakenPos;
		
		if ((count _positions_c) > 0) then {
			_return = true;
			
			_unit setvariable ["ACPL_MM_Core_DoStop_PPL_Roam", _positions_c, true];
		} else {
			_unit setvariable ["ACPL_MM_Core_DoStop_PPL_Roam", [], true];
		};
	};
};

_return