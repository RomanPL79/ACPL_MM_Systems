params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _units = synchronizedObjects _logic;
	
	private _level = _logic getvariable ["ACPL_MM_Core_Medical_medic", ""];
	
	{
		switch (_level) do {
			case "": {};
			case "nonmedic": {
				_x setVariable ["ace_medical_medicClass", 0, true];
			};
			case "medic": {
				_x setVariable ["ace_medical_medicClass", 1, true];
			};
			case "doctor": {
				_x setVariable ["ace_medical_medicClass", 2, true];
			};
		};
		
		[_x] spawn ACPL_MM_Core_fnc_AddMedicaments;
	} foreach _units;
};