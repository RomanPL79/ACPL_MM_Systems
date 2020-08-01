/*
	ACPL_ACEGetAmmo_fnc_dialog_Create
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"

params [
	["_object", ObjNull],
	["_weapon", ""]
];

// Checks that display were created and data is provided
if (
	!createDialog "ACPL_ACEGetAmmo_GUI"
) exitwith {
	false
};

_name = localize "STR_ACPL_ACEGetAmmo_GetAmmo";
private _list = ([_weapon] call bis_fnc_compatibleMagazines) select {getNumber (configfile >> "CfgMagazines" >> _x >> "scope") == 2};
private _defaultMag = _list # 0;

// Gets display info and makes sure it's created
private _display = uiNamespace getVariable ["ACPL_ACEGetAmmo_GUI", -1];
if (isNull _display) exitwith {
	false
};
ACPL_ACEGetAmmo_Vehicle = _object;

// Creates calculate functions
private _calculate_x = {
	params ["_base", "_value"];
	
	_value / _base * safeZoneH / (4/3)
};
private _calculate_y = {
	params ["_base", "_value"];
	
	_value / _base * safeZoneH
};

// Gets colors data
private _colors = [
	[
		profileNamespace getVariable ["gui_bcg_rgb_r", 0.13],
		profileNamespace getVariable ["gui_bcg_rgb_g", 0.54],
		profileNamespace getVariable ["gui_bcg_rgb_b", 0.21],
		profileNamespace getVariable ["gui_bcg_rgb_a", 0.8]
	], [
		profileNamespace getVariable ["gui_titletext_rgb_r", 1],
		profileNamespace getVariable ["gui_titletext_rgb_g", 1],
		profileNamespace getVariable ["gui_titletext_rgb_b", 1],
		profileNamespace getVariable ["gui_titletext_rgb_a", 1]
	], [
		profileNamespace getVariable ["igui_bcg_rgb_r", 0.2],
		profileNamespace getVariable ["igui_bcg_rgb_g", 0.2],
		profileNamespace getVariable ["igui_bcg_rgb_b", 0.2],
		profileNamespace getVariable ["igui_bcg_rgb_a", 0.4]
	]
];

// Defines size of elements
private _element_width = 100;
private _element_height = 5;
private _element_spacer = 0.5;
private _element_divider = 2;
private _base = 150;
private _slider_width = 16;
private _fontSize = [_base, (_element_height / 2)] call _calculate_y;

// Gets basic placement data
private _height = 4 * ([_base, (_element_height + _element_spacer)] call _calculate_y);
private _posX = 0.5 - (([_base, (_element_height + _element_width)] call _calculate_x) / 2);
private _posY = 0.5 - (_height / 2);

// Creates frame
private _frame = _display ctrlCreate ["RscText", -1];
_frame ctrlSetBackgroundColor (_colors # 2);
_frame ctrlSetPosition [_posX, 0.5 - (_height / 2), [_base, (_element_width)] call _calculate_x, _height];
_frame ctrlCommit 0;

// Creates Header
private _header = _display ctrlCreate ["RscText", -1, _frame];
_header ctrlSetText _name;
_header ctrlSetFontHeight (_fontSize * 2);
_header ctrlSetPosition [_posX, _posY, ([_base, _element_width] call _calculate_x), ([_base, 5] call _calculate_y)];
_header ctrlSetBackgroundColor (_colors # 0);
_header ctrlCommit 0;

// Creates elements
private _elements = [];

// Adds information about actual ammo limit
private _ammoLimit = _object getVariable ["ace_rearm_currentsupply", 0];

_posY = _posY + ([_base, (_element_height + _element_spacer)] call _calculate_y);
private _pos_label_0 = [
	_posX + ([_base, _element_height] call _calculate_y), 
	_posY + ([_base, (_element_height / 2)] call _calculate_y), 
	([_base, (_element_width / 2)] call _calculate_x),
	([_base, (_element_height / _element_divider)] call _calculate_y)
];
	
private _label_0 = _display ctrlCreate ["RscText", -1, _frame];
_label_0 ctrlSetPosition _pos_label_0;
_label_0 ctrlSetFontHeight (_fontSize * 1.2);
_label_0 ctrlSetText (localize "STR_ACPL_ACEGetAmmo_GetAmmo_hint");
_label_0 ctrlSetTooltip (localize "STR_ACPL_ACEGetAmmo_GetAmmo_hint_tooltip");
_label_0 ctrlCommit 0;

private _pos_label_0a = [
	_posX + ([_base, (_element_width / 2)] call _calculate_x), 
	_posY + ([_base, (_element_height / 2)] call _calculate_y), 
	([_base, (_element_width / 2)] call _calculate_x),
	([_base, (_element_height / _element_divider)] call _calculate_y)
];

private _label_0a = _display ctrlCreate ["RscText", -1, _frame];
_label_0a ctrlSetPosition _pos_label_0a;
_label_0a ctrlSetFontHeight (_fontSize * 1.7);
_label_0a ctrlSetText str(_ammoLimit);
_label_0a ctrlSetTooltip (localize "STR_ACPL_ACEGetAmmo_GetAmmo_hint_tooltip");
_label_0a ctrlCommit 0;

// Creates List
_posY = _posY + ([_base, (_element_height + _element_spacer)] call _calculate_y);
private _pos_list = [
	_posX + ([_base, (_element_width / 2)] call _calculate_x), 
	_posY + ([_base, (_element_height / 2)] call _calculate_y), 
	([_base, (_element_width / 2)] call _calculate_x),
	([_base, (_element_height / _element_divider)] call _calculate_y)
];

private _element_list = _display ctrlCreate ["RscCombo", -1, _frame];
{
	_element_list lbAdd _x;
	private _picture = getText (configfile >> "CfgMagazines" >> _x >> "picture");
	private _cost = getNumber (configFile >> "CfgMagazines" >> _x >> "ACPL_GetAmmo" >> "cost");
	private _name = getText (configfile >> "CfgMagazines" >> _x >> "displayName");
	_element_list lbSetPicture [_forEachIndex, _picture];
	_element_list lbSetTooltip [_forEachIndex, (localize "STR_ACPL_ACEGetAmmo_GetAmmo_cost" + str(_cost))];
	_element_list lbSetText [_forEachIndex, _name];
	_element_list lbSetData [_forEachIndex, _x];
} foreach _list;
_element_list ctrlSetPosition _pos_list;
_element_list ctrlSetTooltip _tooltip;
_element_list lbSetCurSel 0;

_element_list ctrlAddEventHandler ["LBSelChanged", {
	params ["_element", "_index"];

	private _slider = _element getvariable ["ACPL_ACEGetAmmo_Slider", -1];
	private _magazine = _element lbData _index;
	private _ammo = ACPL_ACEGetAmmo_Vehicle getVariable ["ace_rearm_currentsupply", 0];
	private _value = getNumber (configFile >> "CfgMagazines" >> _magazine >> "ACPL_GetAmmo" >> "cost");

	private _max = floor (_ammo / _value);

	_slider sliderSetRange [1, _max];
	_slider ctrlCommit 0;
}];

private _pos_label_1 = [
	_posX + ([_base, _element_height] call _calculate_y), 
	_posY + ([_base, (_element_height / 2)] call _calculate_y), 
	([_base, (_element_width / 2)] call _calculate_x),
	([_base, (_element_height / _element_divider)] call _calculate_y)
];
	
private _label_1 = _display ctrlCreate ["RscText", -1, _frame];
_label_1 ctrlSetPosition _pos_label_1;
_label_1 ctrlSetFontHeight _fontSize;
_label_1 ctrlSetText (localize "STR_ACPL_ACEGetAmmo_label_1_text");
_label_1 ctrlSetTooltip (localize "STR_ACPL_ACEGetAmmo_label_1_tooltip");
_label_1 ctrlCommit 0;

// Creates Slider and overrides base Y position
_posY = _posY + ([_base, (_element_height + _element_spacer)] call _calculate_y);
private _pos = [
	_posX + ([_base, (_element_width / 2)] call _calculate_x), 
	_posY + ([_base, (_element_height / 2)] call _calculate_y), 
	([_base, (_element_width / 2 - (_element_spacer * _slider_width))] call _calculate_x),
	([_base, (_element_height / _element_divider)] call _calculate_y)
];
private _value = getNumber (configFile >> "CfgMagazines" >> _defaultMag >> "ACPL_GetAmmo" >> "cost");
private _max = floor (_ammoLimit / _value);
			
private _element = _display ctrlCreate ["ctrlXSliderH", -1, _frame];
_element ctrlSetPosition _pos;
_element sliderSetRange [1, _max];
_element sliderSetSpeed [0.01, 0.1];
_element sliderSetPosition _default;

// Creates TextField
private _pos_textField = [
	_posX + ([_base, (_element_width - _element_spacer * (_slider_width - 1))] call _calculate_x), 
	_posY + ([_base, (_element_height / 2)] call _calculate_y), 
	([_base, (_element_spacer * (_slider_width - 2))] call _calculate_x),
	([_base, (_element_height / _element_divider)] call _calculate_y)
];

private _textField = _display ctrlCreate ["RscEdit", -1, _frame];
_textField ctrlSetPosition _pos_textField;
_textField ctrlSetText "1";

// Links TextField and Slider and saves information about max and min value
_element setvariable ["ACPL_ACEGetAmmo_GUI_Slider", _textField];
_element setvariable ["ACPL_ACEGetAmmo_GUI_Slider_range", _range];
_textField setvariable ["ACPL_ACEGetAmmo_GUI_Slider", _element];
_element_list setvariable ["ACPL_ACEGetAmmo_Slider", _element];

// Adds eventHandlers for slider
_element ctrlAddEventHandler ["SliderPosChanged", {
	params ["_element", "_value"];

	private _textField = _element getvariable ["ACPL_ACEGetAmmo_GUI_Slider", -1];
	_value = floor _value;
	_textField ctrlSetText str(_value);
	_textField ctrlCommit 0;
}];
_element ctrlAddEventHandler ["KillFocus", {
	params ["_element"];

	private _textField = _element getvariable ["ACPL_ACEGetAmmo_GUI_Slider", -1];
	private _value = ctrlText _element;

	if (typeName _value isEqualTo "STRING") then {
		_value = floor (parseNumber _value);
	};

	_element sliderSetPosition _value;
	_element ctrlCommit 0;
}];

// Adds eventHandlers for textField
_textField ctrlAddEventHandler ["KeyUp", {
	params ["_textField"];

	private _element = _textField getvariable ["ACPL_ACEGetAmmo_GUI_Slider", -1];
	private _range = _element getvariable ["ACPL_ACEGetAmmo_GUI_Slider_range", [0,0]];
	private _value = floor (parseNumber (ctrlText _textField));
	if (_value < (_range # 0)) then {
		_value = (_range # 0);
	};
	if (_value > (_range # 1)) then {
		_value = (_range # 1);
	};

	_element sliderSetPosition _value;
    _element ctrlCommit 0;
}];
_textField ctrlAddEventHandler ["KillFocus", {
	params ["_textField"];

	private _element = _textField getvariable ["ACPL_ACEGetAmmo_GUI_Slider", -1];
	private _range = _element getvariable ["ACPL_ACEGetAmmo_GUI_Slider_Range", [0,0]];
	private _value = floor (parseNumber (ctrlText _textField));
	if (_value < (_range # 0)) then {
		_value = (_range # 0);
	};
	if (_value > (_range # 1)) then {
		_value = (_range # 1);
	};

	_textField ctrlSetText str(_value);
	_textField ctrlCommit 0;
}];

// Commits textField and slider
_textField ctrlCommit 0;
_element ctrlCommit 0;
_element_list ctrlCommit 0;

// Adds slider to the list
_elements pushback ["LIST", _element_list];
_elements pushback ["SLIDER", _textField];

private _pos_label_2 = [
	_posX + ([_base, _element_height] call _calculate_y), 
	_posY + ([_base, (_element_height / 2)] call _calculate_y), 
	([_base, (_element_width / 2)] call _calculate_x),
	([_base, (_element_height / _element_divider)] call _calculate_y)
];
	
private _label_2 = _display ctrlCreate ["RscText", -1, _frame];
_label_2 ctrlSetPosition _pos_label_2;
_label_2 ctrlSetFontHeight _fontSize;
_label_2 ctrlSetText (localize "STR_ACPL_ACEGetAmmo_label_2_text");
_label_2 ctrlSetTooltip (localize "STR_ACPL_ACEGetAmmo_label_2_tooltip");
_label_2 ctrlCommit 0;

// Adds buttons
_posY = _posY + ([_base, (_element_height + (_element_spacer * 2))] call _calculate_y);

// Confirmation
private _confirm = _display ctrlCreate ["RscButton", -1, _frame];
_confirm ctrlSetText localize "STR_ACPL_ACEGetAmmo_module_button_confirm";
_confirm ctrlSetPosition [
	_posX + ([_base, (_element_width / 2)] call _calculate_x) + ([_base, (_element_spacer / 2)] call _calculate_x), 
	_posY, 
	([_base, (_element_width / 2)] call _calculate_x) - ([_base, (_element_spacer / 2)] call _calculate_x),
	([_base, (_element_height / 2)] call _calculate_y)
];
_confirm ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrl"];
    private _display = ctrlParent _ctrl;
	private _data = [_display] call ACPL_ACEGetAmmo_fnc_dialog_getData;
	[ACPL_ACEGetAmmo_Vehicle, _data, player] call ACPL_ACEGetAmmo_fnc_getammo_action_addmagazine;
    closeDialog 1;
}];
_confirm ctrlCommit 0;

// Cancelation
private _cancel = _display ctrlCreate ["RscButton", -1, _frame];
_cancel ctrlSetText localize "STR_ACPL_ACEGetAmmo_module_button_cancel";
_cancel ctrlSetPosition [
	_posX, 
	_posY, 
	([_base, (_element_width / 2)] call _calculate_x) - ([_base, (_element_spacer / 2)] call _calculate_x),
	([_base, (_element_height / 2)] call _calculate_y)
];
_cancel ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrl"];

	private _display = ctrlParent _ctrl;
    closeDialog 1;
}];
_cancel ctrlCommit 0;

// Adds eventHandler for Enter button
_display displayAddEventHandler ["KeyDown",  {
    params ["_display", "_code"];
    if (_code in [DIK_NUMPADENTER, DIK_RETURN]) then {
        private _data = [_display] call ACPL_ACEGetAmmo_fnc_dialog_getData;
        [ACPL_ACEGetAmmo_Vehicle, _data, player] call ACPL_ACEGetAmmo_fnc_getammo_action_addmagazine;
        closeDialog 1;
    };
}];

// Saves variables needed later
_display setVariable ["ACPL_ACEGetAmmo_display_elements", _elements];