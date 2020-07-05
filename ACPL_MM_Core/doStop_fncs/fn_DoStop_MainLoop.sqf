params [
	["_group", ObjNull],
	["_units", []]
];

// If group is not local then call on local machine
if !(local _group) exitwith {
	[_group, _units] remoteExecCall ["ACPL_MM_Core_fnc_DoStop_MainLoop", _group];
	_group setvariable ["ACPL_MM_DoStop", true, (owner _group)];
	{
		_x setVariable ["ACPL_MM_DoStop", true, (owner _x)];
		_x setVariable ["ACPL_MM_DoStop_Params", (_x getVariable ["ACPL_MM_DoStop_Params", []]), (owner _x)];
	} foreach _units;
};

// If players are too far then exit and wait
if !([leader _group] call ACPL_MM_Core_fnc_DoStop_check_PlayersInAO) exitwith {
	[{_this call ACPL_MM_Core_fnc_DoStop_MainLoop;}, [_group, _units], 5] call CBA_fnc_waitAndExecute;
};

// If dostop been disabled for group then disable for every unit and exit
if (
	!(_group getvariable ["ACPL_MM_DoStop", false])
) exitwith {
	{[_x, false] call ACPL_MM_Core_fnc_DoStop_Prepare;} foreach (units _group);
};

// If unit to add pushback to list
if (count (_group getVariable ["ACPL_MM_DoStop_toAdd", []]) > 0) then {
	_units append (_group getVariable ["ACPL_MM_DoStop_toAdd", []]);
	_group setVariable ["ACPL_MM_DoStop_toAdd", []];
};

// If no unit to check then exit
if (count _units == 0) exitwith {
	_group setVariable ["ACPL_MM_DoStop", false];
};

//Check that is group know about enemy
private _knowsAboutEnemy = false;
if ([leader _group] call ACPL_MM_Core_fnc_KnowsAboutEnemy) then {
	_knowsAboutEnemy = true;
	_group setBehaviour "AWARE";
} else {
	_group setBehaviour "SAFE";
};

// ForEach _units
{
	private _unit = _x;

	// If unit is not alive then delete from array
	if !(alive _unit) exitwith {_units = _units - [_unit]};

	// If dostop if disable for unit then delete from array and call disable function
	if !(_unit getVariable ["ACPL_MM_DoStop", false]) exitwith {
		_units = _units - [_unit];
		[_unit, false] call ACPL_MM_Core_fnc_DoStop_Prepare;
	};

	// If unit is busy then exit
	if (_unit getvariable ["ACPL_MM_DoStop_Busy", false] || _unit getvariable ["ACPL_MM_Core_DoSupp_Suppressing", false]) exitwith {};

	// Get params
	_unit getVariable ["ACPL_MM_DoStop_Params", []] params [
		["_stance", "UP"],
		["_duck", true],
		["_run", false],
		["_canrun", false],
		["_canrun_chance", 30],
		["_canrun_distance", 150],
		["_roam", false],
		["_react", false],
		["_anim", false],
		["_anim_list", "STAND"],
		["_dosupp", true],
		["_vehicle", false],
		["_buildings", ObjNull],
		["_startPos", []]
	];

	// if unit is in vehicle then disable most of functions
	if (_vehicle) exitwith {
		// If unit is outside the vehicle then disable doStop
		if (vehicle _unit == _unit) exitwith {
			_units = _units - [_unit];
			[_unit, false] call ACPL_MM_Core_fnc_DoStop_Prepare;
		};

		// If should be suppressing enemy
		if (_dosupp && [_unit, 800, true] call ACPL_MM_Core_fnc_DoSupp_start) exitwith {
			[_unit] call ACPL_MM_Core_fnc_DoSupp_start;
		};

		//If no ammo then exit the vehicle
		if (count (magazines vehicle _unit) == 0) exitwith {
			unassignVehicle _unit;
			_units = _units - [_unit];
			[_unit, false] call ACPL_MM_Core_fnc_DoStop_Prepare;
		};
	};

	// If group knowsAbout enemy in AO
	if (_knowsAboutEnemy) then {
		// If should run the disable
		if (_run) exitwith {
			_units = _units - [_unit];
			[_unit, false] call ACPL_MM_Core_fnc_DoStop_Prepare;
		};

		//If can run and should run then disable
		if (_canrun && [_unit, _canrun_chance, _canrun_distance] call ACPL_MM_Core_fnc_DoStop_check_CanRun) exitwith {
			_units = _units - [_unit];
			[_unit, false] call ACPL_MM_Core_fnc_DoStop_Prepare;
		};

		// Duck if suppressed
		if (_duck && [_unit] call ACPL_MM_Core_fnc_DoStop_check_Suppresed) exitwith {
			[_unit] call ACPL_MM_Core_fnc_DoStop_Suppresed;
		};

		// Suppress when see the enemy
		if (_dosupp && [_unit, 800, true] call ACPL_MM_Core_fnc_DoSupp_start) exitwith {
			[_unit] call ACPL_MM_Core_fnc_DoSupp_start;
		};

		// If do not see the enemy then change position
		if (_react && [_unit] call ACPL_MM_Core_fnc_DoStop_check_React) exitwith {
			[_unit, _buildings] call ACPL_MM_Core_fnc_DoStop_React;
		};

		// If any static without gunner nearby then man it
		if ([_unit] call ACPL_MM_Core_fnc_DoStop_check_StaticNearby) exitwith {
			[_unit] call ACPL_MM_Core_fnc_DoStop_MountStatic
		};

		// If is on wrong position then go to correct position
		if (_unit distance (_unit getVariable ["ACPL_MM_Core_DoStop_pos", (getposATL _unit)]) > 5) exitwith {
			[_unit, _unit getVariable ["ACPL_MM_Core_DoStop_pos", (getposATL _unit)]] call ACPL_MM_Core_fnc_DoStop_DoMove;
		};

		// If has wrong stance then change it
		if ((stance _unit) != (_unit getVariable ["ACPL_MM_Core_DoStop_stance", "UP"]) && (_unit getVariable ["ACPL_MM_Core_DoStop_stance", "UP"]) != "AUTO") exitwith {
			_unit setUnitPos (_unit getVariable ["ACPL_MM_Core_DoStop_stance", "UP"]);
		};
	} else {
		// If should roam then change the position
		if (_roam && [_unit] call ACPL_MM_Core_fnc_DoStop_check_Roam) exitwith {
			[_unit, _buildings, _startPos] call ACPL_MM_Core_fnc_DoStop_Roam;
		};

		// If should play anim the do it
		//if (_anim && ) exitwith {};

		// If unit has nothing else to do then look around
	};
} foreach _units;

[{_this call ACPL_MM_Core_fnc_DoStop_MainLoop;}, [_group, _units], 5] call CBA_fnc_waitAndExecute;