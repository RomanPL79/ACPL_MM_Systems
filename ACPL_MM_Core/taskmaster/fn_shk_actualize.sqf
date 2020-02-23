params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _name = _logic getvariable ["ACPL_MM_Core_Taskmaster_UpdateTask_name", ""];
	private _status = _logic getvariable ["ACPL_MM_Core_Taskmaster_UpdateTask_status", ""];
	
	[[_name, _status],SHK_Taskmaster_upd] remoteExec ["call",0,true];
};