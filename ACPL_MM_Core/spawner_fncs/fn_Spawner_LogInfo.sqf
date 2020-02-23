params ["_group"];

private _return = [];
private _units = units _group;
private _vehicles = [];

private _side = side _group;

{
	if ((vehicle _x != _x) && !(vehicle _x in _vehicles)) then {
		_vehicles = _vehicles + [vehicle _x];
	};
} foreach _units;

private _info_units = [_units, _vehicles] call ACPL_MM_Core_fnc_Spawner_LogInfo_unit;
private _info_vehs = [_vehicles] call ACPL_MM_Core_fnc_Spawner_LogInfo_veh;
private _info_waypoints = [_group] call ACPL_MM_Core_fnc_Spawner_LogInfo_way;

_return = [[_side, _info_units, _info_vehs, _info_waypoints]];

{deletevehicle _x;} foreach (_units + _vehicles);

_return