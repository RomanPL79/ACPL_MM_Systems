params ["_positions", "_unit"];

private _return = [false, []];

private _up_offset = [0,0,1.53];
private _middle_offset = [0,0,1.05];
private _down_offset = [0,0,0.38];

{
	private _pos = ATLToASL (_x);
	
	private _eye_up = [(_pos select 0), (_pos select 1), ((_pos select 2) + 1.53)];
	private _eye_middle = [(_pos select 0), (_pos select 1), ((_pos select 2) + 1.05)];
	private _eye_down = [(_pos select 0), (_pos select 1), ((_pos select 2) + 0.38)];
	
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