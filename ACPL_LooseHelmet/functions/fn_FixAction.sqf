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

