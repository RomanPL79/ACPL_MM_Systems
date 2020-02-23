params ["_list"];

private _return = [];

private _id = 0;

{
	private _class = typeof _x;
	private _pos = getposATL _x;
	private _dir = getdir _x;
	
	_return = _return + [[_class, _pos, _dir]];
	
	_id = _id + 1;
} foreach _list;

_return