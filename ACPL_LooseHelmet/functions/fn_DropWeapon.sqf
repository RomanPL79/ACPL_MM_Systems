/* ----------------------------------------------------------------------------
	Function: ACPL_LooseHelmet_fnc_DropWeapon

	Description: 	Function that is checking if weapon should be dropped and dropping it

	Parameters: 
		- unit			who should be checked
		- velocity		velocity of bullet

	Returns: nothing

	Author: [ACPL] Roman79
	
	Version: 1
	
	Execution: spawn

---------------------------------------------------------------------------- */

params ["_unit", "_velocity"];
private ["_weapon", "_weaponsItems", "_new_velocity", "_weaponHolder_dummy", "_dummy"];

if (vehicle _unit != _unit) exitwith {};

private _items = [];

private _primary = false;

private _med_velocity = (((_velocity select 0) + (_velocity select 1) + (_velocity select 2)) / 3);

private _random = random 100;

if (alive _unit) then {
	private _weapon = currentWeapon _unit;
	if (_weapon == primaryweapon _unit) then {_primary = true;};
	
	private _new_velocity = [(random 2),(random 2),(random 1)];
	
	if ((_random < ACPL_LooseHelmet_WeaponChance) AND (_weapon != "")) then {
		
		if ((_primary) AND (_unit getvariable ["ACPL_LooseWeapon_fix_gun",false])) exitwith {};
		private _weaponHolder_dummy = "GroundWeaponHolder_Scripted" createVehicle [0,0,0];
		
		_weaponHolder_dummy enableSimulationGlobal true;
		
		private _dummy = "ACPL_LooseHelmet_invisible_can" createVehicle [0,0,0];
		_dummy enableSimulationGlobal true;
		_dummy allowdamage false;
		
		private _weaponsItems = weaponsItems _unit;
		{
			if ((_x select 0) == _weapon) then {
				_items = _x;
			};
		} foreach _weaponsItems;
		
		[_unit,_weapon] remoteExec ["removeweapon",0];
		
		_weapon = [_weapon] call BIS_fnc_baseWeapon;
		_weaponHolder_dummy attachto [_dummy,[0,0,0.6]];
		
		private _muzzle = "";
		private _flash = "";
		private _optic = "";
		private _magazine1 = "";
		private _magazine2 = "";
		private _bipod = "";
		
		if (count _items > 6) then
		{
			if ((_items select 1) != "") then {_muzzle = (_items select 1);};
			if ((_items select 2) != "") then {_flash = (_items select 2);};
			if ((_items select 3) != "") then {_optic = (_items select 3);};
			if ((_items select 4) != "") then {_magazine1 = (_items select 4);};
			if ((_items select 5) != "") then {_magazine2 = (_items select 5);};
			if ((_items select 6) != "") then {_bipod = (_items select 6);};
		} else {
			if ((_items select 1) != "") then {_muzzle = (_items select 1);};
			if ((_items select 2) != "") then {_flash = (_items select 2);};
			if ((_items select 3) != "") then {_optic = (_items select 3);};
			if ((_items select 4) != "") then {_magazine1 = (_items select 4);};
			if ((_items select 5) != "") then {_bipod = (_items select 5);};
		};
			
		_weaponHolder_dummy addWeaponWithAttachmentsCargoGlobal [[_weapon, _muzzle, _flash, _optic, _magazine1, _magazine2, _bipod], 1];
			
		If ("STAND" == stance _unit)  then {
			_dummy setPos (_unit modelToWorld [0,0.2,1.2]);
		};
		If ("CROUCH" == stance _unit) then {
			_dummy setPos (_unit modelToWorld [0,0.2,0.8]);
		};
		If ("PRONE" == stance _unit) then {
			_dummy setPos (_unit modelToWorld [0,0.7,0.2]); 
		};
		If ("UNDEFINED" == stance _unit) then {
			_dummy setPos (_unit modelToWorld [0,0.2,1.1]); 
		};
		
		_dummy setDir (getDir _unit);
		
		_dummy setVelocity _new_velocity;
		
		private ["_moving", "_pos", "_vel"];
		
		_moving = true;
		
		while {_moving} do {
			_vel = velocity _dummy;
			_pos = getposATL _dummy;
			if (((_vel select 0 == 0) AND (_vel select 1 == 0) AND (_vel select 2 == 0)) OR (_pos select 2 < 0)) then {
				_dummy setVelocity [0,0,0];
				_dummy enableSimulationGlobal false;
				
				detach _weaponHolder_dummy;
				_weaponHolder_dummy enableSimulationGlobal true;
				deletevehicle _dummy;
				
				_moving = false;
			};
				
			sleep 0.05;
		};
		
		if (!(_unit in allplayers)) then {
			[_unit, _weaponHolder_dummy, "GUN", _weapon] spawn ACPL_LooseHelmet_fnc_PickUp;
		};
		
		if (ACPL_LooseHelmet_Destroy) then {
			[_weaponHolder_dummy, _med_velocity] call ACPL_LooseHelmet_fnc_Destroyed;
		};
	};
};