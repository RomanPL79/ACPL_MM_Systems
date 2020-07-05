params [
	["_unit", ObjNull],
	["_pos", "UP"],
	["_duck", true],
	["_run", false],
	["_canrun", false],
	["_canrun_chance", 30],
	["_canrun_distance", 150],
	["_roam", false],
	["_react", false],
	["_anim", false],
	["_anim_list", "AUTO"],
	["_dosupp", true]
];

private _group = group _unit;
private _vehicle = false;

if (vehicle _unit != _unit) then {_vehicle = true;};
private _buildings = nearestObjects [_unit, ["House", "Building"], 25];
_buildings = _buildings select {count ([_x] call BIS_fnc_buildingPositions) > 0};

private _startPos = getposATL _unit;

private _data = [_pos, _duck, _run, _canrun, _canrun_chance, _canrun_distance, _roam, _react, _anim, _anim_list, _dosupp, _vehicle, _buildings, _startPos];

_unit setvariable ["ACPL_MM_DoStop_Params", _data];
_unit setvariable ["ACPL_MM_Core_DoStop_pos", (getposATL _unit)];
_unit setvariable ["ACPL_MM_Core_DoStop_stance", _pos];

if (isNil "ACPL_MM_Core_TakenPos") then {ACPL_MM_Core_TakenPos = [];};
if !(_vehicle) then {
	ACPL_MM_Core_TakenPos = ACPL_MM_Core_TakenPos + [(getposATL _unit)];
} else {
	if !((vehicle _unit) getVariable ["ACPL_MM_Core_DoStop_Reloaded_EH", false]) then {
		(vehicle _unit) setVariable ["ACPL_MM_Core_DoStop_Reloaded_EH", true];
		(vehicle _unit) addEventHandler ["Reloaded", {
			params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
			
			if (!(gunner _unit in allPlayers) && (gunner _unit getvariable ["ACPL_MM_DoStop", false])) then {
				[_unit,(_oldMagazine select 0)] remoteExec ["addmagazine",_unit];
			};
		}];
	};
};

if !(_group getvariable ["ACPL_MM_DoStop", false]) then {
	_group setvariable ["ACPL_MM_DoStop", true];
	_unit setvariable ["ACPL_MM_DoStop", true];
	[_group, [_unit]] call ACPL_MM_Core_fnc_DoStop_MainLoop;
} else {
	private _list = _group getvariable ["ACPL_MM_DoStop_toAdd", []];
	_list pushBack _unit;
	_unit setvariable ["ACPL_MM_DoStop", true];

	_group setvariable ["ACPL_MM_DoStop_toAdd", _list];
};