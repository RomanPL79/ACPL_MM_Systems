/* ----------------------------------------------------------------------------
	Function: ACPL_LooseHelmet_fnc_GoPickUp

	Description: function that making AI unit pick up dropped weapon or item

	Parameters: 
		- unit 					unit who will pick up item
		- weaponhandler 		container from which item will be obtained
		- item class			class of item or weapon
		- type of item			type of item, one from: "GUN", "NVG", "HELMET"

	Returns: Nothing

	Author: [ACPL] Roman79
	
	Version: 1
	
	Execution: spawn

---------------------------------------------------------------------------- */

params [
	["_unit", ObjNull], 
	["_weaponhandler", ObjNull], 
	["_class", ""], 
	["_type", ""]
];

private _needToPick = [_unit, _type] call ACPL_LooseHelmet_fnc_NeedToPickUp;
if (!_needToPick || !(alive _unit)) exitwith {_unit setvariable ["ACPL_LooseHelmet_GoPickUp", false];};

//giving info about state of script

_unit setvariable ["ACPL_LooseHelmet_GoPickUp", false];
_unit setvariable ["ACPL_LooseHelmet_Busy", true];

//if wrong position then exit

if ((getposATL _weaponhandler) distance [0,0,0] < 2) exitwith {
	_unit setvariable ["ACPL_LooseHelmet_GoPickUp", true];
};

//if dostop is activated

if (_unit getvariable ["ACPL_MM_Core_DoStop_Enabled", false]) then {
	[_unit, false] spawn ACPL_MM_Core_fnc_DoStop_Prepare;
};

//making unit go to weaponhandler by another function and waiting

[_unit, getposATL _weaponhandler, _weaponhandler, true] spawn ACPL_MM_Core_fnc_DoMove;

WaitUntil {sleep 1;!(_unit getvariable ["ACPL_MM_Core_DoMove", false])};

//if weapon or item is destroyed informing script is done

if (_weaponhandler in ACPL_LooseHelmet_Destroyed) exitwith {
	_unit setvariable ["ACPL_LooseHelmet_GoPickUp", true];
};

//checking type of item and picking it up

switch (_type) do {
	case "GUN": {
		private _weap = _class select 0;
		[_unit,"PutDown"] remoteExec ["playAction",0];
		_unit action ["TakeWeapon", _weaponhandler, _weap];
		[_unit,_weap] remoteExec ["addWeapon",_unit];
		{
			[_unit,[_weap, _x]] remoteExec ["addWeaponItem",_unit];
		} foreach (_class - [_class select 0]);
		_unit setvariable ["ACPL_MM_Core_DoMove", true];
		deletevehicle _weaponhandler;
	};
	case "HELMET": {
		[_unit,"PutDown"] remoteExec ["playAction",0];
		deletevehicle _weaponhandler;
		[_unit,_class] remoteExec ["addHeadGear",0];
		_unit setvariable ["ACPL_MM_Core_DoMove", true];
	};
	case "NVG": {
		[_unit,"PutDown"] remoteExec ["playAction",0];
		deletevehicle _weaponhandler;
		[_unit,_class] remoteExec ["linkItem",0];
		_unit setvariable ["ACPL_MM_Core_DoMove", true];
	};
};

//ending script

_unit setvariable ["ACPL_LooseHelmet_GoPickUp", true];
_unit setvariable ["ACPL_MM_Core_DoMove", false];

//if DoStop then is returning to position

if (_unit getvariable ["ACPL_MM_Core_DoStop_Enabled", false]) then {
	private _pos = _unit getvariable ["ACPL_MM_Core_DoStop_actPos", (getPosATL _unit)];

	[_unit, _pos] spawn ACPL_MM_Core_fnc_DoStop_DoMove;
	
	WaitUntil {sleep 1;!(_unit getvariable ["ACPL_MM_Core_DoMove", false])};
	
	[_unit, true] spawn ACPL_MM_Core_fnc_DoStop_Prepare;
};

_unit setvariable ["ACPL_LooseHelmet_Busy", false];