params [
	["_mode", "init"],
	["_input", []]
];

switch _mode do {
	case "init": {
		_input params [
			["_logic", ObjNull],
			["_activated", false],
			["_isCuratorPlaced", false]
		];

		if (_isCuratorPlaced) exitwith {
			if !(local _logic) exitwith {};

			[
				[
					["LIST", ["STANCE", "", [["UP", "MIDDLE", "DOWN", "AUTO"], "UP"]]],
					["BOOL", ["", "", [true]]],
					["BOOL", ["", "", [false]]],
					["BOOL", ["", "", [false]]],
					["SLIDER", ["", "", [[0, 100], 30]],
					["SLIDER", ["", "", [[1, 1600], 150]],
					["BOOL", ["", "", [true]]],
					["BOOL", ["", "", [true]]],
					["BOOL", ["", "", [true]]],
					["LIST", ["STANCE", "", [["STAND", "WATCH", "RANDOM"], "RANDOM"]]],
					["BOOL", ["", "", [true]]]
				],
				"ACPL DoStop",
				{_this call ACPL_MM_Core_fnc_DoStop_Currator_Init;}
			] call ACPL_MM_Core_fnc_dialog_Show;
		};

		if (_activated && isServer) then {
			private _units = synchronizedObjects _logic;

			{
				_x DisableAI "PATH";
				_x setVariable ["zbe_cacheDisabled",true];
			} foreach _units;

			private _pos = _logic getvariable ["ACPL_MM_Core_DoStop_pos", "UP"];
			private _duck = _logic getvariable ["ACPL_MM_Core_DoStop_duck", true];
			private _run = _logic getvariable ["ACPL_MM_Core_DoStop_run", false];
			private _canrun = _logic getvariable ["ACPL_MM_Core_DoStop_canrun", true];
			private _canrun_chance = _logic getvariable ["ACPL_MM_Core_DoStop_canrun_chance", 30];
			private _canrun_distance = _logic getvariable ["ACPL_MM_Core_DoStop_canrun_distance", 150];
			private _roam = _logic getvariable ["ACPL_MM_Core_DoStop_roam", false];
			private _react = _logic getvariable ["ACPL_MM_Core_DoStop_react", false];
			private _anim = _logic getvariable ["ACPL_MM_Core_DoStop_anim", true];
			private _anim_list = _logic getvariable ["ACPL_MM_Core_DoStop_anim_list", "STAND"];
			private _dosupp = _logic getvariable ["ACPL_MM_Core_DoStop_dosupp", true];

			{
				[_x, _pos, _duck, _run, _canrun, _canrun_chance, _canrun_distance, _roam, _react, _anim, _anim_list, _dosupp] call ACPL_MM_Core_fnc_DoStop_Start;
				
				_x addEventHandler ["FiredMan", {
					params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
					
					private _state = weaponState_unit;
					private _buletsleft = _state select 4;
					
					if ((_buletsleft == 0) && !(_unit in AllPlayers) && (_unit getvariable ["ACPL_MM_DoStop", false])) then {
						[_unit, true] call ACPL_MM_Core_fnc_DoStop_Suppressed;
					};
				}];
				
				_x addEventHandler ["Reloaded", {
					params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
					
					if (!(_unit in allPlayers) && (_unit getvariable ["ACPL_MM_DoStop", false])) then {
						[_unit,(_oldMagazine select 0)] remoteExec ["addmagazine",_unit];
						_unit setVariable ["ACPL_MM_DoStop_Reloaded", true];
					};
				}];
			} foreach _units;
		};
	};
};
true