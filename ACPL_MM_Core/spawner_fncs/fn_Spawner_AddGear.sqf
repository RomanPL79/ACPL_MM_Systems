params [
	["_unit", ObjNull], 
	["_gear", []]
];

_gear params [
	"_uniform", 
	"_u_items", 
	"_vest", 
	"_v_items", 
	"_backpack", 
	"_b_items", 
	"_headgear", 
	"_goggles", 
	"_items", 
	"_p_weap", 
	"_s_weap", 
	"_h_weap",
	"_p_items",
	"_s_items",
	"_h_items",
	"_face"
];

removeUniform _unit;
removevest _unit;
removebackpack _unit;
removeallweapons _unit;
{_unit unlinkItem _x;} foreach (assignedItems _unit);
removeHeadgear _unit;
removegoggles _unit;

_unit forceadduniform _uniform;
_unit addvest _vest;
_unit addbackpack _backpack;
_unit addheadgear _headgear;
_unit addgoggles _goggles;

{_unit addWeapon _x;} foreach [_p_weap, _s_weap, _h_weap];

{_unit addprimaryweaponitem _x;} foreach _p_items;
{_unit addsecondaryweaponitem _x;} foreach _s_items;
{_unit addhandgunitem _x;} foreach _h_items;

{_unit linkItem _x;} foreach _items;

{
	for "_i" from 1 to (_x select 1) do {
		_unit additemtouniform (_x select 0);
	};
} foreach _u_items;
{
	for "_i" from 1 to (_x select 1) do {
		_unit additemtovest (_x select 0);
	};
} foreach _v_items;
{
	for "_i" from 1 to (_x select 1) do {
		_unit additemtobackpack (_x select 0);
	};
} foreach _b_items;

_unit setFace _face;