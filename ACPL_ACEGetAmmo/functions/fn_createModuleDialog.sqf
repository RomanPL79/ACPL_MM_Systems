/*
	ACPL_ACEGetAmmo_fnc_dialogModuleCreate
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"

params [
	["_data", []],
	["_name", ""],
	["_exec", {}],
	["_variables", []]
];

// Checks that display were created and data is provided
if (
	count _data isEqualTo 0 ||
	!createDialog "ACPL_ACEGetAmmo_GUI"
) exitwith {
	false
};

// Gets display info and makes sure it's created
private _display = uiNamespace getVariable ["ACPL_ACEGetAmmo_GUI", -1];
if (isNull _display) exitwith {
	false
};

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
private _height = ((count _data) + 1) * ([_base, (_element_height + _element_spacer)] call _calculate_y);
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
{
	_x params ["_type", "_elementData"];
	_elementData params [
		"_text",
		"_tooltip",
		["_values", []]
	];

	switch (_type) do {
		case "BOOL": {
			_values params [["_default", false]];

			_posY = _posY + ([_base, (_element_height + _element_spacer)] call _calculate_y);
			private _pos = [
				_posX + ([_base, (_element_width - _element_height + _element_spacer)] call _calculate_x), 
				_posY + ([_base, (_element_height / 2)] call _calculate_y), 
				([_base, (_element_height / _element_divider)] call _calculate_x),
				([_base, (_element_height / _element_divider)] call _calculate_y)
			];

			private _element = _display ctrlCreate ["RscCheckBox", -1, _frame];
			_element ctrlSetPosition _pos;
			_element ctrlSetTooltip _tooltip;
			_element cbSetChecked _default;
			_element ctrlCommit 0;

			_elements pushback [_type, _element];
		};
		case "LIST": {
			_values params ["_list", ["_default", 0]];

			_posY = _posY + ([_base, (_element_height + _element_spacer)] call _calculate_y);
			private _pos = [
				_posX + ([_base, (_element_width / 2)] call _calculate_x), 
				_posY + ([_base, (_element_height / 2)] call _calculate_y), 
				([_base, (_element_width / 2)] call _calculate_x),
				([_base, (_element_height / _element_divider)] call _calculate_y)
			];

			private _element = _display ctrlCreate ["RscCombo", -1, _frame];
			{
				if (typeName _x isEqualTo "STRING") then {
					_element lbAdd _x;
				};
			} foreach _list;
			_element ctrlSetPosition _pos;
			_element ctrlSetTooltip _tooltip;
			_element lbSetCurSel _default;
			_element ctrlCommit 0;

			_elements pushback [_type, _element];
		};
		case "SLIDER": {
			_values params ["_range", ["_default", -1], ["_transition", [0.01, 0.1]]];

			// Sets default value to middle of range if no default had been defined
			if (_default isEqualTo -1) then {
				_default = linearConversion [0, 1, 0.5, (_range # 0), (_range # 1), true];
			};

			// Creates Slider and overrides base Y position
			_posY = _posY + ([_base, (_element_height + _element_spacer)] call _calculate_y);
			private _pos = [
				_posX + ([_base, (_element_width / 2)] call _calculate_x), 
				_posY + ([_base, (_element_height / 2)] call _calculate_y), 
				([_base, (_element_width / 2 - (_element_spacer * _slider_width))] call _calculate_x),
				([_base, (_element_height / _element_divider)] call _calculate_y)
			];
			
			private _element = _display ctrlCreate ["ctrlXSliderH", -1, _frame];
			_element ctrlSetPosition _pos;
			_element ctrlSetTooltip _tooltip;
			_element sliderSetRange _range;
			_element sliderSetSpeed _transition;
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
			_textField ctrlSetText str(_default);

			// Links TextField and Slider and saves information about max and min value
			_element setvariable ["ACPL_ACEGetAmmo_GUI_Slider", _textField];
			_element setvariable ["ACPL_ACEGetAmmo_GUI_Slider_range", _range];
			_textField setvariable ["ACPL_ACEGetAmmo_GUI_Slider", _element];

			// Adds eventHandlers for slider
			_element ctrlAddEventHandler ["SliderPosChanged", {
				params ["_element", "_value"];

				private _textField = _element getvariable ["ACPL_ACEGetAmmo_GUI_Slider", -1];
				_textField ctrlSetText str(_value);
				_textField ctrlCommit 0;
			}];
			_element ctrlAddEventHandler ["KillFocus", {
				params ["_element"];

				private _textField = _element getvariable ["ACPL_ACEGetAmmo_GUI_Slider", -1];
				private _value = ctrlText _element;

				if (typeName _value isEqualTo "STRING") then {
					_value = parseNumber _value;
				};

				_element sliderSetPosition _value;
        		_element ctrlCommit 0;
			}];

			// Adds eventHandlers for textField
			_textField ctrlAddEventHandler ["KeyUp", {
				params ["_textField"];

				private _element = _textField getvariable ["ACPL_ACEGetAmmo_GUI_Slider", -1];
				private _range = _element getvariable ["ACPL_ACEGetAmmo_GUI_Slider_range", [0,0]];
				private _value = parseNumber (ctrlText _textField);
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
				private _value = parseNumber (ctrlText _textField);
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

			// Adds slider to the list
			_elements pushback [_type, _textField];
		};
		case "TEXT": {
			_values params [["_default", ""]];

			_posY = _posY + ([_base, (_element_height + _element_spacer)] call _calculate_y);
			private _pos = [
				_posX + ([_base, (_element_width / 2)] call _calculate_x), 
				_posY + ([_base, (_element_height / 2)] call _calculate_y), 
				([_base, (_element_width / 2 - _element_spacer)] call _calculate_x),
				([_base, (_element_height / _element_divider)] call _calculate_y)
			];

			if (typeName _default != "STRING") then {
				_default = str(_default);
			};

			private _element = _display ctrlCreate ["RscEdit", -1, _frame];
			_element ctrlSetPosition _pos;
			_element ctrlSetTooltip _tooltip;
			_element ctrlSetText _default;
			_element ctrlCommit 0;

			_elements pushback [_type, _element];
		};
	};

	// Adds label after each element
	private _pos = [
		_posX + ([_base, _element_height] call _calculate_y), 
		_posY + ([_base, (_element_height / 2)] call _calculate_y), 
		([_base, (_element_width / 2)] call _calculate_x),
		([_base, (_element_height / _element_divider)] call _calculate_y)
	];
	
	private _element = _display ctrlCreate ["RscText", -1, _frame];
	_element ctrlSetPosition _pos;
	_element ctrlSetFontHeight _fontSize;
	_element ctrlSetText _text;
	_element ctrlSetTooltip _tooltip;
	_element ctrlCommit 0;
} foreach _data;

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
	private _completeFunction = _display getVariable ["ACPL_ACEGetAmmo_display_complete", {}];
	private _data = [_display] call ACPL_ACEGetAmmo_fnc_dialog_getData;
    _data call _completeFunction;
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
		private _completeFunction = _display getVariable ["ACPL_ACEGetAmmo_display_complete", {}];
        private _data = [_display] call ACPL_ACEGetAmmo_fnc_dialog_getData;
        _data call _completeFunction;
        closeDialog 1;
    };
}];

// Saves variables needed later
_display setVariable ["ACPL_ACEGetAmmo_display_complete", _exec];
_display setVariable ["ACPL_ACEGetAmmo_display_elements", _elements];