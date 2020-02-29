params [["_unit", ObjNull], ["_cointainter", ObjNull]];

private _forbidden = _cointainter getvariable ["ACPL_LooseHelmet_WH_Forbidden", false];

if (_forbidden) then {
	private _localise = localize "STR_ACPL_LooseHelmet_act_inventory_forbidden";
	
	waitUntil {!(isNull findDisplay 602)};
	
	hint _localise;
	
	findDisplay 602 closeDisplay 1;
};