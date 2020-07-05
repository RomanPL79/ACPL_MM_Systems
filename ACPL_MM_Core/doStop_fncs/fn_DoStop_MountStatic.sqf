params [
	["_unit", ObjNull]
];

private _statics = _unit nearEntities [["StaticWeapon", "Static", "Static Weapon"], 50];

_statics = _statics select {
	isNull (gunner _x) && 
	!(alive (_x getvariable ["ACPL_MM_Core_Static_Reserved", (gunner _x)])) &&
	count (magazines _x) > 0
};

if (count _statics == 0) exitwith {};

private _static = _statics select 0;
_static setVariable ["ACPL_MM_Core_Static_Reserved", _unit];
_unit setVariable ["ACPL_MM_DoStop_Busy", true];

ACPL_MM_Core_TakenPos deleteAt (ACPL_MM_Core_TakenPos find (_unit getVariable ["ACPL_MM_Core_DoStop_pos", (getposATL _unit)]));

_unit forcewalk false;
_unit assignAsGunner _static;
[_unit] orderGetIn true;

_unit enableAI "PATH";
_unit setUnitPos "AUTO";

_unit addEventHandler ["GetIn", {
	params ["", "", "_unit", ""];

	_unit setVariable ["ACPL_MM_DoStop_Busy", false];
	_unit removeEventHandler _thisEventHandler;
	private _data = _unit getVariable ["ACPL_MM_DoStop_Params", []];
	_data set [11, true];
	_unit setVariable ["ACPL_MM_DoStop_Params", _data];
}];

if (!(_static getvariable ["ACPL_MM_Core_DoStop_Reloaded_EH", false])) then {
	_static setvariable ["ACPL_MM_Core_DoStop_Reloaded_EH", true];
	_static addEventHandler ["Reloaded", {
		params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
		
		if (!((gunner _unit) in allPlayers)) then {
			[_unit,(_oldMagazine select 0)] remoteExec ["addmagazine",_unit];
		};
	}];
};