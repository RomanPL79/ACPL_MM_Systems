params ["_unit", "_pos", ["_point_on_move", false], ["_max_time", 0], ["_stuck_check", true]];

/*
	Basic function, 
	making unit to go in specific place and checking if unit has did not stop or change order
	
	Position may be a coordinates or object
	
	by [ACPL] Roman79
	v1.0
*/

private _object = "";

if (count _pos > 1) then {} else {
	_object = _pos;
	_pos = getposATL _object;
};

//getting basic info

private _start_time = time;
private _res_counter = 0;
private _last_pos = getposATL _unit;
private _time = _start_time;
private _timer = false;

//checking if time limitation is enabled

if (_max_time > 0) then {
	_time = _time + _max_time;
	_timer = true;
};

//giving info

_unit setvariable ["ACPL_MM_Core_DoMove", true, true];

//checking if _pos is ATL, when not setting z to 0;

private _z = 0;
if (isNil {_pos select 2} ) then {_pos = [(_pos select 0),(_pos select 1),_z];};

//checking if VCOM or TCL are enabled

if (missionNamespace getVariable ["VCM_ActivateAI", false]) then {
	_unit setVariable ["VCOM_NOAI",true];
	_unit setVariable ["Vcm_Disable",true];
};
if (missionNamespace getVariable ["TCL_Initialize", false]) then {
	_unit setvariable ["TCL_Disabled",true];
};

//giving order to move

[_unit,_pos] remoteExec ["domove",0];

//creating a loop

private _onmove = true;

while {_onmove && (alive _unit)} do {
	if (!(currentCommand _unit == "MOVE")) then {
		[_unit,_pos] remoteExec ["domove",0];
	};
};

_unit setvariable ["ACPL_MM_Core_DoMove", false, true];