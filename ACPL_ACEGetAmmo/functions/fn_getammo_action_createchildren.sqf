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
		private _rounds = getNumber (configfile >> "CfgMagazines" >> _x >> "count");
		private _selected = -1;
		if (_ishidden == 2) then {
			if (count _list != 0) then {
				private _id = 0;
				{
					private _rounds_selected = _x select 0;
					if (_rounds_selected == _rounds) then {_selected = _id};
					_id = _id + 1;
				} foreach _list;
				if (_selected != _1) then {
					((_list select _selected) select 1) pushback _x;
				} else {
					_list pushback [_rounds, [_x]];
				};
			} else {
				_list pushback [_rounds, [_x]];
			};
		};
	} foreach _mags;
	
	if ((count _list) > 1) then {
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
					
					[_target, _class, _player] call ACPL_ACEGetAmmo_fnc_getammo_action_addmagazine;
				};
				private _childCondition = {
					params [
						["_target", ObjNull],
						["_player", ObjNull],
						["_class", ""]
					];
					
					([_target, _class] call ACPL_ACEGetAmmo_fnc_getammo_check_hasammo) && (_target getvariable ['ace_rearm_issupplyvehicle', false])
				};
				
				private _name = ((getText (configFile >> "CfgMagazines" >> _x >> "displayName")) + " " + (localize "STR_ACPL_ACEGetAmmo_GetAmmo_cost") + " " + str(getNumber (configFile >> "CfgMagazines" >> _x >> "value")) + ")");
				
				private _action = [format ["magazine:%1",_x], _name, (getText (configFile >> 'CfgMagazines' >> _x >> 'picture')), _childStatement, _childCondition, {}, _x] call ace_interact_menu_fnc_createAction;
				_actions pushBack [_action, [], _target];
			} forEach _list;
			
			_actions
		};

		{
			private _rounds_selected = _x select 0;
			private _list_selected = _x select 1;

			private _number = (count (_list select 1)) / 10;
			if (_number > 10) then {
				_number = [_number, 0] call BIS_fnc_cutDecimals;
			} else {
				_number = -1;
			};
			private _list_array = [];

			if (_number != -1) then {
				private _id = 0;
				for "_i" from 1 to _number do {
					private _array = [];
					for "_i" from 0 to 9 do {
						_array pushback (_list_selected select 0);
						_list_selected deleteAt 0;
					};
					_list_array pushback _array;
					_id = _id + 1;
				};

				if (count _list > 0) then {_list_array pushback _array;};
			} else {
				_list_array = [_list_selected];
			};

			{
				private _text = (str(_rounds_selected) + localize "STR_ACPL_ACEGetAmmo_GetAmmo_group");
				private _childStatement = {};
				private _childCondition = {
					params [
						["_target", ObjNull],
						["_player", ObjNull],
						["_class", ""]
					];
					
					(_target getvariable ['ace_rearm_issupplyvehicle', false])
				};
				
				private _action = [format ["group:%1",(_x select 0)], _text, "", _childStatement, _childCondition, {params ["_target", "_player", "_add"];_add params ["_class", "_act"];[_target, _player, _class] call _act}, [_x, _addactions]] call ace_interact_menu_fnc_createAction;
				_actions pushBack [_action, [], _target];
			} forEach _list_array;
		} foreach _list;
		
		_actions
	} else {
		
		{
			private _childStatement = {
				params [
					["_target", ObjNull],
					["_player", ObjNull],
					["_class", ""]
				];
				
				[_target, _class, _player] call ACPL_ACEGetAmmo_fnc_getammo_action_addmagazine;
			};
			private _childCondition = {
				params [
					["_target", ObjNull],
					["_player", ObjNull],
					["_class", ""]
				];
				
				([_target, _class] call ACPL_ACEGetAmmo_fnc_getammo_check_hasammo) && (_target getvariable ['ace_rearm_issupplyvehicle', false])
			};
			
			private _name = ((getText (configFile >> "CfgMagazines" >> _x >> "displayName")) + " " + (localize "STR_ACPL_ACEGetAmmo_GetAmmo_cost") + " " + str(getNumber (configFile >> "CfgMagazines" >> _x >> "value")) + ")");
			
			private _action = [format ["magazine:%1",_x], _name, (getText (configFile >> 'CfgMagazines' >> _x >> 'picture')), _childStatement, _childCondition, {}, _x] call ace_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target];
		} forEach ((_list select 0) select 1);
		
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