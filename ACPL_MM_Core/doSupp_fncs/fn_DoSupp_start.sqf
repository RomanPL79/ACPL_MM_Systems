params [
	["_unit", ObjNull],
	["_distance", 800],
	["_check_only", false]
];

private _return = false;

//If unit is not local or busy then always returning false
if (
	!(local _unit) ||
	[_unit] call ACPL_MM_Core_fnc_DoSupp_isBusy
) exitwith {false};

//If unit is in vehicle then increasing distance
private _vehicle = false;
if (vehicle _unit != _unit) then {
	_vehicle = true;
	_distance = (_distance * 2);
};

//Getting list of know targets
_targets = _unit nearTargets _distance;

//If only check is needed then do not call main function
if (count _targets > 0 && _check_only) exitwith {true};

//If any targets found then check
if (count _targets > 0) then {

	//Prepare list
	private _list = [];
	{
		_x params [
			"",
			"",
			["_side", WEST],
			["_cost", 0],
			["_object", ObjNull],
			["_precision", 0]
		];

		//Checking distance and defining positions list
		private _positions = [];
		private _distance = _unit distance _object;

		//If object is a invisible Target then exiting
		if (typeOf _object in ["CBA_B_InvisibleTarget", "CBA_O_InvisibleTarget", "CBA_I_InvisibleTarget"]) exitwith {};

		//If cost is greather than 0.1 and distance is higher than 20m then adding to list - max 5 targets!
		if (
			_cost > 0.1 && 
			_distance > 50 && 
			count _list < 6 &&
			_side != CIVILIAN
		) then {
			_return = true;

			private _visibility = false;

			//If is not in vehicle then checking visibility for every stance
			if !(_vehicle) then {
				private _data = [_unit, _object] call ACPL_MM_Core_fnc_DoSupp_CheckVisibilityFromStance;
				_visibility = _data select 0;
				_positions = _data select 1;
			} else {
				if (([vehicle _unit, "VIEW", _object] checkVisibility [eyepos _unit, eyepos _object]) > 0.1) then {
					_visibility = true;
					_positions pushBack "AUTO";
				};
			};

			//Check side and choose call of dummy
			private _dummy_class = "";
			switch (_side) do {
				case WEST: {
					_dummy_class = "CBA_B_InvisibleTarget";
				};
				case EAST: {
					_dummy_class = "CBA_O_InvisibleTarget";
				};
				case RESISTANCE: {
					_dummy_class = "CBA_I_InvisibleTarget";
				};
			};

			//If is visible then add to the list
			if (_visibility) then {
				_list pushback [_object, _cost, _precision, _distance, _positions, _dummy_class];
			};
		};
	} foreach _targets;

	//Calculating durration of suppressing fire
	private _durration = 0;
	if (_vehicle) then {
		_durration = random [20, 30, 45];
	} else {
		_durration = random [30, 45, 60];
	};

	//Sorting list by cost of target and distance
	_list = [_list, [], {
		(_x select 1) / ((_x select 3) / 500)
	}, "ASCEND"] call BIS_fnc_sortBy;

	//Starting suppressing
	if (_return) then {
		[_unit, _list, _durration, _vehicle] call ACPL_MM_Core_fnc_DoSupp_fnc;
	};
};

_return