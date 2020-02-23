params [
	["_logic", objNull],
	["_synch", []],
	["_activated", false]
];

if (!isserver) exitwith {};

WaitUntil {sleep 1;time > 5};

//getting info for system

private _enable = _logic getvariable ["System_Enable", true];
private _reload = _logic getvariable ["System_Reload", true];

//geting info for west

private _w_enabled = _logic getvariable ["WEST_Enable", true];

private _w_random = _logic getvariable ["WEST_Random", 2];

private _w_acc_0 = _logic getvariable ["WEST_Acc_min", 0.2];
private _w_acc_1 = _logic getvariable ["WEST_Acc_max", 0.4];

private _w_shake_0 = _logic getvariable ["WEST_Shake_min", 0.2];
private _w_shake_1 = _logic getvariable ["WEST_Shake_max", 0.4];

private _w_speed_0 = _logic getvariable ["WEST_Speed_min", 0.2];
private _w_speed_1 = _logic getvariable ["WEST_Speed_max", 0.4];

private _w_spot_0 = _logic getvariable ["WEST_Spot_min", 0.4];
private _w_spot_1 = _logic getvariable ["WEST_Spot_max", 0.6];

private _w_time_0 = _logic getvariable ["WEST_Time_min", 0.4];
private _w_time_1 = _logic getvariable ["WEST_Time_max", 0.6];

private _w_general_0 = _logic getvariable ["WEST_General_min", 0.4];
private _w_general_1 = _logic getvariable ["WEST_General_max", 0.6];

private _w_courage_0 = _logic getvariable ["WEST_Courage_min", 0.4];
private _w_courage_1 = _logic getvariable ["WEST_Courage_max", 0.6];

private _w_reload_0 = _logic getvariable ["WEST_Reload_min", 0.2];
private _w_reload_1 = _logic getvariable ["WEST_Reload_max", 0.4];

//geting info for east

private _e_enabled = _logic getvariable ["EAST_Enable", true];

private _e_random = _logic getvariable ["EAST_Random", 2];

private _e_acc_0 = _logic getvariable ["EAST_Acc_min", 0.2];
private _e_acc_1 = _logic getvariable ["EAST_Acc_max", 0.4];

private _e_shake_0 = _logic getvariable ["EAST_Shake_min", 0.2];
private _e_shake_1 = _logic getvariable ["EAST_Shake_max", 0.4];

private _e_speed_0 = _logic getvariable ["EAST_Speed_min", 0.2];
private _e_speed_1 = _logic getvariable ["EAST_Speed_max", 0.4];

private _e_spot_0 = _logic getvariable ["EAST_Spot_min", 0.4];
private _e_spot_1 = _logic getvariable ["EAST_Spot_max", 0.6];

private _e_time_0 = _logic getvariable ["EAST_Time_min", 0.4];
private _e_time_1 = _logic getvariable ["EAST_Time_max", 0.6];

private _e_general_0 = _logic getvariable ["EAST_General_min", 0.4];
private _e_general_1 = _logic getvariable ["EAST_General_max", 0.6];

private _e_courage_0 = _logic getvariable ["EAST_Courage_min", 0.4];
private _e_courage_1 = _logic getvariable ["EAST_Courage_max", 0.6];

private _e_reload_0 = _logic getvariable ["EAST_Reload_min", 0.2];
private _e_reload_1 = _logic getvariable ["EAST_Reload_max", 0.4];

//get info for resistance

private _r_enabled = _logic getvariable ["RESISTANCE_Enable", true];

private _r_random = _logic getvariable ["RESISTANCE_Random", 2];

private _r_acc_0 = _logic getvariable ["RESISTANCE_Acc_min", 0.2];
private _r_acc_1 = _logic getvariable ["RESISTANCE_Acc_max", 0.4];

private _r_shake_0 = _logic getvariable ["RESISTANCE_Shake_min", 0.2];
private _r_shake_1 = _logic getvariable ["RESISTANCE_Shake_max", 0.4];

private _r_speed_0 = _logic getvariable ["RESISTANCE_Speed_min", 0.2];
private _r_speed_1 = _logic getvariable ["RESISTANCE_Speed_max", 0.4];

private _r_spot_0 = _logic getvariable ["RESISTANCE_Spot_min", 0.4];
private _r_spot_1 = _logic getvariable ["RESISTANCE_Spot_max", 0.6];

private _r_time_0 = _logic getvariable ["RESISTANCE_Time_min", 0.4];
private _r_time_1 = _logic getvariable ["RESISTANCE_Time_max", 0.6];

private _r_general_0 = _logic getvariable ["RESISTANCE_General_min", 0.4];
private _r_general_1 = _logic getvariable ["RESISTANCE_General_max", 0.6];

private _r_courage_0 = _logic getvariable ["RESISTANCE_Courage_min", 0.4];
private _r_courage_1 = _logic getvariable ["RESISTANCE_Courage_max", 0.6];

private _r_reload_0 = _logic getvariable ["RESISTANCE_Reload_min", 0.2];
private _r_reload_1 = _logic getvariable ["RESISTANCE_Reload_max", 0.4];

//getting synchronized units

private _units = synchronizedObjects _logic;

if (isNil "ACPL_SkillSystem_Excluded") then {ACPL_SkillSystem_Excluded = [];};

ACPL_SkillSystem_Excluded append _units;

ACPL_SkillSystem_Enabled = _enable;

//Enabling SkillSystem for sides

ACPL_SkillSystem_Enabled_West = _w_enabled;
ACPL_SkillSystem_Enabled_East = _e_enabled;
ACPL_SkillSystem_Enabled_Resistance = _r_enabled;

//Setting default variables for skill

//WEST
ACPL_SkillSystem_west_random = _w_random;

ACPL_SkillSystem_west_acc = [_w_acc_0, _w_acc_1];
ACPL_SkillSystem_west_shake = [_w_shake_0, _w_shake_1];
ACPL_SkillSystem_west_speed = [_w_speed_0, _w_speed_1];
ACPL_SkillSystem_west_spot = [_w_spot_0, _w_spot_1];
ACPL_SkillSystem_west_time = [_w_time_0, _w_time_1];
ACPL_SkillSystem_west_general = [_w_general_0, _w_general_1];
ACPL_SkillSystem_west_courage = [_w_courage_0, _w_courage_1];
ACPL_SkillSystem_west_reload = [_w_reload_0, _w_reload_1];

//EAST
ACPL_SkillSystem_east_random = _e_random;

ACPL_SkillSystem_east_acc = [_e_acc_0, _e_acc_1];
ACPL_SkillSystem_east_shake = [_e_shake_0, _e_shake_1];
ACPL_SkillSystem_east_speed = [_e_speed_0, _e_speed_1];
ACPL_SkillSystem_east_spot = [_e_spot_0, _e_spot_1];
ACPL_SkillSystem_east_time = [_e_time_0, _e_time_1];
ACPL_SkillSystem_east_general = [_e_general_0, _e_general_1];
ACPL_SkillSystem_east_courage = [_e_courage_0, _e_courage_1];
ACPL_SkillSystem_east_reload = [_e_reload_0, _e_reload_1];

//RESISTANCE
ACPL_SkillSystem_resistance_random = _r_random;

ACPL_SkillSystem_resistance_acc = [_r_acc_0, _r_acc_1];
ACPL_SkillSystem_resistance_shake = [_r_shake_0, _r_shake_1];
ACPL_SkillSystem_resistance_speed = [_r_speed_0, _r_speed_1];
ACPL_SkillSystem_resistance_spot = [_r_spot_0, _r_spot_1];
ACPL_SkillSystem_resistance_time = [_r_time_0, _r_time_1];
ACPL_SkillSystem_resistance_general = [_r_general_0, _r_general_1];
ACPL_SkillSystem_resistance_courage = [_r_courage_0, _r_courage_1];
ACPL_SkillSystem_resistance_reload = [_r_reload_0, _r_reload_1];

if (_reload || !(missionNamespace getVariable ["ACPL_SkillSystem_FirstChange", false])) then {
	[] call ACPL_SkillSystem_fnc_ReloadAll;
	ACPL_SkillSystem_FirstChange = true;
};
