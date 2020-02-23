params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _groups = [];
	private _syncho = synchronizedObjects _logic;
	
	{
		if (!(group _x in _groups) && (side _x != Logic)) then {
			_groups = _groups + [group _x];
		};
	} foreach _syncho;
	
	{
		_x setvariable ["ACPL_MM_Core_Convoy", false, true];
	} foreach _groups;
};