params [
	["_dummy", ObjNull],
	["_holder", ObjNull],
	["_time", -1],
	["_unit", ObjNull],
	["_type", ""],
	["_class", ""]
];

// If no max time specified then specify it
if (_time < 0) then {
	_time = time + 30;
};

// Gets velocity and check is the dummy moving
private _vel = velocity _dummy;
private _moving = (_vel # 0) != 0 && (_vel # 1) != 0 && (_vel # 2) != 0;

// If moving and no time passed then exit and call function again with delay
if (_moving && _time > time) exitwith {
	[{_this call ACPL_LooseHelmet_fnc_notMoving;}, [_dummy, _holder, _time, _unit, _type, _class], 1] call CBA_fnc_waitAndExecute;
};

// If not touching the ground then exit and call function again and remove timer
if (!(isTouchingGround _dummy) && _moving) exitwith {
	[_dummy, _holder, -1, _unit, _type, _class] call ACPL_LooseHelmet_fnc_notMoving;
};

// Disable simulation for dummy and holder
_dummy enableSimulationGlobal false;
_holder enableSimulationGlobal false;

// Checks is item should be destroyed
if (ACPL_LooseHelmet_Destroy && ((random 100) < ACPL_LooseHelmet_DestroyChance)) then {
	[_holder, true] call ACPL_LooseHelmet_fnc_Destroy;
};

// Handle picking up of item
[_unit, _holder, _dummy, _type, _class] call ACPL_LooseHelmet_fnc_AI_PickUpHandle;
[{_this call ACPL_LooseHelmet_fnc_AI_HasWeapon;}, [_unit], 30] call CBA_fnc_waitAndExecute;

// If cleaning is enabled then start cleaner with delay
if (ACPL_LooseHelmet_Cleaning_Enabled) then {
	[{_this call ACPL_LooseHelmet_fnc_clean;}, [_dummy, _holder], ACPL_LooseHelmet_Cleaning_Time] call CBA_fnc_waitAndExecute;
};