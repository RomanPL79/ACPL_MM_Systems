params [
	["_logic", ObjNull],
	["_synch", []],
	["_activated", false]
];

if (_activated && isserver) then {
	private _distance = _logic getVariable ["ACPL_MM_Core_zbecache_distance", 2000];
	private _fps = _logic getVariable ["ACPL_MM_Core_zbecache_frames", 30];
	private _debug = _logic getVariable ["ACPL_MM_Core_zbecache_debug", false];
	private _car = _logic getVariable ["ACPL_MM_Core_zbecache_distance_car", 2500];
	private _air = _logic getVariable ["ACPL_MM_Core_zbecache_distance_air", 3000];
	private _boat = _logic getVariable ["ACPL_MM_Core_zbecache_distance_boat", 2000];
	
	[_distance, _fps, _debug, _car, _air, _boat] execvm "ACPL_MM_Core\zbe_cache\main.sqf";
};