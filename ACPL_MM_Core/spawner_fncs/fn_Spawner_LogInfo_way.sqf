params ["_group"];

private _return = [];

private _waypoints = waypoints _group;
private _waypointcurrent = currentWaypoint _group;
private _data = [];

{
	private _pos = waypointPosition _x;
	private _beh = waypointBehaviour _x;
	private _combat = waypointCombatMode _x;
	private _comp = waypointCompletionRadius _x;
	private _form = waypointFormation _x;
	private _speed = waypointSpeed _x;
	private _state = waypointStatements _x;
	private _timeout = waypointTimeout _x;
	private _type = waypointType _x;
	private _loiter = waypointLoiterType _x;
	private _loiter_r = waypointLoiterRadius _x;
	private _housepos = waypointHousePosition _x;
	private _name = waypointName _x;
	private _script = waypointScript _x;
	
	_data = _data + [[_pos, _beh, _combat, _comp, _form, _speed, _state, _timeout, _type, _loiter, _loiter_r, _housepos, _name, _script]];
} foreach _waypoints;

_return = [_waypointcurrent, _data];

_return