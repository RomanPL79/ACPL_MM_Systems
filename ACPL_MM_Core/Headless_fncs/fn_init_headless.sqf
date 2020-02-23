params ["_logic"];

if (isNil "ACPL_MM_Core_Headless_list") then {
	ACPL_MM_Core_Headless_list = [];
	publicvariable "ACPL_MM_Core_Headless_list";
};

if (isNil "ACPL_MM_Core_Headless_list") then {
	ACPL_MM_Core_Headless = false;
	publicvariable "ACPL_MM_Core_Headless";
};

if ((_logic in AllPlayers) || (isPlayer _logic)) then {
	ACPL_MM_Core_Headless_list = ACPL_MM_Core_Headless_list + [_logic];
	ACPL_MM_Core_Headless = true;
};