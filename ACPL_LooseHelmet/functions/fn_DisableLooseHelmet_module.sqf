params [
	["_mode", "init"],
	["_input", []]
];

switch _mode do {
	// Default object init
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
					["BOOL", [localize "STR_ACPL_LooseHelmet_Module_State", localize "STR_ACPL_LooseHelmet_Module_State_desc", [false]]]
			], localize "STR_A3_DoW_module_hunger_title", {
				ACPL_LooseHelmet_Enabled_Module = _this # 0;
				publicVariable "ACPL_LooseHelmet_Enabled_Module";
			}] call ACPL_LooseHelmet_fnc_dialog_show;

			deletevehicle _logic;
		};
		
		if (_activated) then {
			private _enable = _logic getVariable ["ACPL_LooseHelmet_Enable", false];

			ACPL_LooseHelmet_Enabled_Module = _enable;
			deletevehicle _logic;
		};
	};
};
true