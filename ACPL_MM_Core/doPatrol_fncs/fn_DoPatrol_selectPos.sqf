params ["_group"];

private _return = [];

private _positions = [];
private _customonly = _group getvariable ["ACPL_MM_Core_DoPatrol_customonly", false];

private _lastpos = _group getvariable ["ACPL_MM_Core_DoPatrol_lastpos", []];
private _actualpos = _group getvariable ["ACPL_MM_Core_DoPatrol_actpos", []];

private _custom = [];
private _customareas = _group getvariable ["ACPL_MM_Core_DoPatrol_customareas", []];
private _center = _group getvariable ["ACPL_MM_Core_DoPatrol_center", []];
private _distance = _group getvariable ["ACPL_MM_Core_DoPatrol_distance", 0];

if ((count _customareas) > 0) then {
	{
		private _pos = _x getvariable ["ACPL_MM_Core_DoPatrol_area_pos"];
		
		_custom = _custom + [_pos];
	} foreach _customareas;
};

if (_customonly) then {
	_positions = _custom;
} else {
	_positions = _positions + _custom;
	
	for "_i" from 1 to 10 do {
		private _x = random [-_distance, 0, _distance];
		private _y = random [-_distance, 0, _distance];
		
		private _pos = [_center + _x, _center + _y];
		
		_positions = _positions + [_pos];
	};
};

_positions = _positions - [_actualpos];

_return = _positions select floor(random(count _positions));

_return