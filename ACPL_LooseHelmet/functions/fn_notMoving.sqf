params [
	["_dummy", ObjNull],
	["_weaponholder", ObjNull],
	["_time", 0],
	["_data", []]
];

private _moving = true;
private _vel = velocity _dummy;
private _pos = getposATL _dummy;

[_dummy,_weaponholder] remoteExec ["disableCollisionWith",0,true];

_weaponholder setvariable ["ACPL_LooseHelmet_WH_dummy", _dummy, true];

while {_moving} do {
	_vel = velocity _dummy;
	_pos = getposATL _dummy;

	if (((_vel select 0 == 0) && (_vel select 1 == 0) && (_vel select 2 == 0)) || time > _time) then {
		_dummy enableSimulationGlobal false;
		_weaponholder enableSimulationGlobal true;
	
		_moving = false;
	};
		
	sleep 0.05;
};

_weaponholder enableSimulationGlobal false;

if (ACPL_LooseHelmet_Destroy && (random 100 < ACPL_LooseHelmet_DestroyChance)) then {
	[_weaponholder, true] call ACPL_LooseHelmet_fnc_Destroy;
};

if (ACPL_LooseHelmet_Cleaning_Enabled) then {
	sleep ACPL_LooseHelmet_Cleaning_Time;

	if (isNull _dummy) exitwith {};

	private _pos = getposATL _dummy;

	for "_i" from 0 to 19 do {
		private _z = (_pos select 2) - 0.01;
		_pos set [2, _z];
		_dummy setposATL _pos;
		sleep 0.01;
	};

	deletevehicle _weaponholder;
	deletevehicle _dummy;
};