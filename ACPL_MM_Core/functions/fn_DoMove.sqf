params ["_unit", "_pos", ["_object", ""], ["_point_on_move", false], ["_max_time", 0], ["_stuck_check", true]];

/*
	Basic function, 
	making unit to go in specific place and checking if unit has did not stop or change order
	
	Position may be a coordinates or object
	
	by [ACPL] Roman79
	v1.0
*/

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
private _notmoving = 0;

while {_onmove && (alive _unit)} do {
	//If pos is able to move
	if (_point_on_move) then {
		_pos = getposATL _object;
	};
	
	//If reached pos
	if ((getposATL _unit distance _pos) < 2) then {
		_onmove = false;
	};
	
	//If not having move order
	if (!(currentCommand _unit == "MOVE")) then {
		[_unit,_pos] remoteExec ["domove",0];
	};
	
	//If not moving
	if (speed _unit < 0.5) then {
		_notmoving = _notmoving + 1;
	} else {
		_notmoving = 0;
	};
	
	//If not moving for 10 sec
	if (_notmoving > 9) then {
		//check is causious
		if (_unit getvariable ["ace_isunconscious", false]) then {
			//if is then reseting timer
			_notmoving = 0;
		} else {
			//if is not and stuck_check enabled
			if (_stuck_check) then {
				private _pos_now = getposATL _unit;
				private _times = _notmoving - 9;
				
				//_unit setposATL [(_pos_now select 0),(_pos_now select 1),((_pos_now select 2) + (0.1 * _times))];
			};
		};
	};
	
	//timer check
	if (_timer) then {
		//if time passed
		if (time > _time) then {
			_onmove = false;
		};
	};
};

_unit setvariable ["ACPL_MM_Core_DoMove", false, true];

if (missionNamespace getVariable ["VCM_ActivateAI", false]) then {
	_unit setVariable ["VCOM_NOAI",false];
	_unit setVariable ["Vcm_Disable",false];
};
if (missionNamespace getVariable ["TCL_Initialize", false]) then {
	_unit setvariable ["TCL_Disabled",false];
};

_unit dofollow (leader (group _unit));