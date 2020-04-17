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
//
//switch _mode do {
	//placed in editor
//	case "init": {
//		if (is3DEN) exitWith {};
//		
//		_data params [
//			["_logic", ObjNull],
//			["_activated", false],
//			["_currator", false]
//		];
//		
//		if (!_activated) exitwith {};
//		private _groups = [];
//		private _speed = 50;
//		private _separation = 50;
//		private _push = false;
//		
//		if (_currator) then {
//			
//		} else {
//			_groups = [];
//			_speed = _logic getvariable "ACPL_MM_Core_Convoy_Create_speed";
//			_separation = _logic getvariable "ACPL_MM_Core_Convoy_Create_separation";
//			_push = _logic getvariable "ACPL_MM_Core_Convoy_Create_push";
//		};
//		
//		private _syncho = synchronizedObjects _logic;
//		
//		{
//			if (!(group _x in _groups) && (side _x != sideLogic)) then {
//				_groups = _groups + [group _x];
//			};
//		} foreach _syncho;
//		
//		{
//			[_x] spawn ACPL_MM_Core_fnc_Convoy_Set;
//		} foreach _groups;
//	};
//	
//	//atributes were changed
//	case "attributesChanged3DEN": {};
//	
//	//placed by zeus
//	case "registeredToWorld3DEN": {};
//	
//	//deleted
//	case "unregisteredFromWorld3DEN": {};
//	
//	//connection changed (placed on other unit, etc)
//	case "connectionChanged3DEN": {};
//	
//	//dragged
//	case "dragged3DEN": {};
//};

