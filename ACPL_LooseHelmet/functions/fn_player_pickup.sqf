params [
	["_wh", ObjNull],
	["_type", "NONE"],
	["_class", ""],
	["_dummy", ObjNull],
	["_w_type", ""]
];

private _text = "";
private _code = {};

switch (_type) do {
	case "HELMET": {
		_text = localize "STR_ACPL_LooseHelmet_act_helmet_pickup";
		_code = {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_arguments params ["_class", "_dummy"];
			
			if (headgear _caller == "") then {
				if (_target getvariable ["ACPL_LooseHelmet_Destroyed", false]) then {
					hint (localize "STR_ACPL_LooseHelmet_act_destroyed_pickup");
				} else {
					[_caller,_class] remoteExec ["addheadgear",_caller];
					[[_target,_actionId], BIS_fnc_holdActionRemove] remoteExec ["call",0];
					deletevehicle _target;
					deletevehicle _dummy;
				};
			} else {
				hint (localize "STR_ACPL_LooseHelmet_act_noplace_pickup");
			};
		};
	};
	case "NVG": {
		_text = localize "STR_ACPL_LooseHelmet_act_nvg_pickup";
		_code = {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_arguments params ["_class", "_dummy"];
			
			if (hmd _caller == "") then {
				if (_target getvariable ["ACPL_LooseHelmet_Destroyed", false]) then {
					hint (localize "STR_ACPL_LooseHelmet_act_destroyed_pickup");
				} else {
					[_caller,_class] remoteExec ["linkItem",_caller];
					[[_target,_actionId], BIS_fnc_holdActionRemove] remoteExec ["call",0];
					deletevehicle _target;
					deletevehicle _dummy;
				};
			} else {
				hint (localize "STR_ACPL_LooseHelmet_act_noplace_pickup");
			};
		};
	};
	case "WEAPON": {
		_text = localize "STR_ACPL_LooseHelmet_act_weapon_pickup";
		_code = {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_arguments params ["_class", "_dummy", "_w_type"];
			private _weapon = _class select 0;
			
			private _check = true;
			private _ammo = [_class select 4, _class select 5];
			private _attachments = [_class select 1, _class select 2, _class select 3, _class select 6];
			
			switch (_w_type) do {
				case "PRIMARY": {
					if (primaryWeapon _caller != "") then {_check = false;};
				};
				case "SECONDARY": {
					if (secondaryWeapon _caller != "") then {_check = false;};
				};
				case "HANDGUN": {
					if (handgunWeapon _caller != "") then {_check = false;};
				};
				case "BINOCULAR": {
					if (binocular _caller != "") then {_check = false;};
				};
			};
			
			if (_check) then {
				if (_target getvariable ["ACPL_LooseHelmet_Destroyed", false]) then {
					hint (localize "STR_ACPL_LooseHelmet_act_destroyed_pickup");
				} else {
					[_caller, _weapon] remoteExec ["addWeapon",_caller];
					{
						[_caller,[_weapon, _x, true]] remoteExec ["addWeaponItem",_caller];
					} foreach _ammo;
					switch (_w_type) do {
						case "PRIMARY": {
							{[_caller, _x] remoteExec ["addprimaryweaponitem",_caller];} foreach _attachments;
						};
						case "SECONDARY": {
							{[_caller, _x] remoteExec ["addsecondaryweaponitem",_caller];} foreach _attachments;
						};
						case "HANDGUN": {
							{[_caller, _x] remoteExec ["addhandgunitem",_caller];} foreach _attachments;
						};
					};
					[[_target,_actionId], BIS_fnc_holdActionRemove] remoteExec ["call",0];
					deletevehicle _target;
					deletevehicle _dummy;
				};
			} else {
				hint (localize "STR_ACPL_LooseHelmet_act_noplace_pickup");
			};
		};
	};
};

[
	[_wh,
	_text,
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"_this distance _target < 2",
	"true",
	{},
	{}, 
	_code,
	{},
	[_class, _dummy, _w_type],
	1,
	0,
	false,
	false,
	true],
BIS_fnc_holdActionAdd] remoteExec ["call", 0, true];