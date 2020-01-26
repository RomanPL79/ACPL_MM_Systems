params ["_unit"];

private _side = side _unit;
private _pos = getposATL _unit;

private _list = [];
private _enemy = [_side] call ACPL_MM_Core_fnc_CheckEnemy;

private _vehicle = false;
private _gunner = false;

if (vehicle _unit != _unit) then {
	_vehicle = true;
	
	if (gunner (vehicle _unit) == _unit) then {
		_gunner = true;
	};
};

switch (_vehicle) do {
	case true: {
		if (_gunner) then {
			private _units = nearestObjects [vehicle _unit, ["Man"], 2000];
			
			private _eyepos = eyePos _unit;
			
			{
				if ((side _x) in _enemy) then {
					private _info = [_eyepos, _x] call ACPL_MM_Core_fnc_CheckVisFrom;
					
					if (_info) then {
						_list = _list + [[_x, "AUTO"]];
					};
				};
			} foreach _units;
		};
	};
	case false: {
		private _units = nearestObjects [_unit, ["Man"], 2000];

		{
			if ((side _x) in _enemy) then {
				private _info = [_pos, _x] call ACPL_MM_Core_fnc_CheckSeeEnemy_FromPos;
				
				private _check = _info select 0;
				private _info_1 = _info select 1;
				private _positions = [];
				
				{
					_positions = _positions + [_x select 1];
				} foreach _info_1;
				
				if (_check) then {
					_list = _list + [[_x, _positions]];
				};
			};
		} foreach _units;
	};
};

_list