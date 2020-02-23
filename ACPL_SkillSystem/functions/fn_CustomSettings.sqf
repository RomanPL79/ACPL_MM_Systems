params [
	"_logic",
	"_synch",
	"_activated"
];

if (!isserver) exitwith {};

if (_activated) then {
	//Loading settings from module
	
	private _random = _logic getvariable ["custom_Random", 2];

	private _acc_0 = _logic getvariable ["custom_Acc_min", 0.2];
	private _acc_1 = _logic getvariable ["custom_Acc_max", 0.4];

	private _shake_0 = _logic getvariable ["custom_Shake_min", 0.2];
	private _shake_1 = _logic getvariable ["custom_Shake_max", 0.4];

	private _speed_0 = _logic getvariable ["custom_Speed_min", 0.2];
	private _speed_1 = _logic getvariable ["custom_Speed_max", 0.4];

	private _spot_0 = _logic getvariable ["custom_Spot_min", 0.4];
	private _spot_1 = _logic getvariable ["custom_Spot_max", 0.6];

	private _time_0 = _logic getvariable ["custom_Time_min", 0.4];
	private _time_1 = _logic getvariable ["custom_Time_max", 0.6];

	private _general_0 = _logic getvariable ["custom_General_min", 0.4];
	private _general_1 = _logic getvariable ["custom_General_max", 0.6];

	private _courage_0 = _logic getvariable ["custom_Courage_min", 0.4];
	private _courage_1 = _logic getvariable ["custom_Courage_max", 0.6];

	private _reload_0 = _logic getvariable ["custom_Reload_min", 0.2];
	private _reload_1 = _logic getvariable ["custom_Reload_max", 0.4];

	//checking synchronized units
	
	private _units = synchronizedObjects _logic;
	
	//adding units to excluded list
	
	if (isNil "ACPL_SkillSystem_Excluded") then {ACPL_SkillSystem_Excluded = [];};
	
	_excluded = ACPL_SkillSystem_Excluded + _units;

	ACPL_SkillSystem_Excluded = _excluded;
	
	//Waiting 10 sec after start of the mission
	
	waitUntil {sleep 1;time > 10};

	//configurating skill sets for synchronized units
	
	{
		//calculating randomized values
		
		private _acc_new = random [_acc_0, ((_acc_0 + _acc_1)/_random), _acc_1];
		private _shake_new = random [_shake_0, ((_shake_0 + _shake_1)/_random), _shake_1];
		private _speed_new = random [_speed_0, ((_speed_0 + _speed_1)/_random), _speed_1];
		private _spot_new = random [_spot_0, ((_spot_0 + _spot_1)/_random), _spot_1];
		private _time_new = random [_time_0, ((_time_0 + _time_1)/_random), _time_1];
		private _general_new = random [_general_0, ((_general_0 + _general_1)/_random), _general_1];
		private _courage_new = random [_courage_0, ((_courage_0 + _courage_1)/_random), _courage_1];
		private _reload_new = random [_reload_0, ((_reload_0 + _reload_1)/_random), _reload_1];
		
		//Set accuracy
		_x setSkill ["aimingAccuracy", _acc_new];
		
		//Set aim shake
		_x setSkill ["aimingShake", _shake_new];
		
		//Set aim speed
		_x setSkill ["aimingSpeed", _speed_new];
		
		//Set spot distance
		_x setSkill ["spotDistance", _spot_new];
		
		//Set spot time
		_x setSkill ["spotTime", _time_new];
		
		//Set general
		_x setSkill ["general", _general_new];
		
		//Set courage
		_x setSkill ["courage", _courage_new];
		
		//Set reload
		_x setSkill ["reloadSpeed", _reload_new];
	} foreach _units;

};