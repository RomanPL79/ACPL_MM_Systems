params ["_unit", "_weap", "_mode", ["_veh", false], ["_turret", [0]]];

_unit setvariable ["ACPL_MM_Core_DoSupp_Done", false, true];

switch (_veh) do {
	case true: {
		private _vehicle = vehicle _unit;
		switch (_mode) do {
			case "SINGLE": {
				_vehicle selectWeaponTurret [_weap, _turret];
				private _current_class = _vehicle currentMagazineTurret _turret;
				private _magazines = magazinesAmmoFull _vehicle;
				private _bullets = 0;
				
				{
					if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
				} foreach _magazines;
				
				if (_bullets == 1) then {
					_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
				};
				
				[_vehicle, _weap] call BIS_fnc_fire;
				
				sleep 0.1;
				
				_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
			};
			case "BURST": {
				private _vehicle = vehicle _unit;
				
				_vehicle selectWeaponTurret [_weap, _turret];
				private _current_class = currentMagazine _vehicle;
				private _bullets = 0;

				private _magazines = magazinesAmmoFull _vehicle;
				private _rof = (getNumber (configFile >> "cfgweapons" >> _weap >> "reloadTime"));
				
				private _toslow = false;
				
				if (_rof < 0.05) then {
					_rof = 0.05;
				};
				if (_rof > 10) then {
					_rof = 10;
					_toslow = true;
				};
				
				{
					if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
				} foreach _magazines;
				
				private _bc = 3;
				private _ea = _bc < _bullets;
				
				switch (_toslow) do {
					case true: {
						_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
						
						[_vehicle, _weap] call BIS_fnc_fire;
				
						sleep 0.1;
						
						_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
					};
					case false: {
						switch (_ea) do {
							case true: {
								for "_i" from 1 to _bc do {
									[_vehicle, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
							case false: {
								_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
								
								private _id = _vehicle addEventHandler ["Reloaded", {
									params ["_unit", "_weapon", "_muzzle", "_nmag", "_omag"];
									
									_unit setvariable ["ACPL_MM_Core_Reloaded", true, true];
								}];
								
								for "_i" from 1 to _bullets do {
									[_vehicle, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								WaitUntil {sleep 1;(_vehicle getvariable ["ACPL_MM_Core_Reloaded", false])};
								_vehicle setvariable ["ACPL_MM_Core_Reloaded", false, false];
								_vehicle removeEventHandler ["Reloaded", _id];
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
						};
					};
				};
			};
			case "BURST_R": {
				private _vehicle = vehicle _unit;
				
				_vehicle selectWeaponTurret [_weap, _turret];
				private _current_class = currentMagazine _vehicle;
				private _bullets = 0;

				private _magazines = magazinesAmmoFull _vehicle;
				private _rof = (getNumber (configFile >> "cfgweapons" >> _weap >> "reloadTime"));
				
				private _toslow = false;
				
				if (_rof < 0.05) then {
					_rof = 0.05;
				};
				if (_rof > 10) then {
					_rof = 10;
					_toslow = true;
				};
				
				{
					if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
				} foreach _magazines;
				
				private _bc = random [2, 3, 5];
				private _ea = _bc < _bullets;
				
				switch (_toslow) do {
					case true: {
						_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
						
						[_vehicle, _weap] call BIS_fnc_fire;
						
						sleep 0.1;
						
						_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
					};
					case false: {
						switch (_ea) do {
							case true: {
								for "_i" from 1 to _bc do {
									[_vehicle, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
							case false: {
								_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
								
								private _id = _vehicle addEventHandler ["Reloaded", {
									params ["_unit", "_weapon", "_muzzle", "_nmag", "_omag"];
									
									_unit setvariable ["ACPL_MM_Core_Reloaded", true, false];
								}];
								
								for "_i" from 1 to _bullets do {
									[_vehicle, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								WaitUntil {sleep 1;(_vehicle getvariable ["ACPL_MM_Core_Reloaded", false])};
								_vehicle setvariable ["ACPL_MM_Core_Reloaded", false, false];
								_vehicle removeEventHandler ["Reloaded", _id];
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
						};
					};
				};
			};
			case "FULLAUTO": {
				private _vehicle = vehicle _unit;
				
				_vehicle selectWeaponTurret [_weap, _turret];
				private _current_class = currentMagazine _vehicle;
				private _bullets = 0;

				private _magazines = magazinesAmmoFull _vehicle;
				private _rof = (getNumber (configFile >> "cfgweapons" >> _weap >> "reloadTime"));
				
				private _toslow = false;
				
				if (_rof < 0.05) then {
					_rof = 0.05;
				};
				if (_rof > 10) then {
					_rof = 10;
					_toslow = true;
				};
				
				{
					if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
				} foreach _magazines;
				
				private _bc = random [5, 10, 30];
				private _ea = _bc < _bullets;
				
				switch (_toslow) do {
					case true: {
						_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
						
						[_vehicle, _weap] call BIS_fnc_fire;
						
						sleep 0.1;
						
						_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
					};
					case false: {
						switch (_ea) do {
							case true: {
								for "_i" from 1 to _bc do {
									[_vehicle, _weap] call BIS_fnc_fire;
									sleep (random [0.01, 0.05, 0.1]);
								};
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
							case false: {
								_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
								
								private _id = _vehicle addEventHandler ["Reloaded", {
									params ["_unit", "_weapon", "_muzzle", "_nmag", "_omag"];
									
									_unit setvariable ["ACPL_MM_Core_Reloaded", true, false];
								}];
								
								for "_i" from 1 to _bullets do {
									[_vehicle, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								WaitUntil {sleep 1;(_vehicle getvariable ["ACPL_MM_Core_Reloaded", false])};
								_vehicle setvariable ["ACPL_MM_Core_Reloaded", false, false];
								_vehicle removeEventHandler ["Reloaded", _id];
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
						};
					};
				};
			};
		};
	};
	case false: {
		switch (_mode) do {
			case "SINGLE": {
				private _current_class = currentMagazine _unit;
				private _bullets = 0;

				private _magazines = magazinesAmmoFull _unit;
				
				{
					if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
				} foreach _magazines;
				
				[_unit, _weap] call BIS_fnc_fire;
				
				sleep 0.1;
				
				_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
			};
			case "BURST": {
				private _current_class = currentMagazine _unit;
				private _bullets = 0;

				private _magazines = magazinesAmmoFull _unit;
				private _rof = (getNumber (configFile >> "cfgweapons" >> _weap >> "reloadTime"));
				
				private _toslow = false;
				
				if (_rof < 0.05) then {
					_rof = 0.05;
				};
				if (_rof > 10) then {
					_rof = 10;
					_toslow = true;
				};
				
				{
					if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
				} foreach _magazines;
				
				private _bc = 3;
				private _ea = _bc < _bullets;
				
				switch (_toslow) do {
					case true: {
						_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
						
						[_vehicle, _weap] call BIS_fnc_fire;
						
						sleep 0.1;
						
						_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
					};
					case false: {
						switch (_ea) do {
							case true: {
								for "_i" from 1 to _bc do {
									[_unit, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
							case false: {
								private _id = _unit addEventHandler ["Reloaded", {
									params ["_unit", "_weapon", "_muzzle", "_nmag", "_omag"];
									
									_unit setvariable ["ACPL_MM_Core_Reloaded", true, false];
								}];
								
								for "_i" from 1 to _bullets do {
									[_unit, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								WaitUntil {sleep 1;(_unit getvariable ["ACPL_MM_Core_Reloaded", false])};
								_unit setvariable ["ACPL_MM_Core_Reloaded", false, false];
								_unit removeEventHandler ["Reloaded", _id];
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
						};
					};
				};
			};
			case "BURST_R": {
				private _current_class = currentMagazine _unit;
				private _bullets = 0;

				private _magazines = magazinesAmmoFull _unit;
				private _rof = (getNumber (configFile >> "cfgweapons" >> _weap >> "reloadTime"));
				
				private _toslow = false;
				
				if (_rof < 0.05) then {
					_rof = 0.05;
				};
				if (_rof > 10) then {
					_rof = 10;
					_toslow = true;
				};
				
				{
					if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
				} foreach _magazines;
				
				private _bc = random [2, 3, 5];
				private _ea = _bc < _bullets;
				
				switch (_toslow) do {
					case true: {
						_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
						
						[_vehicle, _weap] call BIS_fnc_fire;
						
						sleep 0.1;
						
						_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
					};
					case false: {
						switch (_ea) do {
							case true: {
								for "_i" from 1 to _bc do {
									[_unit, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
							case false: {
								private _id = _unit addEventHandler ["Reloaded", {
									params ["_unit", "_weapon", "_muzzle", "_nmag", "_omag"];
									
									_unit setvariable ["ACPL_MM_Core_Reloaded", true, false];
								}];
								
								for "_i" from 1 to _bullets do {
									[_unit, _weap] call BIS_fnc_fire;
									sleep _rof;
								};
								
								WaitUntil {sleep 1;(_unit getvariable ["ACPL_MM_Core_Reloaded", false])};
								_unit setvariable ["ACPL_MM_Core_Reloaded", false, false];
								_unit removeEventHandler ["Reloaded", _id];
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
						};
					};
				};
			};
			case "FULLAUTO": {
				private _current_class = currentMagazine _unit;
				private _bullets = 0;

				private _magazines = magazinesAmmoFull _unit;
				private _rof = (getNumber (configFile >> "cfgweapons" >> _weap >> "reloadTime"));
				
				private _toslow = false;
				
				if (_rof < 0.05) then {
					_rof = 0.05;
				};
				if (_rof > 10) then {
					_rof = 10;
					_toslow = true;
				};
				
				{
					if ((_x select 0 == _current_class) && (_x select 2)) then {_bullets = _x select 1;};
				} foreach _magazines;
				
				private _bc = random [5, 10, 30];
				private _ea = _bc < _bullets;
				
				switch (_toslow) do {
					case true: {
						_unit setvariable ["ACPL_MM_Core_DoSupp_Reload", true, true];
						
						[_vehicle, _weap] call BIS_fnc_fire;
						
						sleep 0.1;
						
						_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
					};
					case false: {
						switch (_ea) do {
							case true: {
								for "_i" from 1 to _bc do {
									[_unit, _weap] call BIS_fnc_fire;
									sleep (random [0.01, 0.05, 0.1]);
								};
								
								sleep 0.1;
								
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
							case false: {
								private _id = _unit addEventHandler ["Reloaded", {
									params ["_unit", "_weapon", "_muzzle", "_nmag", "_omag"];
									
									_unit setvariable ["ACPL_MM_Core_Reloaded", true, false];
								}];
								
								for "_i" from 1 to _bullets do {
									[_unit, _weap] call BIS_fnc_fire;
									sleep (random [0.01, 0.05, 0.1]);
								};
								
								WaitUntil {sleep 1;(_unit getvariable ["ACPL_MM_Core_Reloaded", false])};
								_unit setvariable ["ACPL_MM_Core_Reloaded", false, false];
								_unit removeEventHandler ["Reloaded", _id];
								
								sleep 0.1;
						
								_unit setvariable ["ACPL_MM_Core_DoSupp_Done", true, true];
							};
						};
					};
				};
			};
		};
	};
};