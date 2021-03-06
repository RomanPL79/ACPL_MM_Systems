params [
	["_unit", ObjNull], 
	["_type", true]
];

if (_type) then {
	_unit DisableAI "PATH";
	_unit DisableAI "AUTOCOMBAT";

	private _pos = _unit getvariable ["ACPL_MM_Core_DoStop_stance", "UP"];

	_unit setUnitPos _pos;

	_unit setVariable ["VCOM_NOAI",true];
	_unit setVariable ["Vcm_Disable",true];
	_unit setvariable ["TCL_Disabled",true];
	_unit setVariable ["lambs_danger_disableAI",true];
	(group _unit) setVariable ["Vcm_Disable",true];
	(group _unit) setvariable ["TCL_Disabled",true];
	(group _unit) setVariable ["zbe_cacheDisabled",true];
	_unit setVariable ["zbe_cacheDisabled",true];
} else {
	_unit EnableAI "PATH";
	_unit EnableAI "AUTOCOMBAT";

	_unit setUnitPos "AUTO";

	_unit setVariable ["VCOM_NOAI",false];
	_unit setVariable ["Vcm_Disable",false];
	_unit setvariable ["TCL_Disabled",false];
	_unit setVariable ["lambs_danger_disableAI",false];
	(group _unit) setVariable ["Vcm_Disable",false];
	(group _unit) setvariable ["TCL_Disabled",false];
	(group _unit) setVariable ["zbe_cacheDisabled",true];
	_unit setVariable ["zbe_cacheDisabled",true];
		
	_unit setBehaviour "AWARE";
	_unit forcewalk false;
};