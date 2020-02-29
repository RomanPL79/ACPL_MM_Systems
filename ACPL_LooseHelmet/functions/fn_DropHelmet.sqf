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

if (vehicle _unit != _unit) exitwith {};

private _weaponHolder_ap = [-0.1,-0.62,-0.7];
private _weaponHolder0_ap = [-0.1,-0.72,0.6];

private _random = random 100;
if ((_random < ACPL_LooseHelmet_HelmetChance) AND !(_unit getvariable ["ACPL_LooseWeapon_fix_helmet", false])) then {

	private _helmet = headgear _unit;
	if (_helmet != "") then {
		private _nvg = hmd _unit;
		
		private _new_velocity = [(_velocity select 0)/75,(_velocity select 1)/75,(_velocity select 2)/14];
		private _torque = [(_velocity select 0)/100,(_velocity select 1)/100,0];
		
		private _med_velocity = (((_new_velocity select 0) + (_new_velocity select 1) + ((_new_velocity select 2) / 3)) / 3);
		
		private _mass = getNumber (configfile >> "CfgWeapons" >> _helmet >> "ItemInfo" >> "mass");
		
		private _weaponHolder = "WeaponHolderSimulated_Scripted" createVehicle [0,0,0];
		_weaponHolder addItemCargoGlobal [_helmet,1];
		[_unit] remoteExec ["removeHeadgear",0];
		
		_weaponHolder setvariable ["ACPL_LooseHelmet_WH_Forbidden", true, true];
			
		private _dummy = "ACPL_LooseHelmet_invisible_can" createVehicle [0,0,0];
		_dummy enableSimulationGlobal true;
		_dummy allowdamage false;
		
		_dummy setmass _mass;
		
		if (_nvg != "") then {
			_dummy0 = "ACPL_LooseHelmet_invisible_can" createVehicle [0,0,0];
			_dummy0 enableSimulationGlobal true;
			_dummy0 allowdamage false;
			
			[_unit, _nvg] remoteExec ["unlinkItem",0];
			_weaponHolder0 = "WeaponHolderSimulated_Scripted" createVehicle [0,0,0];
			_weaponHolder0 addItemCargoGlobal [_nvg,1];
			_weaponHolder0 attachTo [_dummy0, _weaponHolder0_ap];
			
			[_weaponHolder0, _unit] remoteExecCall ["disableCollisionWith", 0];
			
			_weaponHolder0 setvariable ["ACPL_LooseHelmet_WH_Forbidden", true, true];
		};
		
		_weaponHolder attachTo [_dummy, _weaponHolder_ap]; 
		_weaponHolder setVectorDirAndUp [[0, 0, 0.5],[0, -0.5, -1]];
		
		private _attachpos_dummy = _unit selectionPosition "head";
		private _attachpos_dummy0 = _unit selectionPosition "head";
		_attachpos_dummy0 set [2, (_attachpos_dummy0 select 2) + 0.03];
		
		[_weaponHolder, _unit] remoteExecCall ["disableCollisionWith", 0];
		
		_dummy setPos (_unit modelToWorld _attachpos_dummy); 
		if (_nvg != "") then {_dummy0 setPos (_unit modelToWorld _attachpos_dummy0);};

		_dummy setDir (getdir _unit);
		if (_nvg != "") then {_dummy0 setDir (getdir _unit);};

		_dummy setVelocity _new_velocity;
		_dummy addTorque (_dummy vectorModelToWorld _torque);
		if (_nvg != "") then {
			_dummy0 setVelocity [(random 1), (random 1), (random 3)];
			_dummy0 addTorque (_dummy vectorModelToWorld [(random 5), (random 1), 0]);
			
			[_dummy0, _weaponHolder0, _med_velocity, _nvg] spawn {
				params ["_dummy", "_weaponholder", "_med_velocity", "_nvg"];
				private ["_vel", "_pos", "_moving"];
				
				_moving = true;
				
				private _time = time + 10;
				
				while {_moving} do {
				
					_vel = velocity _dummy;
					_pos = getposATL _dummy;
					
					if (((_vel select 0 == 0) && (_vel select 1 == 0) && (_vel select 2 == 0)) || (time > _time)) then {
						_dummy enableSimulationGlobal false;
						_weaponholder enableSimulationGlobal true;
						[_dummy,true] remoteExec ["hideobject",0,true];
						
						[_weaponholder, "NVG", _nvg, _dummy] call ACPL_LooseHelmet_fnc_player_pickup;
						
						_moving = false;
					};
					
					sleep 0.05;
				};
				
				if (ACPL_LooseHelmet_Destroy && random 100 < ACPL_LooseHelmet_DestroyChance) then {
					[_weaponholder, true] call ACPL_LooseHelmet_fnc_Destroy;
				};
			};
		};
		
		if (!(_unit in allplayers)) then {
			if (_nvg == "") then {
				[_unit, _weaponholder, "HELMET", _helmet] spawn ACPL_LooseHelmet_fnc_PickUp;
			} else {
				[_unit, _weaponholder, "HELMET", _helmet, true, _weaponHolder0, _nvg] spawn ACPL_LooseHelmet_fnc_PickUp;
			};
		};
		
		_moving = true;
		
		private _time = time + 10;
		
		while {_moving} do {
			
			_vel = velocity _dummy;
			_pos = getposATL _dummy;
			_wh_pos = getposATL _weaponHolder;
			
			if (((_vel select 0 == 0) && (_vel select 1 == 0) && (_vel select 2 == 0)) || (_time < time)) then {
				_dummy enableSimulationGlobal false;
				_weaponholder enableSimulationGlobal true;
				[_dummy,true] remoteExec ["hideobject",0,true];
				
				[_weaponholder, "HELMET", _helmet, _dummy] call ACPL_LooseHelmet_fnc_player_pickup;
					
				_moving = false;
			};
			
			sleep 0.05;
		};
		
		if (ACPL_LooseHelmet_Destroy && random 100 < ACPL_LooseHelmet_DestroyChance) then {
			[_weaponholder, true] call ACPL_LooseHelmet_fnc_Destroy;
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
		_weaponHolder0 = "WeaponHolderSimulated_Scripted" createVehicle [0,0,0];
		_weaponHolder0 addItemCargoGlobal [_nvg,1];
		_weaponHolder0 attachTo [_dummy0, _weaponHolder0_ap];
		
		_weaponHolder0 setvariable ["ACPL_LooseHelmet_WH_Forbidden", true, true];
		
		private _attachpos_dummy0 = _unit selectionPosition "head";
		_attachpos_dummy0 set [2, (_attachpos_dummy0 select 2) + 0.03];
		
		_dummy0 setPos (_unit modelToWorld _attachpos_dummy0);
		
		_dummy0 setDir (getdir _unit);
		
		_dummy0 setVelocity [(random 1), (random 1), (random 3)];
		_dummy0 addTorque (_dummy vectorModelToWorld [(random 5), (random 1), 0]);
		
		[_unit, _weaponHolder0, "NVG", _nvg] spawn ACPL_LooseHelmet_fnc_PickUp;
		
		[_dummy0, _weaponHolder0] spawn {
			params ["_dummy", "_weaponholder"];
			private ["_vel", "_pos", "_moving"];
			
			_moving = true;
			
			private _time = time + 10;
			
			while {_moving} do {
			
				_vel = velocity _dummy;
				_pos = getposATL _dummy;
				
				if (((_vel select 0 == 0) && (_vel select 1 == 0) && (_vel select 2 == 0)) || (_time < time)) then {
					_dummy enableSimulationGlobal false;
					_weaponholder enableSimulationGlobal true;
					[_dummy,true] remoteExec ["hideobject",0,true];
					
					[_weaponholder, "NVG", _nvg, _dummy] call ACPL_LooseHelmet_fnc_player_pickup;
					
					_moving = false;
				};
				
				sleep 0.05;
			};
			
			if (ACPL_LooseHelmet_Destroy && random 100 < ACPL_LooseHelmet_DestroyChance) then {
				[_weaponholder, true] call ACPL_LooseHelmet_fnc_Destroy;
			};
		};
	};
};