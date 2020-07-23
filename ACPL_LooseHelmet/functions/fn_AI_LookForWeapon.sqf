params [
	["_unit", ObjNull],
	["_run", false],
	["_target", ObjNull],
	["_holder", false]
];

// If function is looped
if (_run) exitwith {
	// If is close enough then exits and calls picking up function
	if (_unit distance _target < 3) exitwith {
		private _type = if (_holder) then {"WEAPON"} else {"CONTAINER"};
		private _weapon = if (_holder) then {
			private _list = weaponsItemsCargo _target;
			private _return = [];
			if (count _list == 1) then {
				_return = _list # 0;
			} else {
				_return = _list # floor(random(count _list));
			};
			_return
		} else {
			private _list = weaponsItemsCargo _target;
			_list # floor(random(count _list));
		};
		private _dummy = _target getVariable ["ACPL_LooseHelmet_WH_dummy", ObjNull];

		[_unit, _target, _dummy, _type, _weapon] call ACPL_LooseHelmet_fnc_AI_PickUp;
	};

	// If command had been changed then order to move
	if (currentCommand _unit != "MOVE") then {
		_unit doMove _target;
	};

	// Loop function
	[{_this call ACPL_LooseHelmet_fnc_AI_LookForWeapon;}, [_unit, _run, _target, _holder], 1] call CBA_fnc_waitAndExecute;
};

// If first start then enable the loop
if !_run then {_run = true;};

// Look for weapons nearby
private _objects = _unit nearEntities [["WeaponHolder", "ReammoBox_F", "Car"], 50];
_objects = _objects select {count (weaponsItemsCargo _x) > 0 && !(_x getVariable ["ACPL_LooseHelmet_WH_reserved", false])};

// If found weapons then select one of them
if (count _objects > 0) then {
	_target = _objects # floor(random(count _objects));
	_target setVariable ["ACPL_LooseHelmet_WH_reserved", true, true];
	_unit doMove _target;
	_holder = _target isKindOf "WeaponHolder" && count (weaponsItemsCargo _target) == 1;
	_target setVariable ["ACPL_LooseHelmet_WH_reserved", true, true];
	
	[{_this call ACPL_LooseHelmet_fnc_AI_LookForWeapon;}, [_unit, _run, _target, _holder], 1] call CBA_fnc_waitAndExecute;
};