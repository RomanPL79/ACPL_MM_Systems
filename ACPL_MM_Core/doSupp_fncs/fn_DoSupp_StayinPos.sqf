params [
	["_unit", ObjNull],
	["_stance", "UP"],
	["_action", "PlayerStand"]
];

//If has stoped suppressing or died then exit
if (
	!(_unit getvariable ["ACPL_MM_Core_DoSupp_Suppressing", false]) ||
	!(alive _unit)
) exitwith {};

//enforce position
_unit setUnitPos _stance;
_unit playAction _action;

//loop function
[{_this call ACPL_MM_Core_fnc_DoSupp_StayInPos;},[_unit, _stance, _action], 0.1] call CBA_fnc_waitAndExecute;