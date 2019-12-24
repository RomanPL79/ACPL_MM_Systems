params ["_logic", "_random", "_change", "_overcast", "_rain", "_fog", "_fog_d", "_fog_a", "_thunder"];

if (!isserver) exitwith {};

[_random, _change, _overcast, _rain, _fog, _fog_d, _fog_a, _thunder] spawn {
	params ["_random", "_change", "_overcast", "_rain", "_fog", "_fog_d", "_fog_a", "_thunder"];
	
	while {true} do {
		
		private _r_change = random [(_change select 0), (((_change select 0) + (_change select 1)) / _random), (_change select 1)];
		
		private _r_overcast = random [(_overcast select 0), (((_overcast select 0) + (_overcast select 1)) / _random), (_overcast select 1)];
		private _r_rain = random [(_rain select 0), (((_rain select 0) + (_rain select 1)) / _random), (_rain select 1)];
		private _r_fog = random [(_fog select 0), (((_fog select 0) + (_fog select 1)) / _random), (_fog select 1)];
		private _r_fog_d = random [(_fog_d select 0), (((_fog_d select 0) + (_fog_d select 1)) / _random), (_fog_d select 1)];
		private _r_fog_a = random [(_fog_a select 0), (((_fog_a select 0) + (_fog_a select 1)) / _random), (_fog_a select 1)];
		private _r_thunder = random [(_thunder select 0), (((_thunder select 0) + (_thunder select 1)) / _random), (_thunder select 1)];
		
		[_r_change,_r_overcast] remoteExec ["setOvercast",2];
		[_r_change,_r_rain] remoteExec ["setRain",2];
		[_r_change,[_r_fog, _r_fog_d, _r_fog_a]] remoteExec ["setFog",2];
		[_r_change,_r_thunder] remoteExec ["setLightnings",2];
		
		sleep _r_change;
	};
};