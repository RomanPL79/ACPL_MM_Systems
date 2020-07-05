params [
	["_unit", ObjNull]
];

if (time - (_unit getVariable ["ACPL_MM_DoStop_Roam_LastTime", 0]) < 60) exitwith {false};
if (isNil "ACPL_MM_Core_TakenPos") then {ACPL_MM_Core_TakenPos = [];};

private _random = random 100;
if (_random < 33) exitwith {true};

false