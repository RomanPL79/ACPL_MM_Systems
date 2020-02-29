params ["_unit"];

private _side = side _unit;

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
			
			private _eyepos = eyepos vehicle _unit;
			
			{
				private _trg = _x;
				if (vehicle _trg != _trg) then {_trg = vehicle _x;};
				if (((side _x) in _enemy) && ((_unit knowsAbout _trg) > 1)) then {
					private _info = [_eyepos, eyepos _trg] call ACPL_MM_Core_fnc_CheckVisFrom;
					
					if (_info) then {
						_list = _list + [[_trg, ["AUTO"]]];
					};
				};
			} foreach _units;
		};
	};
	case false: {
		private _units = nearestObjects [_unit, ["Man"], 2000];
		
		{
			private _trg = _x;
			if (vehicle _trg != _trg) then {_trg = vehicle _x;};
			if (((side _x) in _enemy) && ((_unit knowsAbout _trg) > 1)) then {
				private _info = [_unit, _trg] call ACPL_MM_Core_fnc_DoSupp_CheckSeeEnemy_FromPos;
				
				private _check = _info select 0;
				private _positions = _info select 1;
				
				if (_check) then {
					_list = _list + [[_trg, _positions]];
				};
			};
		} foreach _units;
	};
};

_list