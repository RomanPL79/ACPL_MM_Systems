params [
	"_unit",
	["_pos", "UP"],
	["_duck", true],
	["_run", false],
	["_canrun", false],
	["_canrun_chance", 30],
	["_canrun_distance", 150],
	["_roam", false],
	["_react", false],
	["_anim", false],
	["_anim_list", "STAND"],
	["_dosupp", true]
];

_unit setvariable ["ACPL_MM_Core_DoStop_pos", _pos];
_unit setvariable ["ACPL_MM_Core_DoStop_duck", _duck];
_unit setvariable ["ACPL_MM_Core_DoStop_run", _run];
_unit setvariable ["ACPL_MM_Core_DoStop_canrun", _canrun];
_unit setvariable ["ACPL_MM_Core_DoStop_canrun_chance", _canrun_chance];
_unit setvariable ["ACPL_MM_Core_DoStop_canrun_distance", _canrun_distance];
_unit setvariable ["ACPL_MM_Core_DoStop_roam", _roam];
_unit setvariable ["ACPL_MM_Core_DoStop_react", _react];
_unit setvariable ["ACPL_MM_Core_DoStop_anim", _anim];
_unit setvariable ["ACPL_MM_Core_DoStop_anim_list", _anim_list];
_unit setvariable ["ACPL_MM_Core_DoStop_dosupp", _dosupp];

private _building = ((nearestObjects [_unit, ["House", "Building"], 50]) select 0);

_unit setvariable ["ACPL_MM_Core_DoStop_building", _building];
_unit setvariable ["ACPL_MM_Core_DoStop_startPos", (getposATL _unit)];
_unit setvariable ["ACPL_MM_Core_DoStop_actPos", (getposATL _unit)];
_unit setvariable ["ACPL_MM_Core_DoStop_startDir", (getdir _unit)];

if (vehicle _unit == _unit) then {ACPL_MM_Core_TakenPos = ACPL_MM_Core_TakenPos + [(getposATL _unit)];};

[_unit] spawn ACPL_MM_Core_fnc_DoStop;