params ["_positions", "_unit", ["_stance", "STAND"], ["_ignore", ObjNull]];

private _return = [false, []];

private _up_offset = 1.53;
private _middle_offset = 1.05;
private _down_offset = 0.38;

private _actualpos = [0,0,0];

switch (_stance) do {
	case "STAND": {
		_down_offset = _down_offset - _up_offset;
		_middle_offset = _middle_offset - _up_offset;
		_up_offset = 0;
	};
	case "CROUCH": {
		_down_offset = _down_offset - _middle_offset;
		_up_offset = _up_offset - _middle_offset;
		_middle_offset = 0;
	};
	case "PRONE": {
		_up_offset = _up_offset - _down_offset;
		_middle_offset = _middle_offset - _down_offset;
		_down_offset = 0;
	};
};

{
	private _pos = _x;
	
	private _eye_up = [(_pos select 0), (_pos select 1), ((_pos select 2) + _up_offset)];
	private _eye_middle = [(_pos select 0), (_pos select 1), ((_pos select 2) + _middle_offset)];
	private _eye_down = [(_pos select 0), (_pos select 1), ((_pos select 2) + _down_offset)];
	
	private _return1 = _return select 1;
	
	if ([_eye_up, _unit] call ACPL_MM_Core_fnc_CheckSeeEnemy) then {
		_return1 = _return1 + [[_x, "UP"]];
		_return = [true, _return1];
	};
	
	if ([_eye_middle, _unit] call ACPL_MM_Core_fnc_CheckSeeEnemy) then {
		_return1 = _return1 + [[_x, "MIDDLE"]];
		_return = [true, _return1];
	};
	
	if ([_eye_down, _unit] call ACPL_MM_Core_fnc_CheckSeeEnemy) then {
		_return1 = _return1 + [[_x, "DOWN"]];
		_return = [true, _return1];
	};
} foreach _positions;

_return