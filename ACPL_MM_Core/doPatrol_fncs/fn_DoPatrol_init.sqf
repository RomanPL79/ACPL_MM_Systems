params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _groups = [];
	private _custompoints = [];
	private _objects = synchronizedObjects _logic;
	
	private _roadsonly = _logic getvariable ["ACPL_MM_Core_DoPatrol_roadsonly", false];
	private _urbanonly = _logic getvariable ["ACPL_MM_Core_DoPatrol_urbanonly", false];
	private _combatexit = _logic getvariable ["ACPL_MM_Core_DoPatrol_combatexit", false];
	private _customonly = _logic getvariable ["ACPL_MM_Core_DoPatrol_customonly", false];
	private _distance = _logic getvariable ["ACPL_MM_Core_DoPatrol_distance", false];
	
	{
		if ((side (group _x) != sideLogic) && !((group _x) in _groups)) then {
			_groups = _groups + [group _x];
		};
		if ((side (group _x) == sideLogic) && !(_x getvariable ["ACPL_MM_Core_DoPatrol_area", false])) then {
			_custompoints = _custompoints + [_x];
		};
	} foreach _objects;
	
	{
		private _center = getposATL (leader _x);
		
		_x setvariable ["ACPL_MM_Core_DoPatrol", true, true];
		_x setvariable ["ACPL_MM_Core_DoPatrol_roadsonly", _roadsonly, true];
		_x setvariable ["ACPL_MM_Core_DoPatrol_urbanonly", _urbanonly, true];
		_x setvariable ["ACPL_MM_Core_DoPatrol_combatexit", _combatexit, true];
		_x setvariable ["ACPL_MM_Core_DoPatrol_customonly", _customonly, true];
		_x setvariable ["ACPL_MM_Core_DoPatrol_customareas", _custompoints, true];
		_x setvariable ["ACPL_MM_Core_DoPatrol_distance", _distance, true];
		_x setvariable ["ACPL_MM_Core_DoPatrol_center", _center, true];
		
		_x setvariable ["ACPL_MM_Core_DoPatrol_lastpos", _center];
		_x setvariable ["ACPL_MM_Core_DoPatrol_actpos", _center];
		
		[_x] spawn ACPL_MM_Core_fnc_DoPatrol;
	} foreach _groups;
};