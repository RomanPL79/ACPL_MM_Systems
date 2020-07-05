params [
	["_unit", ObjNull], 
	["_list", []],
	["_duration", 60],
	["_vehicle", false]
];

//Checking is _unit has weapons if is in vehicle - if not then selecting gunner of vehicle
if (_vehicle) then {
	//Returning gunner turret path and getting it's weapons
	private _turrets = allTurrets vehicle _unit;
	private _turret = [];
	{
		if (vehicle _unit turretUnit _x == _unit) then {
			_turret = _x;
		};
	} foreach _turrets;
	private _weapons = vehicle _unit weaponsTurret _turret;

	//if turret has no weapons exit
	if (count _weapons == 0) exitwith {};
} else {
	//If _unit has no primary weapon or handgun and it's not in vehicle then exiting
	if (primaryweapon _unit == "" && handgunWeapon _unit == "") exitwith {};
};

//Exiting function if unit is not local or dead and also when unit already is suppressing
if (
	!(local _unit) || 
	(_unit getVariable ["ACPL_MM_Core_DoSupp_Suppressing", false]) ||
	!(alive _unit)
) exitwith {};

//Sending information about unit being suppressing
_unit setvariable ["ACPL_MM_Core_DoSupp_Suppressing", true];

//Preparing list - checking that is any unit from list being already under suppressing fire and if every unit is then using full list anyway
private _check = _list # {!((_x select 0) getVariable ["ACPL_MM_Core_DoSupp_Suppressed", false])};

if (count _check == 0 && count _list != 0) then {
	_list = _check;
};

//Selecting random target from list
private _selected = _list # floor(random(count _list));

//Getting info about selected target
_selected params ["_target", "", "", "_distance", "_positions"];

//Giving info to other units
_target setVariable ["ACPL_MM_Core_DoSupp_Suppressed", true];

//Disabling additional AI systems and stopping unit
_unit setVariable ["VCOM_NOAI",true];
_unit setVariable ["Vcm_Disable",true];
_unit setvariable ["TCL_Disabled",true];
_unit setVariable ["lambs_danger_disableAI",true];
if (_vehicle) then {
	vehicle _unit forcespeed 0;
} else {
	_unit forcespeed 0;
};

//Getting data about available stances for shooting target
private _position = "AUTO";
private _action = "";

//Selecting lowest stance
if (!("AUTO" in _positions)) then {
	if ("DOWN" in _positions) then {
		_position = "DOWN";
		_action = "PlayerProne";
	} else {
		if ("MIDDLE" in _positions) then {
			_position = "MIDDLE";
			_action = "PlayerCrouch";
		} else {
			if ("UP" in _positions) then {
				_position = "UP";
				_action = "PlayerProne";
			};
		};
	};
};

//Making sure unit will not change stance and changing behavior to combat
if (_position != "AUTO" && !_vehicle) then {
	[{_this call ACPL_MM_Core_fnc_DoSupp_StayInPos;}, [_unit, _position, _action], 0.1] call CBA_fnc_waitAndExecute;
};
_unit setBehaviour "COMBAT";

//Starting suppression loop if is not active for this machine or adding unit to loop
if !(missionNamespace getVariable ["ACPL_MM_Core_DoSupp_LoopActive", false]) then {
	ACPL_MM_Core_DoSupp_LoopActive = true;
	ACPL_MM_Core_DoSupp_LoopList = [];
	[{[] call ACPL_MM_Core_fnc_DoSupp_fnc_loop;}, [], 0.1] call CBA_fnc_waitAndExecute;
};
ACPL_MM_Core_DoSupp_LoopList pushback [_unit, _selected, _duration, _vehicle];
_unit setVariable ["ACPL_MM_Core_DoSupp_Ready", true];
_unit setVariable ["ACPL_MM_Core_DoSupp_Prepared", false];
_unit setVariable ["ACPL_MM_Core_DoSupp_LastFirePos", getpos _target];
_unit setVariable ["ACPL_MM_Core_DoSupp_MaxPrepare", time + _duration];