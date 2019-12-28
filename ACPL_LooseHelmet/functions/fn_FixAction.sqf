/* ----------------------------------------------------------------------------
	Function: ACPL_LooseHelmet_fnc_FixAction;

	Description: 	This function is checking that weapon or helmet is fasten or not and 
					it's fasting it or unfasting

	Parameters: 
		- unit		unit who should be checked
		- type		type of selection: "GUN" or "HELMET"

	Returns: 

	Author: [ACPL] Roman79
	
	Version: 1
	
	Execution: 

---------------------------------------------------------------------------- */

params ["_unit", "_type"];

switch (_type) do {
	case "GUN": {
		private _status = _unit getvariable ["ACPL_LooseWeapon_fix_gun",false];
		
		switch (_status) do {
			case true: {
				_unit setvariable ["ACPL_LooseWeapon_fix_gun", true, true];
				[""] remoteExec ["hint",_unit];
			};
			case false: {
				_unit setvariable ["ACPL_LooseWeapon_fix_gun", false, true];
				[""] remoteExec ["hint",_unit];
			};
		};
	};
	case "HELMET": {
		private _status = _unit getvariable ["ACPL_LooseWeapon_fix_helmet",false];
		
		switch (_status) do {
			case true: {
				_unit setvariable ["ACPL_LooseWeapon_fix_helmet", true, true];
				[""] remoteExec ["hint",_unit];
			};
			case false: {
				_unit setvariable ["ACPL_LooseWeapon_fix_helmet", false, true];
				[""] remoteExec ["hint",_unit];
			};
		};
	};
};

