params [
	["_unit", ObjNull],
	["_reset", false]
];

if (!isserver) exitwith {};

private _random = 1;
private _acc = 1;
private _shake = 1;
private _speed = 1;
private _spot = 1;
private _time = 1;
private _general = 1;
private _courage = 1;
private _reload = 1;

WaitUntil {sleep 1;missionNamespace getVariable ["ACPL_SkillSystem_firstconvertion", false]};
WaitUntil {sleep 1;time > 5};

private _side = side _unit;

if (ACPL_SkillSystem_Enabled) then {
	
	//Checking is unit in excluded list
	if (_unit getvariable ["ACPL_SkillSystem_Excluded", false] || (_unit getvariable ["ACPL_SkillSystem_Done", false] && !_reset)) exitwith {};
	
	//Loading preset of skill depending on side
	
	switch (_side) do {
		case WEST: {
			if (ACPL_SkillSystem_Enabled_West) then {
				_random = ACPL_SkillSystem_west_random;
				_acc = random [(ACPL_SkillSystem_west_acc select 0), (((ACPL_SkillSystem_west_acc select 0) + (ACPL_SkillSystem_west_acc select 1))/_random), (ACPL_SkillSystem_west_acc select 1)];
				_shake = random [(ACPL_SkillSystem_west_shake select 0), (((ACPL_SkillSystem_west_shake select 0) + (ACPL_SkillSystem_west_shake select 1))/_random), (ACPL_SkillSystem_west_shake select 1)];
				_speed = random [(ACPL_SkillSystem_west_speed select 0), (((ACPL_SkillSystem_west_speed select 0) + (ACPL_SkillSystem_west_speed select 1))/_random), (ACPL_SkillSystem_west_speed select 1)];
				_spot = random [(ACPL_SkillSystem_west_spot select 0), (((ACPL_SkillSystem_west_spot select 0) + (ACPL_SkillSystem_west_spot select 1))/_random), (ACPL_SkillSystem_west_spot select 1)];
				_time = random [(ACPL_SkillSystem_west_time select 0), (((ACPL_SkillSystem_west_time select 0) + (ACPL_SkillSystem_west_time select 1))/_random), (ACPL_SkillSystem_west_time select 1)];
				_general = random [(ACPL_SkillSystem_west_general select 0), (((ACPL_SkillSystem_west_general select 0) + (ACPL_SkillSystem_west_general select 1))/_random), (ACPL_SkillSystem_west_general select 1)];
				_courage = random [(ACPL_SkillSystem_west_courage select 0), (((ACPL_SkillSystem_west_courage select 0) + (ACPL_SkillSystem_west_courage select 1))/_random), (ACPL_SkillSystem_west_courage select 1)];
				_reload = random [(ACPL_SkillSystem_west_reload select 0), (((ACPL_SkillSystem_west_reload select 0) + (ACPL_SkillSystem_west_reload select 1))/_random), (ACPL_SkillSystem_west_reload select 1)];
			};
		};
		case EAST: {
			if (ACPL_SkillSystem_Enabled_East) then {
				_random = ACPL_SkillSystem_east_random;
				_acc = random [(ACPL_SkillSystem_east_acc select 0), (((ACPL_SkillSystem_east_acc select 0) + (ACPL_SkillSystem_east_acc select 1))/_random), (ACPL_SkillSystem_east_acc select 1)];
				_shake = random [(ACPL_SkillSystem_east_shake select 0), (((ACPL_SkillSystem_east_shake select 0) + (ACPL_SkillSystem_east_shake select 1))/_random), (ACPL_SkillSystem_east_shake select 1)];
				_speed = random [(ACPL_SkillSystem_east_speed select 0), (((ACPL_SkillSystem_east_speed select 0) + (ACPL_SkillSystem_east_speed select 1))/_random), (ACPL_SkillSystem_east_speed select 1)];
				_spot = random [(ACPL_SkillSystem_east_spot select 0), (((ACPL_SkillSystem_east_spot select 0) + (ACPL_SkillSystem_east_spot select 1))/_random), (ACPL_SkillSystem_east_spot select 1)];
				_time = random [(ACPL_SkillSystem_east_time select 0), (((ACPL_SkillSystem_east_time select 0) + (ACPL_SkillSystem_east_time select 1))/_random), (ACPL_SkillSystem_east_time select 1)];
				_general = random [(ACPL_SkillSystem_east_general select 0), (((ACPL_SkillSystem_east_general select 0) + (ACPL_SkillSystem_east_general select 1))/_random), (ACPL_SkillSystem_east_general select 1)];
				_courage = random [(ACPL_SkillSystem_east_courage select 0), (((ACPL_SkillSystem_east_courage select 0) + (ACPL_SkillSystem_east_courage select 1))/_random), (ACPL_SkillSystem_east_courage select 1)];
				_reload = random [(ACPL_SkillSystem_east_reload select 0), (((ACPL_SkillSystem_east_reload select 0) + (ACPL_SkillSystem_east_reload select 1))/_random), (ACPL_SkillSystem_east_reload select 1)];
			};
		};
		case RESISTANCE: {
			if (ACPL_SkillSystem_Enabled_Resistance) then {
				_random = ACPL_SkillSystem_resistance_random;
				_acc = random [(ACPL_SkillSystem_resistance_acc select 0), (((ACPL_SkillSystem_resistance_acc select 0) + (ACPL_SkillSystem_resistance_acc select 1))/_random), (ACPL_SkillSystem_resistance_acc select 1)];
				_shake = random [(ACPL_SkillSystem_resistance_shake select 0), (((ACPL_SkillSystem_resistance_shake select 0) + (ACPL_SkillSystem_resistance_shake select 1))/_random), (ACPL_SkillSystem_resistance_shake select 1)];
				_speed = random [(ACPL_SkillSystem_resistance_speed select 0), (((ACPL_SkillSystem_resistance_speed select 0) + (ACPL_SkillSystem_resistance_speed select 1))/_random), (ACPL_SkillSystem_resistance_speed select 1)];
				_spot = random [(ACPL_SkillSystem_resistance_spot select 0), (((ACPL_SkillSystem_resistance_spot select 0) + (ACPL_SkillSystem_resistance_spot select 1))/_random), (ACPL_SkillSystem_resistance_spot select 1)];
				_time = random [(ACPL_SkillSystem_resistance_time select 0), (((ACPL_SkillSystem_resistance_time select 0) + (ACPL_SkillSystem_resistance_time select 1))/_random), (ACPL_SkillSystem_resistance_time select 1)];
				_general = random [(ACPL_SkillSystem_resistance_general select 0), (((ACPL_SkillSystem_resistance_general select 0) + (ACPL_SkillSystem_resistance_general select 1))/_random), (ACPL_SkillSystem_resistance_general select 1)];
				_courage = random [(ACPL_SkillSystem_resistance_courage select 0), (((ACPL_SkillSystem_resistance_courage select 0) + (ACPL_SkillSystem_resistance_courage select 1))/_random), (ACPL_SkillSystem_resistance_courage select 1)];
				_reload = random [(ACPL_SkillSystem_resistance_reload select 0), (((ACPL_SkillSystem_resistance_reload select 0) + (ACPL_SkillSystem_resistance_reload select 1))/_random), (ACPL_SkillSystem_resistance_reload select 1)];
			};
		};
	
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
	
	_unit setvariable ["ACPL_SkillSystem_Done", true];
};