params ["_unit", "_target"];
	
private _eyepos = eyepos _unit;
private _stance = toUpper(stance _unit);
private _t_eye = eyepos _target;
_eyepos set [2, (_eyepos select 2) - 0.2];

private _gunoffset = (_unit selectionPosition "weapon") select 2;

private _return = [];
private _pos = [];
private _check = false;

private _up_offset = 1.53;
private _middle_offset = 1.05;
private _down_offset = 0.38;

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

private _eye_up = [(_eyepos select 0), (_eyepos select 1), ((_eyepos select 2) + _up_offset)];
private _eye_middle = [(_eyepos select 0), (_eyepos select 1), ((_eyepos select 2) + _middle_offset)];
private _eye_down = [(_eyepos select 0), (_eyepos select 1), ((_eyepos select 2) + _down_offset)];

if (([_unit, "VIEW", _target] checkVisibility [_eye_up, _t_eye]) > 0) then {
	_check = true;
	_pos pushback "UP";
};
if (([_unit, "VIEW", _target] checkVisibility [_eye_middle, _t_eye]) > 0) then {
	_check = true;
	_pos pushback "MIDDLE";
};
if (([_unit, "VIEW", _target] checkVisibility [_eye_down, _t_eye]) > 0) then {
	_check = true;
	_pos pushback "DOWN";
};

_return = [_check, _pos];

_return