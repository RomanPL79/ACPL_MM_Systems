if (!isserver) exitwith {};

private _pool = allGroups;
private _hc = ACPL_MM_Core_Headless_list;
private _count_hc = (count ACPL_MM_Core_Headless_list) + 1;
private _count_groups = count _pool;
private _list = [];
private _done = [];

private _add = {
	params ["_list", "_hc"];
	
	private _owner = owner _hc;
	
	{
		private _noplayable = true;
		{
			if (_x in playableUnits) then {
				_noplayable = false;
			};
		} foreach (units _x);
		if (_noplayable) then {
			[_x, _owner] remoteExec ["setGroupOwner",2];
		};
	} foreach _list;
};

while {true} do {
	private _id = 0;
	_pool = allGroups - _done;
	_count_groups = count _pool;
	
	private _number = _count_groups / _count_hc;
	
	if (_count_hc > _count_groups) then {
		private _chosen = _hc select _id;
		
		_list = _pool;
		_done = _done + _list;
		
		[[_list, _chosen],_add] remoteExec ["call",2];
	} else {
		for "_i" from 1 to _count_hc do {
			private _chosen = _hc select floor(random(count _hc));
			
			if (_id == (_count_hc - 1)) then {
				_list = _pool;
			} else {
				for "_i" from 1 to _number do {
					private _grp = _pool select 0;
					_pool = _pool - [_grp];
					
					_list = _list + [_grp];
				};
			};
			
			[[_list, _chosen],_add] remoteExec ["call",2];
			_done = _done + _list;
			_pool = _pool - _done;
			
			_id = _id + 1;
		};	
	};
	
	waituntil {sleep 60;(count (allGroups - _done) > 0)};
};