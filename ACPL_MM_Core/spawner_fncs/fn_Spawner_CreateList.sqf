params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _groups = [];

	private _gear = _logic getVariable ["ACPL_MM_Core_Spawner_CreateList_DisableGear", false];

	{
		if (!(side _x == sideLogic) && !((typeOf _x) isKindOf "Module_F")) then {
			private _group = group _x;
			if (!(_x in _groups)) then {
				_groups = _groups + [_group];
			};
		};
	} foreach _synch;

	private _info = [];

	{
		private _i = [_x, _gear] call ACPL_MM_Core_fnc_Spawner_LogInfo;
		_info = _info + _i;
	} foreach _groups;

	_logic setvariable ["ACPL_MM_Core_Spawner_List", _info];
	_logic setvariable ["ACPL_MM_Core_Spawner_isList", true];
};