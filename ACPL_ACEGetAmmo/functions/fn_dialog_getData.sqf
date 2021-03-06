params [
	["_display", -1]
];

private _list = _display getvariable ["ACPL_ACEGetAmmo_display_elements", []];
private _return = [];

{
	_x params ["_type", "_element"];

	switch (_type) do {
		case "LISTWEAP": {
			private _index = lbCurSel _element;
			private _data = _element lbData _index;
			_return pushBack _data;
		};
		case "SLIDER": {
			_return pushBack (parseNumber (ctrlText _element));
		};
		case "BOOL": {
			_return pushBack (cbChecked _element);
		};
		case "LIST": {
			private _index = lbCurSel _element;
			private _data = _element lbText _index;
			_return pushBack _data;
		};
		case "TEXT": {
			_return pushBack (ctrlText _element);
		};
	};
} foreach _list;

_return