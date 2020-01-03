params [
	"_logic",
	"_synch",
	"_activated"
];

WaitUntil {sleep 1;time > 2};

private _units = synchronizedObjects _logic;

if (_activated) then {
	{
		if (isNil "ACPL_MM_Core_Medicaments_Excluded") then {ACPL_MM_Core_Medicaments_Excluded = [];};
		
		ACPL_MM_Core_Medicaments_Excluded = ACPL_MM_Core_Medicaments_Excluded + [_x];
	} foreach _units;
};