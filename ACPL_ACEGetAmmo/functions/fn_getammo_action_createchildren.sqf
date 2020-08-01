params [
	["_target", ObjNull],
	["_player", ObjNull]
];

private _actions = [];
private _weapons = (weapons _player) select {
	private _mags = ([_x] call bis_fnc_compatibleMagazines) select {getNumber (configfile >> "CfgMagazines" >> _x >> "scope") == 2};
	count _mags > 0
};

{
	private _childStatement = {
		params [
			["_target", ObjNull],
			["_player", ObjNull],
			["_weapon", ""]
		];

		[_target, _weapon] call ACPL_ACEGetAmmo_fnc_CreateDialog;
	};
	private _childCondition = {
		_target getvariable ['ace_rearm_currentsupply', 0] > 0
	};
	
	private _action = [
		format ["weapon:%1",_x], 
		(getText (configFile >> "CfgWeapons" >> _x >> "displayName")), 
		(getText (configFile >> 'CfgWeapons' >> _x >> 'picture')), 
		_childStatement, 
		_childCondition, 
		{}, 
		_x
	] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];
} forEach _weapons;

_actions