params ["_unit", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

if (!ACPL_LooseHelmet_Enabled || !(missionNamespace getVariable ["ACPL_LooseHelmet_Enable_module",true])) exitwith {};

_selection = _selection apply {toLower _x;};
if (count (_selection arrayIntersect ["head"]) > 0) then {
	[[_unit, _velocity], ACPL_LooseHelmet_fnc_DropHelmet] remoteExecCall ["call", _unit];
};
if (count (_selection arrayIntersect ["leftarm", "leftforearm", "rightforearm", "rightarm"]) > 0) then {
	[[_unit, _velocity], ACPL_LooseHelmet_fnc_DropWeapon] remoteExecCall ["call", _unit];
};
