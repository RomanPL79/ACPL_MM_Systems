params [
	["_logic", ObjNull],
	["_synch", []],
	["_activated", false]
];

waitUntil {sleep 1;time > 10};

if (_activated) then {
	private _list = [];

	private _syncho = synchronizedObjects _logic;

	{
		if (_x getvariable ["ACPL_MM_Core_Spawner_isList", false]) then {
			private _data = _x getvariable ["ACPL_MM_Core_Spawner_List", []];
			_list = _list + _data;
		};
	} foreach _syncho;

	if ((count _list) == 0) exitwith {
		Systemchat "ACPL MM Core Spawner: List not defined";
	};

	private _number_min = _logic getvariable "ACPL_MM_Core_Spawner_Spawn_Number_min";
	private _number_max = _logic getvariable "ACPL_MM_Core_Spawner_Spawn_Number_max";
	private _number_mid = (_number_max + _number_min) / 2;

	private _number = random [_number_min, _number_mid, _number_max];

	private _list_d = _list;

	for "_i" from 1 to _number do {
		if ((count _list_d) > 0) then {} else {
			_list_d = _list;
		};
		private _random = _list_d select floor(random(count _list_d));
		_list_d = _list_d - [_random];
		
		[_random] spawn ACPL_MM_Core_fnc_Spawner_SpawnGroup;
		
		sleep 5;
	};
};