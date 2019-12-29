// ----------------------------------------------------------------------------
//	Function: ACPL_LooseHelmet_fnc_DropHelmet
//
//	Description: 	Function that is checking if helmet should be dropped and dropping it
//
//	Parameters: 
//		- unit			who should be checked
//		- velocity		velocity of bullet
//
//	Returns: nothing
//
//	Author: [ACPL] Roman79
//	
//	Version: 1
//	
//	Execution: spawn
//
//----------------------------------------------------------------------------

params ["_unit", "_velocity"];
private ["_weaponHolder0", "_moving", "_pos", "_vel", "_mass", "_dummy0"];

private _random = random 100;
if ((_random < ACPL_LooseHelmet_HelmetChance) AND !(_unit getvariable ["ACPL_LooseWeapon_fix_helmet", false])) then {

	private _helmet = headgear _unit;
	if (_helmet != "") then {
		private _nvg = hmd _unit;
		
		private _new_velocity = [(_velocity select 0)/75,(_velocity select 1)/75,(_velocity select 2)/14];
		private _torque = [(_velocity select 0)/100,(_velocity select 1)/100,0];
		
		private _med_velocity = (((_new_velocity select 0) + (_new_velocity select 1) + ((_new_velocity select 2) / 3)) / 3);
		
		private _mass = getNumber (configfile >> "CfgWeapons" >> _helmet >> "ItemInfo" >> "mass");
		
		private _weaponHolder = "GroundWeaponHolder_Scripted" createVehicle [0,0,0];
		_weaponHolder addItemCargoGlobal [_helmet,1];
		[_unit] remoteExec ["removeHeadgear",0];
			
		private _dummy = "ACPL_LooseHelmet_invisible_can" createVehicle [0,0,0];
		_dummy enableSimulationGlobal true;
		_dummy allowdamage false;
		
		_dummy setmass _mass;
		
		IF (_nvg != "") then {
			_dummy0 = "ACPL_LooseHelmet_invisible_can" createVehicle [0,0,0];
			_dummy0 enableSimulationGlobal true;
			_dummy0 allowdamage false;
			
			[_unit, _nvg] remoteExec ["unlinkItem",0];
			_weaponHolder0 = "GroundWeaponHolder_Scripted" createVehicle [0,0,0];
			_weaponHolder0 addItemCargoGlobal [_nvg,1];
			_weaponHolder0 attachTo [_dummy0, [-0.1,-0.62,-0.7]];
		};
		
		_weaponHolder attachTo [_dummy, [-0.1,-0.62,-0.7]]; 
		_weaponHolder setVectorDirAndUp [[0, 0, 0.5],[0, -0.5, -1]];

		IF ("STAND" == stance _unit )  then {
			_dummy setPos (_unit modelToWorld [0.02,0.05,1.7]); 
			IF (_nvg != "") then {_dummy0 setPos (_unit modelToWorld [0.02,0.05,1.73]);};
		};

		IF ("CROUCH" == stance _unit ) then {
			_dummy setPos (_unit modelToWorld [0.02,0.05,1.1]); 
			IF (_nvg != "") then {_dummy0 setPos (_unit modelToWorld [0.02,0.05,1.13]);};	
		};

		IF ("PRONE" == stance _unit ) then {
			_dummy setPos (_unit modelToWorld [0.02,0.75,0.4]); 
			IF (_nvg != "") then {_dummy0 setPos (_unit modelToWorld [0.02,0.75,0.43]);};
		};

		IF ("UNDEFINED" == stance _unit ) then {
			_dummy setPos (_unit modelToWorld [0.02,0.05,1.4]); 
			IF (_nvg != "") then {_dummy0 setPos (_unit modelToWorld [0.02,0.05,1.43]);};
		};

		_dummy setDir (getdir _unit);
		IF (_nvg != "") then {_dummy0 setDir (getdir _unit);};

		_dummy setVelocity _new_velocity;
		_dummy addTorque (_dummy vectorModelToWorld _torque);
		IF (_nvg != "") then {
			_dummy0 setVelocity [(random 1), (random 1), (random 3)];
			_dummy0 addTorque (_dummy vectorModelToWorld [(random 5), (random 1), 0]);
			
			[_dummy0, _weaponHolder0, _med_velocity] spawn {
				params ["_dummy", "_weaponholder", "_med_velocity"];
				private ["_vel", "_pos", "_moving"];
				
				_moving = true;
				
				while {_moving} do {
				
					_vel = velocity _dummy;
					_pos = getposATL _dummy;
					
					if (((_vel select 0 == 0) AND (_vel select 1 == 0) AND (_vel select 2 == 0)) OR (_pos select 2 < 0)) then {
						detach _weaponholder;
						_weaponholder enableSimulationGlobal true;
						deletevehicle _dummy;
						_weaponHolder setdir (getDir _weaponHolder);
						_weaponholder setposATL [(_pos select 0), (_pos select 1), 0];
						_weaponholder setVelocity [0,0,0];
						
						_moving = false;
					};
					
					sleep 0.05;
				};
				
				if (ACPL_LooseHelmet_Destroy) then {
					[_weaponholder, _med_velocity] call ACPL_LooseHelmet_fnc_Destroyed;
				};
			};
		};
		
		if (_nvg == "") then {
			[_unit, _weaponholder, "HELMET", _helmet] spawn ACPL_LooseHelmet_fnc_PickUp;
		} else {
			[_unit, _weaponholder, "HELMET", _helmet, true, _weaponHolder0, _nvg] spawn ACPL_LooseHelmet_fnc_PickUp;
		};
		
		_moving = true;
		
		while {_moving} do {
			
			_vel = velocity _dummy;
			_pos = getposATL _dummy;
			
			if (((_vel select 0 == 0) AND (_vel select 1 == 0) AND (_vel select 2 == 0)) OR (_pos select 2 < 0)) then {
				detach _weaponholder;
				_weaponholder enableSimulationGlobal true;
				deletevehicle _dummy;
				_weaponHolder setdir (getDir _weaponHolder);
				_weaponholder setposATL [(_pos select 0), (_pos select 1), 0];
				_weaponholder setVelocity [0,0,0];
				
				_moving = false;
			};
			
			sleep 0.05;
		};
		
		if (ACPL_LooseHelmet_Destroy) then {
			[_weaponholder, _med_velocity] call ACPL_LooseHelmet_fnc_Destroyed;
		};
	};
} else {
	if ((_random < ACPL_LooseHelmet_HelmetChance) && (ACPL_LooseHelmet_Enabled_Losenvgs) && (hmd _unit != "")) then {
		
		private _new_velocity = [(_velocity select 0)/75,(_velocity select 1)/75,(_velocity select 2)/14];
		private _torque = [(_velocity select 0)/100,(_velocity select 1)/100,0];
		
		private _nvg = hmd _unit;
		
		_dummy0 = "ACPL_LooseHelmet_invisible_can" createVehicle [0,0,0];
		_dummy0 enableSimulationGlobal true;
		_dummy0 allowdamage false;
			
		[_unit, _nvg] remoteExec ["unlinkItem",0];
		_weaponHolder0 = "GroundWeaponHolder_Scripted" createVehicle [0,0,0];
		_weaponHolder0 addItemCargoGlobal [_nvg,1];
		_weaponHolder0 attachTo [_dummy0, [-0.1,-0.62,-0.7]];
		
		IF ("STAND" == stance _unit )  then {
			_dummy0 setPos (_unit modelToWorld [0.02,0.05,1.73]);
		};

		IF ("CROUCH" == stance _unit ) then {
			_dummy0 setPos (_unit modelToWorld [0.02,0.05,1.13]);	
		};

		IF ("PRONE" == stance _unit ) then {
			_dummy0 setPos (_unit modelToWorld [0.02,0.75,0.43]);
		};

		IF ("UNDEFINED" == stance _unit ) then {
			_dummy0 setPos (_unit modelToWorld [0.02,0.05,1.43]);
		};
		
		_dummy0 setDir (getdir _unit);
		
		_dummy0 setVelocity [(random 1), (random 1), (random 3)];
		_dummy0 addTorque (_dummy vectorModelToWorld [(random 5), (random 1), 0]);
		
		[_unit, _weaponHolder0, "NVG", _nvg] spawn ACPL_LooseHelmet_fnc_PickUp;
		
		[_dummy0, _weaponHolder0] spawn {
			params ["_dummy", "_weaponholder"];
			private ["_vel", "_pos", "_moving"];
			
			_moving = true;
			
			while {_moving} do {
			
				_vel = velocity _dummy;
				_pos = getposATL _dummy;
				
				if (((_vel select 0 == 0) AND (_vel select 1 == 0) AND (_vel select 2 == 0)) OR (_pos select 2 < 0)) then {
					detach _weaponholder;
					_weaponholder enableSimulationGlobal true;
					deletevehicle _dummy;
					_weaponHolder setdir (getDir _weaponHolder);
					_weaponholder setposATL _pos;
					_weaponholder setVelocity [0,0,0];
					
					_moving = false;
				};
				
				sleep 0.05;
			};
			
			if (ACPL_LooseHelmet_Destroy) then {
				[_weaponholder, _med_velocity] call ACPL_LooseHelmet_fnc_Destroyed;
			};
		};
	};
};