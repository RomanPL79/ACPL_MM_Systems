params ["_data"];

private _side = _data select 0;
private _units = _data select 1;
private _vehicles = _data select 2;
private _data_way = _data select 3;
private _wp_c = _data_way select 0;
private _waypoints = _data_way select 1;

private _veh_spawned = [];

private _group = createGroup [_side, false];

{
	private _class = _x select 0;
	private _pos = _x select 1;
	private _dir = _x select 2;
	
	private _veh = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
	
	_veh setdir _dir;
	
	_veh_spawned = _veh_spawned + [_veh];
} foreach _vehicles;

{
	_x params [
		["_pos", [0,0,0]],
		["_class", ""],
		["_gear", []],
		["_veh", []],
		["_addGear", false]
	];
	
	private _unit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
	
	if (_veh select 0) then {
		private _v_data = _veh select 1;
		
		private _id = _v_data select 0;
		private _type = _v_data select 1;
		private _v_pos = _v_data select 2;
		private _vehicle = _veh_spawned select _id;
		
		switch (_type) do {
			case "DRIVER": {
				_unit moveindriver _vehicle;
			};
			case "COMMANDER": {
				_unit moveincommander _vehicle;
			};
			case "GUNNER": {
				_unit moveingunner _vehicle;
			};
			case "TURRET": {
				_unit moveinturret [_vehicle, _v_pos select 1];
			};
			case "CARGO": {
				_unit moveincargo [_vehicle, _v_pos select 0];
			};
		};
	} else {
		_unit setposATL _pos;
	};
	
	if (_addGear) then {[_unit, _gear] call ACPL_MM_Core_fnc_Spawner_AddGear;};
} foreach _units;

{
	private _pos = (_x select 0);
	
	private _wp = _group addWaypoint [_pos, 0];
	
	_wp setwaypointBehaviour (_x select 1);
	_wp setwaypointCombatMode (_x select 2);
	_wp setwaypointCompletionRadius (_x select 3);
	_wp setwaypointFormation (_x select 4);
	_wp setwaypointSpeed (_x select 5);
	_wp setwaypointStatements (_x select 6);
	_wp setwaypointTimeout (_x select 7);
	_wp setwaypointType (_x select 8);
	_wp setwaypointLoiterType (_x select 9);
	_wp setwaypointLoiterRadius (_x select 10);
	_wp setwaypointHousePosition (_x select 11);
	_wp setwaypointName (_x select 12);
	_wp setwaypointScript (_x select 13);
} foreach _waypoints;

_group setCurrentWaypoint [_group, _wp_c];

_group deleteGroupWhenEmpty true;