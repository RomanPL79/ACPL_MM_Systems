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

_selection = toLower _selection;
if (_selection in ["head"]) then {
	[_unit, _velocity] spawn ACPL_LooseHelmet_fnc_DropHelmet;
};
if (_selection in ["leftarm", "leftforearm", "rightforearm", "rightarm"]) then {
	[_unit, _velocity] spawn ACPL_LooseHelmet_fnc_DropWeapon;
};
