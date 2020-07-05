params [
	["_unit", ObjNull], 
	["_pos", [0,0,0]],
	["_reseted", 0]
];

// When unit did not move then fix stucked unit
if (speed _unit <= 0) then {
	_unit doMove _pos;
	_reseted = _reseted + 1;
};

// If stuck for 10 sec then exit function
if (_reseted > 9) exitwith {
	[_unit] call ACPL_MM_Core_fnc_DoStop_Prepare;
	_unit setvariable ["ACPL_MM_DoStop_Busy", false];
};

// If unit is on the position on close enought then stop the unit
if (
	_unit distance _pos < 2 || 
	(
		_unit distance _pos < 5 && 
		_reseted > 2
	)
) exitwith {
	[_unit] call ACPL_MM_Core_fnc_DoStop_Prepare;
	_unit setvariable ["ACPL_MM_DoStop_Busy", false];
};

// call function again
[{_this call ACPL_MM_Core_fnc_DoStop_DoMove}, [_unit, _pos, _reseted], 1] call CBA_fnc_waitAndExecute;