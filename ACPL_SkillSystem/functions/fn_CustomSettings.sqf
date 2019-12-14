params [
	"_logic", 
	["_random", 2],
	["_acc", [0.2, 0.4]],
	["_shake", [0.2, 0.4]],
	["_speed", [0.2, 0.4]],
	["_spot", [0.4, 0.6]],
	["_time", [0.4, 0.6]],
	["_general", [0.4, 0.6]],
	["_courage", [0.4, 0.6]],
	["_reload", [0.2, 0.4]]
];

if (!isserver) exitwith {};

private _units = synchronizedObjects _logic;

_excluded = _excluded + _units;

ACPL_SkillSystem_Excluded = _excluded;

{
	private _acc_new = random [(_acc select 0), (((_acc select 0) + (_acc select 1))/_random), (_acc select 1)];
	private _shake_new = random [(_shake select 0), (((_shake select 0) + (_shake select 1))/_random), (_shake select 1)];
	private _speed_new = random [(_speed select 0), (((_speed select 0) + (_speed select 1))/_random), (_speed select 1)];
	private _spot_new = random [(_spot select 0), (((_spot select 0) + (_spot select 1))/_random), (_spot select 1)];
	private _time_new = random [(_time select 0), (((_time select 0) + (_time select 1))/_random), (_time select 1)];
	private _general_new = random [(_general select 0), (((_general select 0) + (_general select 1))/_random), (_general select 1)];
	private _courage_new = random [(_courage select 0), (((_courage select 0) + (_courage select 1))/_random), (_courage select 1)];
	private _reload_new = random [(_reload select 0), (((_reload select 0) + (_reload select 1))/_random), (_reload select 1)];
	
	//Set accuracy
	_unit setSkill ["aimingAccuracy", _acc];
	
	//Set aim shake
	_unit setSkill ["aimingShake", _shake];
	
	//Set aim speed
	_unit setSkill ["aimingSpeed", _speed];
	
	//Set spot distance
	_unit setSkill ["spotDistance", _spot];
	
	//Set spot time
	_unit setSkill ["spotTime", _time];
	
	//Set general
	_unit setSkill ["general", _general];
	
	//Set courage
	_unit setSkill ["courage", _courage];
	
	//Set reload
	_unit setSkill ["reloadSpeed", _reload];
} foreach _units;