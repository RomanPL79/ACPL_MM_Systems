params [
	["_unit", ObjNull],
	["_class", [""]]
];

// Creates offset
private _offset = [0,-0.6,0];

// Calculates velocity and gets the mass
private _velocity = [(random 2),(random 2),(random 1)];
private _torque = [(random 0.2), (random 0.2), (random 0.2)];

// Creates weapon holder and manages NVGs
private _holder = createVehicle ["WeaponHolderSimulated_Scripted", (getpos _unit), [], 0, "CAN_COLLIDE"];
_holder addWeaponWithAttachmentsCargoGlobal [_class, 1];
_unit removeweapon (_class # 0);
_holder setvariable ["ACPL_LooseHelmet_WH_Forbidden", true, true];

// Creates dummy and attaches weaponholder to it
private _attachpos_dummy = _unit selectionPosition "head";
private _dummy = [_unit, (_unit modelToWorld _attachpos_dummy), _holder, _offset] call ACPL_LooseHelmet_fnc_CreateDummy;
_holder setVectorDirAndUp [[0, 0, 0.5],[0, -0.5, -1]];
_dummy setDir (getdir _unit);

// Creates correct array for later use
private _attachments = _class - [(_class # 0)];
private _weaponData = [(_class # 0), _attachments];

// Rotates dummy
private _y = 0;
private _p = 0;
private _r = 90;
_dummy setVectorDirAndUp [ 
	[sin _y * cos _p,cos _y * cos _p,sin _p], 
	[[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
];

// Adds velocity and torque
_dummy setVelocity _velocity;
_dummy addTorque (_dummy vectorModelToWorld _torque);

// Calls notMoving function
[{_this call ACPL_LooseHelmet_fnc_notMoving;}, [_dummy, _holder, -1, _unit, "WEAPON", _weaponData], 1] call CBA_fnc_waitAndExecute;