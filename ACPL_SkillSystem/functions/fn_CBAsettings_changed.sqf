//This script converts strings to numbers and saves it to proper variables

if (!isserver) exitwith {};

//Setting default variables for skill

//If msc (old version, script only) is enabled then copy its settings instead of module's settings
if (missionNamespace getVariable ["ACPL_SkillSystem_msc", false]) exitwith {
	[] call ACPL_SkillSystem_fnc_mscCopy;
};

//WEST
ACPL_SkillSystem_west_random = parseNumber ACPL_SkillSystem_west_random_str;

ACPL_SkillSystem_west_acc = [parseNumber ACPL_SkillSystem_west_acc_min, parseNumber ACPL_SkillSystem_west_acc_max];
ACPL_SkillSystem_west_shake = [parseNumber ACPL_SkillSystem_west_shake_min, parseNumber ACPL_SkillSystem_west_shake_max];
ACPL_SkillSystem_west_speed = [parseNumber ACPL_SkillSystem_west_speed_min, parseNumber ACPL_SkillSystem_west_speed_max];
ACPL_SkillSystem_west_spot = [parseNumber ACPL_SkillSystem_west_spot_min, parseNumber ACPL_SkillSystem_west_spot_max];
ACPL_SkillSystem_west_time = [parseNumber ACPL_SkillSystem_west_time_min, parseNumber ACPL_SkillSystem_west_time_max];
ACPL_SkillSystem_west_general = [parseNumber ACPL_SkillSystem_west_general_min, parseNumber ACPL_SkillSystem_west_general_max];
ACPL_SkillSystem_west_courage = [parseNumber ACPL_SkillSystem_west_courage_min, parseNumber ACPL_SkillSystem_west_courage_max];
ACPL_SkillSystem_west_reload = [parseNumber ACPL_SkillSystem_west_reload_min, parseNumber ACPL_SkillSystem_west_reload_max];

//EAST
ACPL_SkillSystem_east_random = parseNumber ACPL_SkillSystem_east_random_str;

ACPL_SkillSystem_east_acc = [parseNumber ACPL_SkillSystem_east_acc_min, parseNumber ACPL_SkillSystem_east_acc_max];
ACPL_SkillSystem_east_shake = [parseNumber ACPL_SkillSystem_east_shake_min, parseNumber ACPL_SkillSystem_east_shake_max];
ACPL_SkillSystem_east_speed = [parseNumber ACPL_SkillSystem_east_speed_min, parseNumber ACPL_SkillSystem_east_speed_max];
ACPL_SkillSystem_east_spot = [parseNumber ACPL_SkillSystem_east_spot_min, parseNumber ACPL_SkillSystem_east_spot_max];
ACPL_SkillSystem_east_time = [parseNumber ACPL_SkillSystem_east_time_min, parseNumber ACPL_SkillSystem_east_time_max];
ACPL_SkillSystem_east_general = [parseNumber ACPL_SkillSystem_east_general_min, parseNumber ACPL_SkillSystem_east_general_max];
ACPL_SkillSystem_east_courage = [parseNumber ACPL_SkillSystem_east_courage_min, parseNumber ACPL_SkillSystem_east_courage_max];
ACPL_SkillSystem_east_reload = [parseNumber ACPL_SkillSystem_east_reload_min, parseNumber ACPL_SkillSystem_east_reload_max];

//RESISTANCE
ACPL_SkillSystem_resistance_random = parseNumber ACPL_SkillSystem_resistance_random_str;

ACPL_SkillSystem_resistance_acc = [parseNumber ACPL_SkillSystem_resistance_acc_min, parseNumber ACPL_SkillSystem_resistance_acc_max];
ACPL_SkillSystem_resistance_shake = [parseNumber ACPL_SkillSystem_resistance_shake_min, parseNumber ACPL_SkillSystem_resistance_shake_max];
ACPL_SkillSystem_resistance_speed = [parseNumber ACPL_SkillSystem_resistance_speed_min, parseNumber ACPL_SkillSystem_resistance_speed_max];
ACPL_SkillSystem_resistance_spot = [parseNumber ACPL_SkillSystem_resistance_spot_min, parseNumber ACPL_SkillSystem_resistance_spot_max];
ACPL_SkillSystem_resistance_time = [parseNumber ACPL_SkillSystem_resistance_time_min, parseNumber ACPL_SkillSystem_resistance_time_max];
ACPL_SkillSystem_resistance_general = [parseNumber ACPL_SkillSystem_resistance_general_min, parseNumber ACPL_SkillSystem_resistance_general_max];
ACPL_SkillSystem_resistance_courage = [parseNumber ACPL_SkillSystem_resistance_courage_min, parseNumber ACPL_SkillSystem_resistance_courage_max];
ACPL_SkillSystem_resistance_reload = [parseNumber ACPL_SkillSystem_resistance_reload_min, parseNumber ACPL_SkillSystem_resistance_reload_max];

//Informing about first load (prevents server configuration overwriting module settings)
ACPL_SkillSystem_firstconvertion = true;