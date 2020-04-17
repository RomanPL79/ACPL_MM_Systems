params [
	["_medic", ObjNull],
	["_target", ObjNull]
];

if (_medic getVariable ["ACPL_Support_MedicBusy", false] || behaviour _medic == "COMBAT") exitwith {};

private _modifier = ACPL_Support_Heal_HealingModifer;
private _wounded_var = _target getvariable ["ace_medical_bodypartdamage", [0]];
private _wounded = 0;
{_wounded = _wounded + _x;} foreach _wounded_var;

private _rubbish_per_time = ACPL_Support_Heal_RubbishPerTime;
private _next_rubbish = 0;

private _bloodpressure = [_target] call ace_medical_status_fnc_getBloodPressure;
private _bloodpressure_l = _bloodpressure select 0;
private _bloodpressure_h = _bloodpressure select 1;

private _change_l = abs (80 - _bloodpressure_l);
private _change_h = abs (120 - _bloodpressure_h);

private _healing_time = (_wounded + _change_l + _change_h) * _modifier;
if (_target getvariable ["ace_isunconscious", false]) then {_healing_time = _healing_time + (_modifier * 5)};

if (_healing_time > _rubbish_per_time) then {_next_rubbish = time + _healing_time - 0.1;} else {_next_rubbish = time + _rubbish_per_time - 0.1;};

_medic setvariable ["ACPL_Support_MedicBusy", true, true];

private _veh = false;
if (!(vehicle _medic isEqualTo _medic)) then {_veh = true;};

if (_veh) then {
	private _time = time + _healing_time;
	
	if (alive _target && isPlayer _target) then {
		[localize "STR_ACPL_Support_healingstarted_veh"] remoteExec ["hint",_target];
	};
	
	WaitUntil {sleep 1;_time < time || !(_target in vehicle _medic)};
	
	if (alive _target && isPlayer _target && !(_target in vehicle _medic)) then {
		[localize "STR_ACPL_Support_healingstopped_veh"] remoteExec ["hint",_target];
	};
} else {
	[_medic, getpos _target] call ACPL_MM_Core_fnc_DoStop_DoMove;
	WaitUntil {sleep 1;!(_medic getvariable ["ACPL_MM_Core_DoMove", true])};
	
	if (_medic distance _target > 5) exitwith {_medic setvariable ["ACPL_Support_MedicBusy", false, true];}; 
	
	if (alive _target && isPlayer _target) then {
		[localize "STR_ACPL_Support_healingstarted"] remoteExec ["hint",_target];
	};

	_medic DisableAI "PATH";
	_medic setunitpos "MIDDLE";
	private _time = time + _healing_time;

	while {(alive _medic) && (alive _target) && (_time > time) && !(_medic getVariable ["ace_isunconscious", false]) && (_medic distance _target < 5)} do {
		[_medic, "Splint", false] call ACE_medical_ai_fnc_playTreatmentAnim;
		if (_next_rubbish < time) then {
			[getpos _medic] call ACPL_Support_fnc_medical_create_medicalrubbish;
			_next_rubbish = time + _rubbish_per_time - 0.1;
		};
		sleep 8;
	};
	
	if (alive _target && isPlayer _target && (_medic distance _target) > 5) then {
		[localize "STR_ACPL_Support_healingstopped"] remoteExec ["hint",_target];
	};
};

if (!(_medic getVariable ["ace_isunconscious", false]) && (alive _medic) && (alive _target) && (((_medic distance _target) < 5) || (_target in vehicle _medic))) then {
	[ObjNull, _target] call ace_medical_treatment_fnc_fullHeal;
	if (alive _target && isPlayer _target) then {
		[localize "STR_ACPL_Support_healed"] remoteExec ["hint",_target];
	};
};

_medic setvariable ["ACPL_Support_MedicBusy", false, true];

_medic EnableAI "PATH";
_medic setunitpos "AUTO";
