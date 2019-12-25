params ["_unit", "_weaponhandler", "_class", "_type"];

_unit setvariable ["ACPL_LooseHelmet_GoPickUp", true];

[_unit, _weaponhandler, true] spawn ACPL_MM_Core_fnc_DoMove;

WaitUntil {sleep 1;_unit getvariable ["ACPL_MM_Core_DoMove", false];};

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

_unit setvariable ["ACPL_LooseHelmet_GoPickUp", false];