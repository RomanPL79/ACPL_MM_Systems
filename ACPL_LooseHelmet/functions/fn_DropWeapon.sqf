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

private _items = ["", "", "", "", [], [], ""];

private _primary = false;

private _med_velocity = (((_velocity select 0) + (_velocity select 1) + (_velocity select 2)) / 3);

private _random = random 100;

if (alive _unit) then {
	private _type = "";
	private _weapon = currentWeapon _unit;
	if (_weapon == primaryweapon _unit) then {
		
	};
	switch (_weapon) do {
		case (primaryweapon _unit): {
			_primary = true;
			_type = "PRIMARY";
		};
		case (secondaryweapon _unit): {_type = "SECONDARY";};
		case (handgunweapon _unit): {_type = "HANDGUN";};
		case (binocular _unit): {_type = "BINOCULAR";};
	};
	
	private _new_velocity = [(random 2),(random 2),(random 1)];
	
	if (!(_random < ACPL_LooseHelmet_WeaponChance) && (_weapon == "")) exitwith {};
	if ((_primary) && (_unit getvariable ["ACPL_LooseWeapon_fix_gun",false])) exitwith {};
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
	
	private _class = [];
	
	[_unit,_weapon] remoteExec ["removeweapon",0];
	
	_weaponHolder_dummy attachto [_dummy,[0,0,0.6]];
	
	_weaponHolder_dummy addWeaponWithAttachmentsCargoGlobal [_items, 1];
	
	private _attachpos_dummy = _unit selectionPosition "weapon";
	_attachpos_dummy set [1, _attachpos_dummy select 1 + 0.3];
	
	_dummy setPos (_unit modelToWorld _attachpos_dummy);
	
	_dummy setDir (getDir _unit);
	
	_dummy setVelocity _new_velocity;
	
	private ["_pos", "_vel"];
	
	private _moving = true;
	private _time = time + 10;
	
	while {_moving} do {
		_vel = velocity _dummy;
		_pos = getposATL _dummy;
		if (((_vel select 0 == 0) && (_vel select 1 == 0) && (_vel select 2 == 0)) || time > _time) then {
			_dummy enableSimulationGlobal false;
			_weaponHolder_dummy enableSimulationGlobal true;
			[_dummy,true] remoteExec ["hideobject",0,true];
			
			[_weaponHolder_dummy, "WEAPON", _items, _dummy, _type] call ACPL_LooseHelmet_fnc_player_pickup;
			
			_moving = false;
		};
			
		sleep 0.05;
	};
	
	if (!(_unit in allplayers)) then {
		[_unit, _weaponHolder_dummy, "GUN", _items] spawn ACPL_LooseHelmet_fnc_PickUp;
	};
	
	if (ACPL_LooseHelmet_Destroy && random 100 < ACPL_LooseHelmet_DestroyChance) then {
		[_weaponHolder_dummy, true] call ACPL_LooseHelmet_fnc_Destroy;
	};
};