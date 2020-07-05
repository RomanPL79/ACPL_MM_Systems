params [
	["_list", []], 
	["_veh_list", []],
	["_gear", false]
];

private _return = [];

{
	private _gearData = [];
	
	private _pos = getposATL _x;
	private _class = TypeOf _x;
	
	if (_gear) then {
		private _uniform = uniform _x;
		private _u_items = uniformItems _x;
		private _vest = vest _x;
		private _v_items = vestItems _x;
		private _backpack = backpack _x;
		private _b_items = backpackitems _x;
		private _headgear = headgear _x;
		private _goggles = goggles _x;
		private _items = assignedItems _x;
		
		private _p_weap = primaryweapon _x;
		private _s_weap = secondaryweapon _x;
		private _h_weap = handgunWeapon _x;
		
		private _p_items = primaryweaponitems _x;
		private _s_items = secondaryweaponitems _x;
		private _h_items = handgunitems _x;
		
		private _u_items_prep = [];
		private _u_items_checked = [];
		{
			private ["_count", "_class"];
			
			_class = _x;
			
			if (_class in _u_items_checked) then {} else {
				_count = {_x == _class} count _u_items;
				_u_items_prep = _u_items_prep + [[_x, _count]];
				_u_items_checked = _u_items_checked + [_class];
			};
		} foreach _u_items;
		
		private _v_items_prep = [];
		private _v_items_checked = [];
		{
			private ["_count", "_class"];
			
			_class = _x;
			
			if (_class in _v_items_checked) then {} else {
				_count = {_x == _class} count _v_items;
				_v_items_prep = _v_items_prep + [[_x, _count]];
				_v_items_checked = _v_items_checked + [_class];
			};
		} foreach _v_items;
		
		private _b_items_prep = [];
		private _b_items_checked = [];
		{
			private ["_count", "_class"];
			
			_class = _x;
			
			if (_class in _b_items_checked) then {} else {
				_count = {_x == _class} count _u_items;
				_b_items_prep = _b_items_prep + [[_x, _count]];
				_b_items_checked = _b_items_checked + [_class];
			};
		} foreach _b_items;
		
		private _face = face _x;

		_gearData = [_uniform, _u_items_prep, _vest, _v_items_prep, _backpack, _b_items_prep, _headgear, _goggles, _items, _p_weap, _s_weap, _h_weap, _p_items, _s_items, _h_items, _face];
	};
	
	
	private _veh = false;
	private _veh_data = [];
	
	if (vehicle _x != _x) then {
		_veh = true;
		private _id = 0;
		private _veh_id = -1;
		private _veh_obj = ObjNull;
		
		private _unit = _x;
		private _pos_type = "";
		private _pos_cargo_id = -1;
		private _pos_turret_id = -1;
		
		{
			if (_x == vehicle _unit) then {
				_veh_id = _id;
				_veh_obj = _x;
			};
			_id = _id + 1;
		} foreach _veh_list;
		
		private _crew = fullCrew _veh_obj;
		{
			if (_unit == _x select 0) then {
				_pos_type = toUpper(_x select 1);
				_pos_cargo_id = _x select 2;
				_pos_turret_id = _x select 3;
			};
		} foreach _crew;
		
		_veh_data = [_veh_id, _pos_type, [_pos_cargo_id, _pos_turret_id]];
	};
	
	_return pushBack [_pos, _class, _gearData, [_veh, _veh_data], _gear];
} foreach _list;

_return