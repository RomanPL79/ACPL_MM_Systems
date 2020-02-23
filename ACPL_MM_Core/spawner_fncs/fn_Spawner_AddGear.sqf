params ["_unit", "_gear"];

[_unit] remoteExec ["removeuniform",_unit];
[_unit] remoteExec ["removevest",_unit];
[_unit] remoteExec ["removebackpack",_unit];
[_unit] remoteExec ["removeallweapons",_unit];
{[_unit, _x] remoteExec ["unlinkItem",_unit];} foreach (assignedItems _unit);
[_unit] remoteExec ["removeheadgear",_unit];
[_unit] remoteExec ["removegoggles",_unit];

private _uniform = _gear select 0;
private _u_items = _gear select 1;
private _vest = _gear select 2;
private _v_items = _gear select 3;
private _backpack = _gear select 4;
private _b_items = _gear select 5;
private _headgear = _gear select 6;
private _goggles = _gear select 7;
private _items = _gear select 8;

private _p_weap = _gear select 9;
private _s_weap = _gear select 10;
private _h_weap = _gear select 11;

private _p_items = _gear select 12;
private _s_items = _gear select 13;
private _h_items = _gear select 14;

private _face = _gear select 15;

[_unit,_uniform] remoteExec ["forceadduniform",_unit];
[_unit,_vest] remoteExec ["addvest",_unit];
[_unit,_backpack] remoteExec ["addbackpack",_unit];
[_unit,_headgear] remoteExec ["addheadgear",_unit];
[_unit,_goggles] remoteExec ["addgoggles",_unit];

[_unit,_p_weap] remoteExec ["addweapon",_unit];
[_unit,_s_weap] remoteExec ["addweapon",_unit];
[_unit,_h_weap] remoteExec ["addweapon",_unit];

{[_unit,_x] remoteExec ["addprimaryweaponitem",_unit];} foreach _p_items;
{[_unit,_x] remoteExec ["addsecondaryweaponitem",_unit];} foreach _s_items;
{[_unit,_x] remoteExec ["addhandgunitem",_unit];} foreach _h_items;

{[_unit,_x] remoteExec ["linkItem",_unit];} foreach _items;

{
	for "_i" from 1 to (_x select 1) do {
		[_unit,(_x select 0)] remoteExec ["additemtouniform",_unit];
	};
} foreach _u_items;
{
	for "_i" from 1 to (_x select 1) do {
		[_unit,(_x select 0)] remoteExec ["additemtovest",_unit];
	};
} foreach _v_items;
{
	for "_i" from 1 to (_x select 1) do {
		[_unit,(_x select 0)] remoteExec ["additemtobackpack",_unit];
	};
} foreach _b_items;

[_unit,_face] remoteExec ["setFace",0,true];