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

params ["_unit", "_weaponhandler", "_class", "_type"];

//giving info about state of script

_unit setvariable ["ACPL_LooseHelmet_GoPickUp", true];

//making unit go to weaponhandler by another function and waiting

[_unit, getposATL _weaponhandler, _weaponhandler, true] spawn ACPL_MM_Core_fnc_DoMove;

WaitUntil {sleep 1;_unit getvariable ["ACPL_MM_Core_DoMove", false];};

//if weapon or item is destroyed informing script is done

if (_weaponhandler in ACPL_LooseHelmet_Destroyed) exitwith {
	_unit setvariable ["ACPL_LooseHelmet_GoPickUp", false];
};

//checking type of item and picking it up

switch (_type) do {
	case "GUN": {
		_unit action ["TakeWeapon", _weaponholder, _class];
	};
	case "HELMET": {
		[_unit,"PutDown"] remoteExec ["playAction",0];
		deletevehicle _weaponhandler;
		[_unit,_class] remoteExec ["addHeadGear",0];
	};
	case "NVG": {
		[_unit,"PutDown"] remoteExec ["playAction",0];
		deletevehicle _weaponhandler;
		[_unit,_class] remoteExec ["linkItem",0];
	};
};

//ending script

_unit setvariable ["ACPL_LooseHelmet_GoPickUp", false];