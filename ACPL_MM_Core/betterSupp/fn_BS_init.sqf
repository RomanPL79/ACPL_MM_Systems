params ["_unit"];

while {alive _unit} do {

	WaitUntil {sleep 1;((local _unit) && !(isPlayer _unit) && ((getSuppression _unit > 0) || (_unit getvariable ["ACPL_MM_Core_Supp", 0] > 0)))};

	private _supp = getSuppression _unit;
	private _MM_supp = _unit getvariable ["ACPL_MM_Core_Supp", 0];

	switch (_supp) do {
		case (_supp > _MM_supp): {
			private _change = (_supp - _MM_supp) / 10;
			private _new = _MM_supp + _change;
			
			switch (_new) do {
				case (_new > 1): {_new = 1;};
				case (_new < 0): {_new = 0;};
			};
			
			_unit setvariable ["ACPL_MM_Core_Supp", _new, true];
		};
		case (_supp < _MM_supp): {
			private _change = (_MM_supp - _supp) / 10;
			private _new = _MM_supp - _change;
			
			switch (_new) do {
				case (_new > 1): {_new = 1;};
				case (_new < 0): {_new = 0;};
			};
			
			_unit setvariable ["ACPL_MM_Core_Supp", _new, true];
		};
		case (_supp == _MM_supp): {
			_unit setvariable ["ACPL_MM_Core_Supp", _supp, true];
		};
	};

};