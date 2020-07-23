/*
	ACPL_MM_Core_fnc_Dialog_GetData
*/

params [
	["_display", -1]
];

private _list = _display getvariable ["ACPL_MM_Core_display_elements", []];
private _return = [];

{
	_x params ["_type", "_element"];

	switch (_type) do {
		case "BOOL": {
			_return pushBack (cbChecked _element);
		};
		case "LIST": {
			private _index = lbCurSel _element;
			private _data = _element lbText _index;
			_return pushBack _data;
		};
		case "SLIDER": {
			_return pushBack (parseNumber (ctrlText _element));
		};
		case "TEXT": {
			_return pushBack (ctrlText _element);
		};
	};
} foreach _list;

_return