params [
	["_target", ObjNull],
	["_player", ObjNull]
];

private _actions = [];
private _weapons_tc = weapons _player;
private _weapons = [];

{
	private _check = [_x] call bis_fnc_compatibleMagazines;
	if (count _check > 0) then {_weapons pushback _x;};
} foreach _weapons_tc;

private _addmagazines = {
	params [
		["_target", ObjNull],
		["_player", ObjNull],
		["_class", ""]
	];
	
	private _actions = [];
	
	private _mags = [_class] call bis_fnc_compatibleMagazines;
	private _list = [];
	
	{
		private _ishidden = getNumber (configfile >> "CfgMagazines" >> _x >> "scope");
		if (_ishidden == 2) then {_list pushback _x};
	} foreach _mags;
	
	if ((count _list) > 10) then {
		private _addactions = {
			params [
				["_target", ObjNull],
				["_player", ObjNull],
				["_list", []]
			];
			
			private _actions = [];
			
			{
				private _childStatement = {
					params [
						["_target", ObjNull],
						["_player", ObjNull],
						["_class", ""]
					];
					
					[_target, _class, _player] call ACPL_Support_fnc_getammo_action_addmagazine;
				};
				private _childCondition = {
					params [
						["_target", ObjNull],
						["_player", ObjNull],
						["_class", ""]
					];
					
					([_target, _class] call ACPL_Support_fnc_getammo_check_hasammo) && (_target getvariable ['ace_rearm_issupplyvehicle', false])
				};
				
				private _name = ((getText (configFile >> "CfgMagazines" >> _x >> "displayName")) + " " + (localize "STR_ACPL_Support_GetAmmo_cost") + " " + str(getNumber (configFile >> "CfgMagazines" >> _x >> "value")) + ")");
				
				private _action = [format ["magazine:%1",_x], _name, (getText (configFile >> 'CfgMagazines' >> _x >> 'picture')), _childStatement, _childCondition, {}, _x] call ace_interact_menu_fnc_createAction;
				_actions pushBack [_action, [], _target];
			} forEach _list;
			
			_actions
		};
		
		private _list_array = [];
		private _number = (count _list) / 10;
		_number = [_number, 0] call BIS_fnc_cutDecimals;
		
		private _id = 0;
		for "_i" from 1 to _number do {
			private _array = [];
			for "_i" from 0 to 9 do {
				_array pushback (_list select 0);
				_list deleteAt 0;
			};
			_list_array pushback _array;
			_id = _id + 1;
		};
		
		if (count _list > 0) then {_list_array pushback _array;};
		
		{
			private _childStatement = {};
			private _childCondition = {
				params [
					["_target", ObjNull],
					["_player", ObjNull],
					["_class", ""]
				];
				
				(_target getvariable ['ace_rearm_issupplyvehicle', false])
			};
			
			private _action = [format ["group:%1",(_x select 0)], localize "STR_ACPL_Support_GetAmmo_group", "", _childStatement, _childCondition, {params ["_target", "_player", "_add"];_add params ["_class", "_act"];[_target, _player, _class] call _act}, [_x, _addactions]] call ace_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target];
		} forEach _list_array;
		
		_actions
	} else {
		
		{
			private _childStatement = {
				params [
					["_target", ObjNull],
					["_player", ObjNull],
					["_class", ""]
				];
				
				[_target, _class, _player] call ACPL_Support_fnc_getammo_action_addmagazine;
			};
			private _childCondition = {
				params [
					["_target", ObjNull],
					["_player", ObjNull],
					["_class", ""]
				];
				
				([_target, _class] call ACPL_Support_fnc_getammo_check_hasammo) && (_target getvariable ['ace_rearm_issupplyvehicle', false])
			};
			
			private _name = ((getText (configFile >> "CfgMagazines" >> _x >> "displayName")) + " " + (localize "STR_ACPL_Support_GetAmmo_cost") + " " + str(getNumber (configFile >> "CfgMagazines" >> _x >> "value")) + ")");
			
			private _action = [format ["magazine:%1",_x], _name, (getText (configFile >> 'CfgMagazines' >> _x >> 'picture')), _childStatement, _childCondition, {}, _x] call ace_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target];
		} forEach _list;
		
	};
	
	_actions
};

{
	private _childStatement = {
		params [
			["_target", ObjNull],
			["_player", ObjNull],
			["_params", []]
		];
	};
	private _childCondition = {
		_target getvariable ['ace_rearm_issupplyvehicle', false]
	};
	
	private _action = [format ["weapon:%1",_x], (getText (configFile >> "CfgWeapons" >> _x >> "displayName")), (getText (configFile >> 'CfgWeapons' >> _x >> 'picture')), _childStatement, _childCondition, {params ["_target", "_player", "_add"];_add params ["_class", "_act"];[_target, _player, _class] call _act}, [_x, _addmagazines]] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];
} forEach _weapons;

_actions