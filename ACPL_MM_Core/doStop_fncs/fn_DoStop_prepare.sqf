params ["_unit", "_type"];

switch (_type) do {
	case true: {
		_unit DisableAI "PATH";
		_unit DisableAI "AUTODANGER";

		private _pos = _unit getvariable ["ACPL_MM_Core_DoStop_pos", "UP"];

		_unit setUnitPos _pos;

		_unit setVariable ["VCOM_NOAI",true];
		_unit setVariable ["Vcm_Disable",true];
		_unit setvariable ["TCL_Disabled",true];
		(group _unit) setVariable ["Vcm_Disable",true];
		(group _unit) setvariable ["TCL_Disabled",true];
		(group _unit) setVariable ["zbe_cacheDisabled",true];
		
		_unit forceWalk true;
	};
	case false: {
		_unit EnableAI "PATH";
		_unit EnableAI "AUTODANGER";

		_unit setUnitPos "AUTO";

		_unit setVariable ["VCOM_NOAI",false];
		_unit setVariable ["Vcm_Disable",false];
		_unit setvariable ["TCL_Disabled",false];
		(group _unit) setVariable ["Vcm_Disable",false];
		(group _unit) setvariable ["TCL_Disabled",false];
		(group _unit) setVariable ["zbe_cacheDisabled",true];
		
		_unit forceWalk false;
		
		[_unit, true] remoteExec ["enableSimulation", 0, true];
	};
};

