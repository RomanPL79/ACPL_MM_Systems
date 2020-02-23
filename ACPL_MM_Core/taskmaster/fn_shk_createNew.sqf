params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _name = _logic getvariable ["ACPL_MM_Core_Taskmaster_CreateTask_name", ""];
	private _title = _logic getvariable ["ACPL_MM_Core_Taskmaster_CreateTask_title", ""];
	private _desc = _logic getvariable ["ACPL_MM_Core_Taskmaster_CreateTask_desc", ""];
	private _side = _logic getvariable ["ACPL_MM_Core_Taskmaster_CreateTask_side", ""];
	
	switch (_side) do {
		case "ALL": {
			[[_name,_title,_desc,true],SHK_Taskmaster_add] remoteExec ["call",0,true];
		};
		case "WEST": {
			[[_name,_title,_desc,WEST],SHK_Taskmaster_add] remoteExec ["call",0,true];
		};
		case "EAST": {
			[[_name,_title,_desc,EAST],SHK_Taskmaster_add] remoteExec ["call",0,true];
		};
		case "RESISTANCE": {
			[[_name,_title,_desc,RESISTANCE],SHK_Taskmaster_add] remoteExec ["call",0,true];
		};
		case "CIV": {
			[[_name,_title,_desc,CIVILIAN],SHK_Taskmaster_add] remoteExec ["call",0,true];
		};
		case "SYNCH": {
			private _s = synchronizedobjects _logic;
			[[_name,_title,_desc,[_x, _s] call {params ["_unit", "_list"];private _return = false;if (_unit in _list) then {_return = true;};_return}],SHK_Taskmaster_add] remoteExec ["call",0,true];
		};
	};
};