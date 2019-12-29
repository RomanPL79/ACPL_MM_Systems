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
	
	Execution: call

---------------------------------------------------------------------------- */

params ["_unit", "_type"];

switch (_type) do {
	case "GUN": {
		private _status = _unit getvariable ["ACPL_LooseWeapon_fix_gun",false];
		
		switch (_status) do {
			case false: {
				_unit setvariable ["ACPL_LooseWeapon_fix_gun", true, true];
				[localize "STR_ACPL_LooseHelmet_act_menu_gun_fasten"] remoteExec ["hint",_unit];
			};
			case true: {
				_unit setvariable ["ACPL_LooseWeapon_fix_gun", false, true];
				[localize "STR_ACPL_LooseHelmet_act_menu_gun_unfasten"] remoteExec ["hint",_unit];
			};
		};
	};
	case "HELMET": {
		private _status = _unit getvariable ["ACPL_LooseWeapon_fix_helmet",false];
		
		switch (_status) do {
			case false: {
				_unit setvariable ["ACPL_LooseWeapon_fix_helmet", true, true];
				[localize "STR_ACPL_LooseHelmet_act_menu_helmet_fasten"] remoteExec ["hint",_unit];
			};
			case true: {
				_unit setvariable ["ACPL_LooseWeapon_fix_helmet", false, true];
				[localize "STR_ACPL_LooseHelmet_act_menu_helmet_unfasten"] remoteExec ["hint",_unit];
			};
		};
	};
};

