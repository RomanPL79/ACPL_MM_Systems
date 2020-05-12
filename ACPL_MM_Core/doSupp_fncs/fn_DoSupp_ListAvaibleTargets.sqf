params ["_unit"];

private _side = side _unit;

private _list = [];
private _enemy = [_side] call ACPL_MM_Core_fnc_CheckEnemy;

private _vehicle = false;
private _gunner = false;

private _eyepos = eyepos _unit;

if (vehicle _unit != _unit) then {
	_vehicle = true;
	
	if (gunner (vehicle _unit) == _unit) then {
		_gunner = true;
		_eyepos = eyepos vehicle _unit;
	};
};

private _units = nearestObjects [vehicle _unit, ["Man"], 2000];
private _vehicles = _units select {vehicle _x != _x};
_units = _units select {side _x in _enemy && _unit knowsAbout _x > 1 && !(_x in _vehicles)};
private _allunits = _units + _vehicles;
if (count _allunits == 0) exitwith {_list};
if (_vehicle) then {
	_allunits = _allunits select {
		private _x_eye = [0,0,0];
		if (vehicle _x == _x) then {_x_eye = eyepos _x;} else {_x_eye = getposasl _x;};
		[_eyepos, _x_eye, vehicle _unit, _x] call ACPL_MM_Core_fnc_CheckVisFrom
	};
	{_list pushback [[_x, ["AUTO"]]]} foreach _allunits;
} else {
	{
		private _trg = _x;

		private _info = [_unit, _trg] call ACPL_MM_Core_fnc_DoSupp_CheckSeeEnemy_FromPos;
				
		private _check = _info select 0;
		private _positions = _info select 1;

		if (_check) then {
			_list pushBack [_trg, _positions];
		};
	} foreach _allunits;
};

_list