params ["_unit", ["_sleep", 0.1], ["_custom", false]];

private _sunriseSunsetTime = date call BIS_fnc_sunriseSunsetTime;
private _sunrise = _sunriseSunsetTime select 0;
private _sunset = _sunriseSunsetTime select 1;
private _lightlevel = 0.5;

private _p = 1;
private _sre = _sunrise +_p;
private _srs = _sunrise -_p;
private _sss = _sunset -_p;
private _sse = _sunset +_p;

private _uniform = uniform _unit;

private _vest = vest _unit;

private _side = side _unit;

private _backpack = backpack _unit;

private _civilian = false;

private _camo = 0.75;

private _vest_m = 1.2;
private _backpack_m = 1.2;

private _novest = false;
private _noback = false;
private _noweap = false;

if ((str _uniform find "Combat" >=1) OR (str _uniform find "CTRG" >=1) OR (str _uniform find "Officer" >=1)) then {
	_camo = 0.45;
};
if ((str _uniform find "Ghillie" >=1) OR (str _uniform find "Sniper" >=1) OR (str _uniform find "Viper" >=1)) then {
	_camo = 0.35;
};
if ((str _uniform find "_civ_" >=1) OR (str _uniform find "citizen" >=1) OR (str _uniform find "U_C_" >=1) OR (str _uniform find "functionary" >=1) OR (str _uniform find "villager" >=1) OR (str _uniform find "woodlander" >=1) OR (str _uniform find "worker" >=1)) then {
	_camo = 1.2;
	_civilian = true;
};
if ((str _uniform find "U_MU_" >=1)) then {
	_camo = 0.8;
};
if ((str _uniform == "")) then {
	_camo = 1.2;
};

_unit setvariable ["ACPL_MM_Core_Camo", true, true];

if (ACPL_MM_Core_Camo_groupAI_enabled) then {
	private _units = units group _unit;
	
	{
		if (!(_x getvariable ["ACPL_MM_Core_Camo", false])) then {
			_x setvariable ["ACPL_MM_Core_Camo", true, true];
			[_x, ACPL_MM_Core_fnc_CalculateCamo, true] remoteExec ["spawn",2];
		};
	} foreach _units;
};

while {(_unit getvariable ["ACPL_MM_Core_Camo", false]) && (alive _unit) && ((_custom && !(isPlayer _unit) && !(_unit in allPlayers)) || (isPlayer _unit) || (_unit in allPlayers))} do {
	private _timenow = daytime;
	
	private _foglevel = linearconversion [0,1,fog,0,0.9,true];
	
	if (uniform _unit != _uniform) then {
		_camo = 0.75;
		
		_uniform = uniform _unit;
		
		if ((str _uniform find "Combat" >=1) OR (str _uniform find "CTRG" >=1) OR (str _uniform find "Officer" >=1)) then {
			_camo = 0.45;
			_civilian = false;
		};
		if ((str _uniform find "Ghillie" >=1) OR (str _uniform find "Sniper" >=1) OR (str _uniform find "Viper" >=1)) then {
			_camo = 0.35;
			_civilian = false;
		};
		if ((str _uniform find "_civ_" >=1) OR (str _uniform find "citizen" >=1) OR (str _uniform find "U_C_" >=1) OR (str _uniform find "functionary" >=1) OR (str _uniform find "villager" >=1) OR (str _uniform find "woodlander" >=1) OR (str _uniform find "worker" >=1)) then {
			_camo = 1.2;
			_civilian = true;
		};
		if ((str _uniform find "U_MU_" >=1)) then {
			_camo = 0.8;
			_civilian = false;
		};
		if ((str _uniform == "")) then {
			_camo = 1.2;
			_civilian = true;
		};
	};
	
	if (vest _unit != _vest) then {
		_vest = vest _unit;
		if (_vest == "") then {
			_vest_m = 0.6;
			if (_civilian) then {_novest = true;}
		} else {
			_vest_m = 1.2;
		};
	};
	
	if (backpack _unit != _backpack) then {
		_backpack = backpack _unit;
		if (_backpack == "") then {
			_backpack_m = 0.6;
			if (_civilian) then {_noback = true;}
		} else {
			_backpack_m = 1.2;
		};
	};
	
	private _speed_scaled = 0;
	
	if (vehicle _unit == _unit) then {
		private _speed = speed _unit;
		if (_speed < 0) then {_speed = _speed * -1};
		if (_speed == 0) then {
			_speed_scaled = 0;
		} else {
			_speed_scaled = 1 * (_speed / 25);
		};
	} else {
		_speed_scaled = 0;
	};
	
	private _lowered = weaponLowered _unit;
	if (_lowered) then {
		_lowered = 0.65;
	} else {
		_lowered = 1;
	};
	private _weapon = currentWeapon _unit;
	if (_weapon == "") then {
		_lowered = 0.2;
		_noweap = true;
	} else {
		_noweap = false;
	};
	
	private _windstrength = vectormagnitude wind;
	private _windscaled = linearconversion [0,7,_windstrength,0,0.9,true];
	
	private _rainLevel = linearconversion [0,1,rain,0,0.8,true];
	private _rainLevelA = linearconversion [0,1,rain,0,0.9,true];
	
	private _ntbh = count nearestterrainobjects [_unit,["Tree", "Bush", "Hide"],2.5,false,true];
	//set default tbh factor before if
	private _tbhf = 1;
	_ntbh = _ntbh / _tbhf;
	
	if ((_timenow >= 0) && (_timenow <=_srs)) then {
		_lightlevel = 0;
	};
	
	if ((_timenow >= _sse) && (_timenow <=24)) then {
		_lightlevel = 0;
	};
	
	if ((_timenow <= _sse) && (_timenow >=_sre)) then {
		_lightlevel = 1;
	};

	if ((_timenow >=_srs) && (_timenow <= _sre)) then {
		_lightlevel = 0.5 *(_timenow-_srs);
	};
	
	if ((_timenow >=_sss) && (_timenow <=_sse)) then {
		_lightlevel = -0.5 * (_timenow -(_sse));
	};
	
	private _lightlevelscaled = linearconversion [0,1,_lightlevel,0.05,1];
	
	private _overcastLevel = linearconversion [0,1,overcast,0,0.9,true];
	
	private _stanceresult = stance _unit;
	private _st = 1;
	private _stA = 0.5;
	
	switch (_stanceresult) do {
		case "STAND" : {_st = 1; _stA =1;};
		case "CROUCH" : {_st = 0.6; _stA=0.5;};
		case "PRONE" : {_st = 0.25; _stA =0.4;};
		case "SWIMMING": {_st = 0.75;_stA=0.5;};
		case "UNDEFINED" : {_st = 1;_stA=0;};
	};
	
	private _newCamCoef = (1 * ((_camo + _vest_m + _backpack_m) / 3)) * _lowered * _st * ((1.01 - _foglevel) * (1.01 - _rainLevel) * (1.01 - _overcastLevel) * _lightLevelscaled * _tbhf) / (1.5 - _speed_scaled);
	
	private _newCamCoefA = sqrt (
		(1-_foglevel) * (1 - _rainLevel) * (1 - _overcastLevel) * _stA * (1-_windscaled)
	);
	private _newCamCoefScaled = linearconversion [0,1,_newCamCoef,0,2,true];
	private _newaudibleCoefScaled = linearconversion [0,1,_newCamCoefA,0.05,2,true];
	
	[_unit,["camouflageCoef", _newcamCoefscaled]] remoteExec ["setUnitTrait",0];
	[_unit,["audibleCoef", _newaudibleCoefScaled]] remoteExec ["setUnitTrait",0];
	
	if (_civilian && _noback && _novest && _noweap && (((_unit getvariable ["ACPL_MM_Core_Camo_seen", -300]) + 300) < time)) then {
		if ([_unit, _side, 20] call ACPL_MM_Core_fnc_CheckEnemy) then {
			[_unit,false] remoteExec ["setcaptive",0];
			_unit setvariable ["ACPL_MM_Core_Camo_seen", time, true];
		} else {
			[_unit,true] remoteExec ["setcaptive",0];
		};
	};
	
	sleep _sleep;
};