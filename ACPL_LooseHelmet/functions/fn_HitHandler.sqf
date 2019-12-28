/* ----------------------------------------------------------------------------
	Function: ACPL_LooseHelmet_fnc_HitHandler

	Description: 	Function that is executed after unit was shot, checking that unit was shot
					in head or arm and is executing another function if necessary

	Parameters: not important

	Returns: nothing

	Author: [ACPL] Roman79
	
	Version: 1
	
	Execution: not important

---------------------------------------------------------------------------- */

params ["_unit", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

if ("head" in _selection) then {
	[_unit, _velocity] spawn ACPL_LooseHelmet_fnc_DropHelmet;
};
if (("leftarm" in _selection) OR ("leftforearm" in _selection) OR ("rightforearm" in _selection) OR ("rightarm" in _selection)) then {
	[_unit, _velocity] spawn ACPL_LooseHelmet_fnc_DropWeapon;
};