params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _groups = [];
	private _speed = _logic getvariable "ACPL_MM_Core_Convoy_Create_speed";
	private _separation = _logic getvariable "ACPL_MM_Core_Convoy_Create_separation";
	private _push = _logic getvariable "ACPL_MM_Core_Convoy_Create_push";
	
	private _syncho = synchronizedObjects _logic;
	
	{
		if (!(group _x in _groups) && (side _x != sideLogic)) then {
			_groups = _groups + [group _x];
		};
	} foreach _syncho;
	
	{
		[_x] spawn ACPL_MM_Core_fnc_Convoy_Set;
	} foreach _groups;
};