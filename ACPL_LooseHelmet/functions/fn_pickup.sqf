params [
	["_unit", objNull]
];

private _data = [_unit] call ACPL_LooseHelmet_fnc_lookforgun;

private _choosen = _data select 0;
private _weaponholder = _choosen select 0;
private _weapons = _choosen select 1;
private _weapon = _weapons select 0;
private _loosehelmet = _choosen select 2;

private _type = "CONTAINER";
if (_loosehelmet) then {_type = "GUN";};

[_unit, _weaponholder, _weapon, _type, false] spawn ACPL_LooseHelmet_fnc_GoPickUp;