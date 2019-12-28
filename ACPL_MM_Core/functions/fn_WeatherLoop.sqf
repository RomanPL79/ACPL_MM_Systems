params [
	"_logic",
	"_synch",
	"_activated"
];

if (!isserver) exitwith {};

if (_activated) then {

	WaitUntil {sleep 1;time > 5};

	private _random = _logic getvariable ["ACPL_MM_Core_Weather_random", 2];

	private _change_0 = _logic getvariable ["ACPL_MM_Core_Weather_changetimem_min", 10];
	private _change_1 = _logic getvariable ["ACPL_MM_Core_Weather_changetimem_max", 60];

	private _overcast_0 = _logic getvariable ["ACPL_MM_Core_Weather_overcast_min", 0];
	private _overcast_1 = _logic getvariable ["ACPL_MM_Core_Weather_overcast_max", 1];

	private _rain_0 = _logic getvariable ["ACPL_MM_Core_Weather_rain_min", 0];
	private _rain_1 = _logic getvariable ["ACPL_MM_Core_Weather_rain_max", 1];

	private _fog_0 = _logic getvariable ["ACPL_MM_Core_Weather_fog_min", 0];
	private _fog_1 = _logic getvariable ["ACPL_MM_Core_Weather_fog_max", 1];

	private _fog_d_0 = _logic getvariable ["ACPL_MM_Core_Weather_fog_d_min", -1];
	private _fog_d_1 = _logic getvariable ["ACPL_MM_Core_Weather_fog_d_max", 1];

	private _fog_a_0 = _logic getvariable ["ACPL_MM_Core_Weather_fog_a_min", -5000];
	private _fog_a_1 = _logic getvariable ["ACPL_MM_Core_Weather_fog_a_max", 5000];

	private _thunder_0 = _logic getvariable ["ACPL_MM_Core_Weather_thunder_min", 0];
	private _thunder_1 = _logic getvariable ["ACPL_MM_Core_Weather_thunder_max", 1];

	while {true} do {
		
		private _r_change = random [_change_0, ((_change_0 + _change_1) / _random), _change_1];
		
		_r_change = _r_change * 60;
		
		private _r_overcast = random [_overcast_0, ((_overcast_0 + _overcast_1) / _random), (_overcast_1)];
		private _r_rain = random [_rain_0, ((_rain_0 + _rain_1) / _random), _rain_1];
		private _r_fog = random [_fog_0, ((_fog_0 + _fog_1) / _random), _fog_1];
		private _r_fog_d = random [_fog_d_0, ((_fog_d_0 + _fog_d_1) / _random), _fog_d_1];
		private _r_fog_a = random [_fog_a_0, ((_fog_a_0 + _fog_a_1) / _random), _fog_a_1];
		private _r_thunder = random [_thunder_0, ((_thunder_0 + _thunder_1) / _random), _thunder_1];
		
		[_r_change,_r_overcast] remoteExec ["setOvercast",2];
		[_r_change,_r_rain] remoteExec ["setRain",2];
		[_r_change,[_r_fog, _r_fog_d, _r_fog_a]] remoteExec ["setFog",2];
		[_r_change,_r_thunder] remoteExec ["setLightnings",2];
		
		sleep _r_change;
	};
};