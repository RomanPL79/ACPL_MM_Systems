params [
	["_target", ObjNull],
	["_player", ObjNull],
	[""]
];

private _add_cancel = {
	params [
		["_target", ObjNull],
		["_player", ObjNull],
		["_arty", ObjNull]
	];

	private _actions = [];

	private _statement = {
		params ["_target", "_player", "_add"];
		_add params ["_arty"];

		[[_arty, _player],ACPL_FireSupport_fnc_action_artyCancelFireMission] remoteExec ["call",2];
	};
	private _condition = {true};

	private _action = [];
	private _action = [format ["arty:%1",_arty], localize "STR_ACPL_FireSupport_CancelFireMission", "", _statement, _condition, {}, [_arty]] call ace_interact_menu_fnc_createAction;

	_actions
};

private _add_magazine = {};

private _add_rounds = {};

private _list = [];
private _side = side _player;
private _actions = [];

switch (_side) do {
	case WEST: {_list = ACPL_FireSupport_ArtyList_WEST;};
	case EAST: {_list = ACPL_FireSupport_ArtyList_EAST;};
	case RESISTANCE: {_list = ACPL_FireSupport_ArtyList_RESISTANCE;};
};

{
	_x params ["_arty", "_resupply"];

	private _magazines = magazinesAmmo _arty;
	private _ammo = [];
	private _classes = [];

	private _busy = _arty getVariable ["ACPL_FireSupport_ArtyBusy", false];
	private _name = _arty getVariable ["ACPL_FireSupport_ArtyName", ""];

	{
		_x params ["_class", "_rnds"];

		if (_class in _classes) then {
			private _id = _classes find _class;
			private _rnd = ((_ammo select _id) select 1) + _rnds;
			_ammo set [_id,[_class, _rnd]];
		} else {
			_ammo pushback [_class, _rnds];
			_classes pushback _class;
		};
	} foreach _magazines;

	private _child = {};

	if (_busy) then {
		_name = (_name + " (" + localize "STR_ACPL_FireSupport_Busy" + ")");
		_child = {
			params ["_target", "_player", "_add"];
			_add params ["_arty", "_ammo"];
			[_target, _player, _arty] call _add_cancel;
		};
	} else {
		_child = {
			params ["_target", "_player", "_add"];
			_add params ["_arty", "_ammo"];
			[_target, _player, _arty, _ammo] call _add_magazine;
		};
	};
	
} foreach _list;

_actions