params [
	["_unit", ObjNull], 
	["_cointainter", ObjNull],
	["_opened", true]
];

private _destroyed = _cointainter getvariable ["ACPL_LooseHelmet_Destroyed", false];

if (_destroyed) exitwith {hint localize "STR_ACPL_LooseHelmet_act_destroyed_pickup";};

private _forbidden = _cointainter getvariable ["ACPL_LooseHelmet_WH_Forbidden", false];
private _dummy = _cointainter getvariable ["ACPL_LooseHelmet_WH_Dummy", ObjNull];

if (_forbidden) then {
	if (_opened) then {
		[_cointainter, true] remoteExec ["enableSimulation",0];
		[_dummy, true] remoteExec ["enableSimulation",0];
	} else {
		[_cointainter, false] remoteExec ["enableSimulation",0];
		[_dummy, false] remoteExec ["enableSimulation",0];


		if ((count weaponCargo _cointainter) == 0 && (count itemCargo _cointainter) == 0) then {
			deleteVehicle _dummy;
			deletevehicle _cointainter;
		};

		awm_sys_weaponItems = primaryWeaponItems player;
		if (!awm_sys_canChange) then {player switchMove "";};
	};
};