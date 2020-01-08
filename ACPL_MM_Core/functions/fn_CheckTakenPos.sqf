params ["_list"];

private _return = [];

private _takenpos = {
	params ["_pos"];
	
	private _return = true;
	
	{
		if (_x distance _pos < 1) then {_return = false;};
	} foreach ACPL_MM_Core_TakenPos;
	
	_return
};

{
	if ([_x] call _takenpos) then {
		_return = _return + [_x];
	};
} foreach _list;

_return