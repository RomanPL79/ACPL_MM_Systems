params [
	["_ctrl", 0],
	["_selectedIndex", []],
	["_unit", ObjNull]
];

private _object = missionNameSpace getvariable ["ACPL_ACEgetAmmo_Vehicle", ObjNull];
if (isNull _object) exitwith {};
private _item = "";
private _itemID = 0;
private _itemsList = getItemCargo _object;

private _list = _itemsList # 0;
private _amount = _itemsList # 1;
private _text = lbText [(ctrlIDC _ctrl), _selectedIndex];

{
	private _configText = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
	if (_configText isEqualTo _text) exitwith {
		_item = _x;
		_itemID = _foreachindex;
	};
} foreach _list;

if (_item isEqualTo "") exitwith {};
private _value = getNumber (configFile >> "CfgWeapons" >> _item >> "ACPL_ACEgetAmmo" >> "ammo");
if (_value == 0) exitwith {};

private _limit = _object getVariable ["acpl_acegetammo_value", 0];
if (_limit isEqualTo 0) then {
	_limit = getNumber (configfile >> 'CfgVehicles' >> (typeOf _object) >> "ACPL_ACEgetAmmo" >> 'value');
};

if (_limit isEqualTo -1) exitwith {hint (localize "STR_ACPL_ACEgetAmmo_unlimited");};

_limit = _limit + _value;

_object setVariable ["acpl_acegetammo_value", _limit, true];

private _number = (_amount # _itemID) - 1;
if (_number isEqualTo 0) then {
	_list deleteAt _itemID;
	_amount deleteAt _itemID;
} else {
	_amount set [_itemID, _number];
};

clearItemCargoGlobal _object;
{
	_object addItemCargoGlobal [_x, (_amount # _foreachindex)];
} foreach _list;