params [
	"_logic",
	"_synch",
	"_activated"
];

if (!isserver) exitwith {};

if (!_activated) exitwith {};
private _units = synchronizedObjects _logic;

{
	_x DisableAI "PATH";
	_x setVariable ["zbe_cacheDisabled",true];
} foreach _units;

WaitUntil {sleep 1;((time > 35) && (missionnamespace getvariable ["ACPL_MM_Core_Started", true]))};

private _pos = _logic getvariable ["ACPL_MM_Core_DoStop_pos", "UP"];
private _duck = _logic getvariable ["ACPL_MM_Core_DoStop_duck", true];
private _run = _logic getvariable ["ACPL_MM_Core_DoStop_run", false];
private _canrun = _logic getvariable ["ACPL_MM_Core_DoStop_canrun", true];
private _canrun_chance = _logic getvariable ["ACPL_MM_Core_DoStop_canrun_chance", 30];
private _canrun_distance = _logic getvariable ["ACPL_MM_Core_DoStop_canrun_distance", 150];
private _roam = _logic getvariable ["ACPL_MM_Core_DoStop_roam", false];
private _react = _logic getvariable ["ACPL_MM_Core_DoStop_react", false];
private _anim = _logic getvariable ["ACPL_MM_Core_DoStop_anim", true];
private _anim_list = _logic getvariable ["ACPL_MM_Core_DoStop_anim_list", "STAND"];
private _dosupp = _logic getvariable ["ACPL_MM_Core_DoStop_dosupp", true];

{
	private _ownerid = owner _x;
	_x setvariable ["ACPL_MM_Core_DoStop_pos", _pos, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_duck", _duck, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_run", _run, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_canrun", _canrun, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_canrun_chance", _canrun_chance, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_canrun_distance", _canrun_distance, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_roam", _roam, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_react", _react, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_anim", _anim, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_anim_list", _anim_list, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_dosupp", _dosupp, [_ownerid, 2]];
	
	private _buildings = (nearestObjects [_x, ["House", "Building"], 50]);
	private _building = ObjNull;
	
	if (count _buildings > 0) then {
		_building = _buildings select 0;
	};
	
	private _actPos = getposATL _x;
	
	_x setvariable ["ACPL_MM_Core_DoStop_building", _building, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_startPos", _actPos, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_actPos", _actPos, [_ownerid, 2]];
	_x setvariable ["ACPL_MM_Core_DoStop_startDir", (getdir _x), [_ownerid, 2]];
	
	if (vehicle _x == _x) then {
		if (isNil "ACPL_MM_Core_TakenPos") then {ACPL_MM_Core_TakenPos = [];};
		ACPL_MM_Core_TakenPos = ACPL_MM_Core_TakenPos + [(getposATL _x)];
	};
	
	[[_x],ACPL_MM_Core_fnc_DoStop] remoteExec ["spawn",_ownerid];
	
	_x addEventHandler ["FiredMan", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
		
		private _state = weaponState_unit;
		private _bl = _state select 4;
		
		if ((_bl == 0) && !(_unit in AllPlayers) && (_unit getvariable ["ACPL_MM_Core_DoStop_Enabled", false])) then {
			[_unit] spawn ACPL_MM_Core_fnc_DoStop_Reload;
		};
	}];
	
	_x addEventHandler ["Reloaded", {
		params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
		
		if (!(_unit in allPlayers) && (_unit getvariable ["ACPL_MM_Core_DoStop_Enabled", false])) then {
			[_unit,(_oldMagazine select 0)] remoteExec ["addmagazine",_unit];
		};
	}];
} foreach _units;