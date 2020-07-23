params [
	["_unit", ObjNull],
	["_velocity", [0,0,0]],
	["_class", ""]
];

// Creates offset
private _offset = [-0.1,-0.62,-0.7];

// Calculates velocity and gets the mass
private _new_velocity = [(_velocity select 0)/150,(_velocity select 1)/150,(_velocity select 2)/25];
private _torque = [(_velocity select 0)/500,(_velocity select 1)/500,0];
private _mass = getNumber (configfile >> "CfgWeapons" >> _class >> "ItemInfo" >> "mass");

// Creates weapon holder and manages helmet
private _holder = createVehicle ["WeaponHolderSimulated_Scripted", (getpos _unit), [], 0, "CAN_COLLIDE"];
_holder addItemCargoGlobal [_class, 1];
removeHeadgear _unit;
_holder setvariable ["ACPL_LooseHelmet_WH_Forbidden", true, true];

// Creates dummy and attaches weaponholder to it
private _attachpos_dummy = _unit selectionPosition "head";
private _dummy = [_unit, (_unit modelToWorld _attachpos_dummy), _holder, _offset, _mass] call ACPL_LooseHelmet_fnc_CreateDummy;
_holder setVectorDirAndUp [[0, 0, 0.5],[0, -0.5, -1]];
_dummy setDir (getdir _unit);

// Adds velocity and torque
_dummy setVelocity _new_velocity;
_dummy addTorque (_dummy vectorModelToWorld _torque);

// Calls notMoving function
[{_this call ACPL_LooseHelmet_fnc_notMoving;}, [_dummy, _holder, -1, _unit, "HELMET", _class], 1] call CBA_fnc_waitAndExecute;