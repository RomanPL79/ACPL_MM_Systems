//If no unit to check then exit
if (count ACPL_MM_Core_DoSupp_LoopList == 0) exitwith {
	ACPL_MM_Core_DoSupp_LoopActive = false;
};

//List of units to disable
private _to_remove = [];

//Foreach
{
	_x params [
		["_unit", ObjNull],
		["_target", []],
		["_duration", 0],
		["_vehicle", false]
	];

	private _time = _unit getVariable ["ACPL_MM_Core_DoSupp_duration", 0];

	//if not alive unit, time has passed or not local then exit
	if (
		!(alive _unit) ||
		((time > _time) && (_unit getvariable ["ACPL_MM_Core_DoSupp_Prepared", false])) ||
		!(local _unit)
	) exitwith {
		ACPL_MM_Core_DoSupp_LoopList = ACPL_MM_Core_DoSupp_LoopList - [_x];
		_to_remove pushback [_unit, (_target select 0)];
	};

	//If unit not prepared then exit and check is prepared
	if !(_unit getvariable ["ACPL_MM_Core_DoSupp_Prepared", false]) exitwith {
		_unit dowatch (_target select 0);
		private _dir = _unit getRelDir (_target select 0);

		//If is already looking at the target then set as prepared
		if (_dir < 20 || _dir > 340) exitwith {
			_unit setVariable ["ACPL_MM_Core_DoSupp_Prepared", true];
			_unit setVariable ["ACPL_MM_Core_DoSupp_duration", time + _duration];
		};

		//If is preparing too long then remove from array
		if (time > _unit getVariable ["ACPL_MM_Core_DoSupp_MaxPrepare", _time]) then {
			ACPL_MM_Core_DoSupp_LoopList = ACPL_MM_Core_DoSupp_LoopList - [_x];
			_to_remove pushback [_unit, (_target select 0)];
		};
	};

	//If there is no dummy unit then creating one
	if (_unit getVariable ["ACPL_MM_Core_DoSupp_Ready", false]) then {
		_unit setVariable ["ACPL_MM_Core_DoSupp_Ready", false];
		_target params [
			["_object", ObjNull],
			"",
			["_precision", 1],
			"",
			"",
			["_dummy_class", "CBA_B_InvisibleTarget"]
		];

		//Geting position of target
		private _pos = getpos _object;

		//Creating target and reveal it to shooter
		private _dummy = createVehicle [_dummy_class, _pos, [], 0, "CAN_COLLIDE"];
		createVehicleCrew _dummy;
		_unit reveal [_dummy, 4];
		_unit setVariable ["ACPL_MM_Core_DoSupp_Dummy", _dummy];

		//Starts function which is managing the target
		[_unit, _dummy, _target] call ACPL_MM_Core_fnc_DoSupp_ChangeTarget;
	};
} foreach ACPL_MM_Core_DoSupp_LoopList;

//Disabling units from list if any was added
if (count _to_remove > 0) then {
	{
		_x params [
			["_unit", ObjNull],
			["_target", ObjNull]
		];

		_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", false];
		_target setVariable ["ACPL_MM_Core_DoSupp_Suppressed", false];

		_unit setVariable ["VCOM_NOAI",false];
		_unit setVariable ["Vcm_Disable",false];
		_unit setvariable ["TCL_Disabled",false];
		_unit setVariable ["lambs_danger_disableAI",false];

		vehicle _unit forcespeed 99999;

		private _dummy = _unit getVariable ["ACPL_MM_Core_DoSupp_Dummy", ObjNull];
		{deleteVehicle _x;} foreach (crew _dummy + [_dummy]);
	} foreach _to_remove;
};

[{[] call ACPL_MM_Core_fnc_DoSupp_fnc_loop;}, [], 5] call CBA_fnc_waitAndExecute;