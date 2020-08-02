params [
	["_target", ObjNull],
	["_player", ObjNull],
	["_vehicle", false]
];

private _actions = [];
private _weapons = if (_vehicle) then {weapons _target} else {weapons _player};
if (count _weapons == 0) exitwith {[]};
_weapons = _weapons select {
	private _mags = ([_x] call bis_fnc_compatibleMagazines) select {getNumber (configfile >> "CfgMagazines" >> _x >> "scope") == 2};
	count _mags > 0
};

{
	private _childStatement = {
		params [
			["_target", ObjNull],
			["_player", ObjNull],
			["_var", ["", false]]
		];

		_var params ["_weapon", "_vehicle"];

		[_target, _weapon, _vehicle] call ACPL_ACEGetAmmo_fnc_CreateDialog;
	};
	private _childCondition = {
		_target getvariable ['acpl_acegetammo_value', 0] > 0
	};
	
	private _action = [
		format ["weapon:%1",_x], 
		(getText (configFile >> "CfgWeapons" >> _x >> "displayName")), 
		(getText (configFile >> 'CfgWeapons' >> _x >> 'picture')), 
		_childStatement, 
		_childCondition, 
		{}, 
		[_x, _vehicle]
	] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];
} forEach _weapons;

_actions