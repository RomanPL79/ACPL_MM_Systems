params [
	["_unit", ObjNull],
	["_holder", ObjNull],
	["_dummy", ObjNull],
	["_type", ""],
	["_class", ""],
	["_moving", false],
	["_queued", false]
];

// If unit is dead then exit
if !(alive _unit) exitwith {_holder setVariable ["ACPL_LooseHelmet_WH_reserved", false, true];};

// If loop enabled then exitwith
if (_moving) exitwith {
	// If close enought then picking up item
	if (_unit distance _dummy < 5) exitwith {
		private _pickingUp = _unit getVariable ["ACPL_LooseHelmet_pickingUp", []];
		_pickingUp deleteAt 0;
		_unit setVariable ["ACPL_LooseHelmet_pickingUp", _pickingUp];

		// call pickUp function
		[_unit, _holder, _dummy, _type, _class, count _pickingUp > 0] call ACPL_LooseHelmet_fnc_AI_PickUp;

		// if another item in queue then calls function again for next item
		if (count _pickingUp > 0) then {
			[{_this call ACPL_LooseHelmet_fnc_AI_PickUphandle;}, ([_unit] + _params + [false, true]), 1] call CBA_fnc_waitAndExecute;
		};
	};

	// If unit received other order than MOVE then orders unit to move again
	if (currentCommand _unit != "MOVE") then {
		_unit DoMove (getposATL _dummy);
	};

	// Loops the function with delay
	[{_this call ACPL_LooseHelmet_fnc_AI_PickUphandle;}, _this, 1] call CBA_fnc_waitAndExecute;
};

// If there is no need for picking up then exits
if !([_unit, _type] call ACPL_LooseHelmet_fnc_NeedToPickUp) exitwith {};

// Checks is unit picking any item at the moment
private _pickingUp = _unit getVariable ["ACPL_LooseHelmet_pickingUp", []];

// If item is not in queue already then adds it
if !(_queued) then {
	_pickingUp pushback [_holder, _dummy, _type, _class];
};

// If more than 1 item in queue and it's not queued then exit
if (count _pickingUp > 1 && !_queued) exitwith {};

// If unit has dostop activated then disables it
if (_unit getVariable ["ACPL_MM_DoStop", false]) then {
	[_unit, false] call ACPL_MM_Core_fnc_DoStop_Prepare;
};

// Make unit go for weapon
_unit DoMove (getposATL _dummy);
_unit setVariable ["ACPL_LooseHelmet_Busy", true, true];

// Enables loop
_moving = true;

// Reserving holder
_holder setVariable ["ACPL_LooseHelmet_WH_reserved", true, true];

// Calls function with delay
[{_this call ACPL_LooseHelmet_fnc_AI_PickUphandle;}, [_unit, _holder, _dummy, _type, _class, _moving], 1] call CBA_fnc_waitAndExecute;