params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _objects = synchronizedObjects _logic;
	private _type = _logic getvariable ["ACPL_MM_Core_Custmomarker_type", "BUILDING"];
	
	{
		[_x, _type] call ACPL_MM_Core_fnc_CM_Mark;
	} foreach _objects + _synch;
};