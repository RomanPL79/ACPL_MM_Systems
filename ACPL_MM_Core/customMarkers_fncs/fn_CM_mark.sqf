params ["_object", "_type"];

switch (_type) do {
	case "TREE": {
		private _pos = getPosATL _object;
		private _rot = getDir _object;
		
		private _markerName = format[ "bound_%1", (_object call BIS_fnc_objectVar)];
		
		private _marker = createMarker [_markerName, _pos];
		_marker setMarkerShape "ICON";
		_marker setMarkerSize [1, 1];
		_marker setMarkerDir _rot;
		_marker setMarkerType "loc_tree";
	};
	case "BUILDING": {
		private _pos = getPosATL _object;
		private _bound = boundingBoxReal _object;
		private _rot = getDir _object;

		private _bmin = _bound select 0;
		
		private _markerName = format[ "bound_%1", (_object call BIS_fnc_objectVar)];

		private _marker = createMarker [_markerName, _pos];
		_marker setMarkerShape "RECTANGLE";
		_marker setMarkerSize [_bmin select 0, _bmin select 1];
		_marker setMarkerDir _rot;
	};
	case "BUSH": {
		private _pos = getPosATL _object;
		private _bound = boundingBoxReal _object;
		private _rot = getDir _object;
		
		private _bmin = _bound select 0;
		
		private _markerName = format[ "bound_%1", (_object call BIS_fnc_objectVar)];
		
		private _marker = createMarker [_markerName, _pos];
		_marker setMarkerShape "RECTANGLE";
		_marker setMarkerSize [_bmin select 0, _bmin select 1];
		_marker setMarkerDir _rot;
		_marker setMarkerColor "Colorgreen";
	};
};
