params ["_unit"];

private _return = false;

if ([_unit] call ACPL_MM_Core_fnc_DoStop_isBusy) exitWith {false};

if (([_unit] call ACPL_MM_Core_fnc_isInCombat)) then {
	private _target = assignedTarget _unit;
	if (isNull _target || (currentCommand _unit in ["ATTACK", "Suppress", "ATTACKFIRE", "FIRE"] && [_unit, "VIEW", _target] checkVisibility [eyePos _unit, eyePos _target] < 0.1)) then {
		_return = false;
	} else {
		private _building = _unit getvariable ["ACPL_MM_Core_DoStop_building", Nil];

		private _positions = [_building] call BIS_fnc_buildingPositions;
		
		if (isNil "_building" && count [_building] call BIS_fnc_buildingPositions > 0) then {
			_buildings = ((nearestObjects [_unit, ["House", "Building"], 50]) select {count [_x] call BIS_fnc_buildingPositions > 0});
			if (count _buildings == 0) exitwith {false};
			_building = buildings select 0;
			_unit setvariable ["ACPL_MM_Core_DoStop_building", _building];
			_positions = [_building] call BIS_fnc_buildingPositions;
		};
		
		if ((getposATL _unit) distance (_unit getvariable "ACPL_MM_Core_DoStop_startPos") > 2) then {
			_positions = _positions + [(_unit getvariable "ACPL_MM_Core_DoStop_startPos")];
		};
		
		private _positions_c = _positions select {!(_x in ACPL_MM_Core_TakenPos) && (count nearestObjects [_x, ["Man"], 2] == 0)};
		
		private _target = assignedTarget _unit;
		if (isNull _target) then {
			private _objects = nearestObjects [_unit, ["Man"], 2000];
			_objects select {side _unit getFriend side _x < 0.6 && _unit knowsAbout _x > 1};
			_target = _objects select floor(random(count _objects));
		};
		private _check = [_positions_c, _unit, _target] call ACPL_MM_Core_fnc_DoStop_CheckSeeEnemy_FromPos;
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