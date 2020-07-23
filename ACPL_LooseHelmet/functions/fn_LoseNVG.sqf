params [
	["_unit", ObjNull],
	["_class", ""]
];

// Creates offset
private _offset = [-0.1,-0.72,0.6];

// Calculates velocity and gets the mass
private _velocity = [(random 1),(random 1),(random [1, 2, 3])];
private _torque = [(random 5), (random 1), 0];

// Creates weapon holder and manages NVGs
private _holder = createVehicle ["WeaponHolderSimulated_Scripted", (getpos _unit), [], 0, "CAN_COLLIDE"];
_holder addItemCargoGlobal [_class, 1];
_unit unlinkItem _class;
_holder setvariable ["ACPL_LooseHelmet_WH_Forbidden", true, true];

// Creates dummy and attaches weaponholder to it
private _attachpos_dummy = _unit selectionPosition "head";
_attachpos_dummy set [2, (_attachpos_dummy # 2) + 0.03];
private _dummy = [_unit, (_unit modelToWorld _attachpos_dummy), _holder, _offset] call ACPL_LooseHelmet_fnc_CreateDummy;
_dummy setDir (getdir _unit);

// Adds velocity and torque
_dummy setVelocityModelSpace _new_velocity;
_dummy addTorque (_dummy vectorModelToWorld _torque);

// Calls notMoving function
[{_this call ACPL_LooseHelmet_fnc_notMoving;}, [_dummy, _holder, -1, _unit, "NVG", _class], 1] call CBA_fnc_waitAndExecute;