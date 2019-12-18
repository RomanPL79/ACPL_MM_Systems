params ["_unit", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

if ("head" in _selection) then {
	[_unit, _velocity] spawn ACPL_LooseHelmet_fnc_DropHelmet;
};
if (("leftarm" in _selection) OR ("leftforearm" in _selection) OR ("rightforearm" in _selection) OR ("rightarm" in _selection)) then {
	[_unit, _velocity] spawn ACPL_LooseHelmet_fnc_DropWeapon;
};