params [
	"_logic", 
	["_enable", true],
	["_reload", false],
	["_west_enable", true],
	["_west_random", 2],
	["_west_acc", [0.2, 0.4]],
	["_west_shake", [0.2, 0.4]],
	["_west_speed", [0.2, 0.4]],
	["_west_spot", [0.4, 0.6]],
	["_west_time", [0.4, 0.6]],
	["_west_general", [0.4, 0.6]],
	["_west_courage", [0.4, 0.6]],
	["_west_reload", [0.2, 0.4]],
	["_east_enable", true],
	["_east_random", 2],
	["_east_acc", [0.2, 0.4]],
	["_east_shake", [0.2, 0.4]],
	["_east_speed", [0.2, 0.4]],
	["_east_spot", [0.4, 0.6]],
	["_east_time", [0.4, 0.6]],
	["_east_general", [0.4, 0.6]],
	["_east_courage", [0.4, 0.6]],
	["_east_reload", [0.2, 0.4]],
	["_resistance_enable", true],
	["_resistance_random", 2],
	["_resistance_acc", [0.2, 0.4]],
	["_resistance_shake", [0.2, 0.4]],
	["_resistance_speed", [0.2, 0.4]],
	["_resistance_spot", [0.4, 0.6]],
	["_resistance_time", [0.4, 0.6]],
	["_resistance_general", [0.4, 0.6]],
	["_resistance_courage", [0.4, 0.6]],
	["_resistance_reload", [0.2, 0.4]],
	["_excluded", []]
];

if (!isserver) exitwith {};

private _units = synchronizedObjects _logic;

_excluded = _excluded + _units;

ACPL_SkillSystem_Enabled = _enable;

//Enabling SkillSystem for sides

ACPL_SkillSystem_Enabled_West = _west_enable;
ACPL_SkillSystem_Enabled_East = _east_enable;
ACPL_SkillSystem_Enabled_Resistance = _resistance_enable;

//Setting default variables for skill

//If msc is enabled then copy its settings instead of module's settings
if (missionNamespace getVariable ["ACPL_SkillSystem_msc", false]) exitwith {
	[] call ACPL_SkillSystem_fnc_mscCopy;
	
	if (_reload) then {
		[] call ACPL_SkillSystem_fnc_ReloadAll;
	};
};

//WEST
ACPL_SkillSystem_west_random = _west_random;

ACPL_SkillSystem_west_acc = _west_acc;
ACPL_SkillSystem_west_shake = _west_shake;
ACPL_SkillSystem_west_speed = _west_speed;
ACPL_SkillSystem_west_spot = _west_spot;
ACPL_SkillSystem_west_time = _west_time;
ACPL_SkillSystem_west_general = _west_general;
ACPL_SkillSystem_west_courage = _west_courage;
ACPL_SkillSystem_west_reload = _west_reload;

//EAST
ACPL_SkillSystem_east_random = _east_enable;

ACPL_SkillSystem_east_acc = _east_acc;
ACPL_SkillSystem_east_shake = _east_shake;
ACPL_SkillSystem_east_speed = _east_speed;
ACPL_SkillSystem_east_spot = _east_spot;
ACPL_SkillSystem_east_time = _east_time;
ACPL_SkillSystem_east_general = _east_general;
ACPL_SkillSystem_east_courage = _east_courage;
ACPL_SkillSystem_east_reload = _east_reload;

//RESISTANCE
ACPL_SkillSystem_resistance_random = _resistance_enable;

ACPL_SkillSystem_resistance_acc = _resistance_acc;
ACPL_SkillSystem_resistance_shake = _resistance_shake;
ACPL_SkillSystem_resistance_speed = _resistance_speed;
ACPL_SkillSystem_resistance_spot = _resistance_spot;
ACPL_SkillSystem_resistance_time = _resistance_time;
ACPL_SkillSystem_resistance_general = _resistance_general;
ACPL_SkillSystem_resistance_courage = _resistance_courage;
ACPL_SkillSystem_resistance_reload = _resistance_reload;

ACPL_SkillSystem_Excluded = _excluded;

if (_reload) then {
	[] call ACPL_SkillSystem_fnc_ReloadAll;
};