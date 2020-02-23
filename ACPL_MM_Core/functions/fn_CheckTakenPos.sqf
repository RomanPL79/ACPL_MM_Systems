params [["_list", []]];

private _return = [];

if (count ACPL_MM_Core_TakenPos > 0) exitwith {_list};

private _takenpos = {
	params ["_pos"];
	
	private _return = true;
	
	if (isNil "ACPL_MM_Core_TakenPos") then {ACPL_MM_Core_TakenPos = [];};
	
	{
		if ((count _x >= 2) && (count _pos >= 2)) then {
			if (_x distance _pos < 1) then {_return = false;};
		};
	} foreach ACPL_MM_Core_TakenPos;
	
	_return
};

{
	if ([_x] call _takenpos) then {
		_return = _return + [_x];
	};
} foreach _list;

_return