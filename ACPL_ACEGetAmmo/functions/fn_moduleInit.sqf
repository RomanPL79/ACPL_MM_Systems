params [
	["_mode", ""],
	["_input", []]
];

switch (_mode) do {
	case "init": {
		_input params [
			["_logic", ObjNull],
			["_isActivated", true],
			["_inCurratorPlaced", false]
		];

		if (_inCurratorPlaced) exitwith {
			if !(local _logic) exitwith {};

			private _unit = objNull;
			private _mouseOver = missionNamespace getVariable ["BIS_fnc_curatorObjectPlaced_mouseOver", [""]];
			if ((_mouseOver select 0) isEqualTo (typeName objNull)) then { _unit = _mouseOver select 1; };
			if ((_mouseOver select 0) isEqualTo (typeName grpNull)) then { _unit = leader (_mouseOver select 1); };

			if (isNull _unit) exitwith {hint (localize "STR_ACPL_ACEGetAmmo_GetAmmo_noObject");deletevehicle _logic;};
			private _correct = _unit isKindOf "Helicopter" || _unit isKindOf "Car" || _unit isKindOf "ReammoBox_F";
			if !(_correct) exitwith {hint (localize "STR_ACPL_ACEGetAmmo_GetAmmo_wrongObject");deletevehicle _logic;};

			ACPL_ACEgetAmmo_unit = _unit;

			private _data = [
				["SLIDER", [localize "STR_ACPL_ACEgetAmmo_module_name", localize "STR_ACPL_ACEgetAmmo_module_desc", [[-1, 10000]]]]
			];
			private _code = {
				params ["_data"];

				(missionNameSpace getvariable ["ACPL_ACEgetAmmo_unit", ObjNull]) setVariable ["acpl_acegetammo_value", _data, true];
			};
			[_data, localize "STR_ACPL_ACEgetAmmo_module_name", _code, [_unit]] call ACPL_ACEgetAmmo_fnc_createModuleDialog;

			deletevehicle _logic;
		};

		private _objects = (synchronizedObjects _logic) select {_x isKindOf "Helicopter" || _x isKindOf "Car" || _x isKindOf "ReammoBox_F"};
		private _value = _logic getVariable ["value", 0];

		{
			_x setVariable ["acpl_acegetammo_value", _value, true];
		} foreach _objects;
	};
};
true