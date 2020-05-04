params [
	["_unit", ObjNull],
	["_type", "ALL"]
];

private _return = false;

private _side = side _unit;
private _list = [];

switch (_type) do {
	case "ALL": {
		switch (_side) do {
			case WEST: {
				if (isNil "ACPL_FireSupport_ArtyList_WEST" && isNil "ACPL_FireSupport_HeliList_WEST" && isNil "ACPL_FireSupport_PlaneList_WEST") exitwith {false};
				if (isNil "ACPL_FireSupport_ArtyList_WEST") then {ACPL_FireSupport_ArtyList_WEST = [];publicVariable "ACPL_FireSupport_ArtyList_WEST";};
				if (isNil "ACPL_FireSupport_HeliList_WEST") then {ACPL_FireSupport_HeliList_WEST = [];publicVariable "ACPL_FireSupport_HeliList_WEST";};
				if (isNil "ACPL_FireSupport_PlaneList_WEST") then {ACPL_FireSupport_PlaneList_WEST = [];publicVariable "ACPL_FireSupport_PlaneList_WEST";};
				_list = ACPL_FireSupport_ArtyList_WEST + ACPL_FireSupport_HeliList_WEST + ACPL_FireSupport_PlaneList_WEST;
			};
			case EAST: {
				if (isNil "ACPL_FireSupport_ArtyList_EAST" && isNil "ACPL_FireSupport_HeliList_EAST" && isNil "ACPL_FireSupport_PlaneList_EAST") exitwith {false};
				if (isNil "ACPL_FireSupport_ArtyList_EAST") then {ACPL_FireSupport_ArtyList_EAST = [];publicVariable "ACPL_FireSupport_ArtyList_EAST";};
				if (isNil "ACPL_FireSupport_HeliList_EAST") then {ACPL_FireSupport_HeliList_EAST = [];publicVariable "ACPL_FireSupport_HeliList_EAST";};
				if (isNil "ACPL_FireSupport_PlaneList_EAST") then {ACPL_FireSupport_PlaneList_EAST = [];publicVariable "ACPL_FireSupport_PlaneList_EAST";};
				_list = ACPL_FireSupport_ArtyList_EAST + ACPL_FireSupport_HeliList_EAST + ACPL_FireSupport_PlaneList_EAST;
			};
			case RESISTANCE: {
				if (isNil "ACPL_FireSupport_ArtyList_RESISTANCE" && isNil "ACPL_FireSupport_HeliList_RESISTANCE" && isNil "ACPL_FireSupport_PlaneList_RESISTANCE") exitwith {false};
				if (isNil "ACPL_FireSupport_ArtyList_RESISTANCE") then {ACPL_FireSupport_ArtyList_RESISTANCE = [];publicVariable "ACPL_FireSupport_ArtyList_RESISTANCE";};
				if (isNil "ACPL_FireSupport_HeliList_RESISTANCE") then {ACPL_FireSupport_HeliList_RESISTANCE = [];publicVariable "ACPL_FireSupport_HeliList_RESISTANCE";};
				if (isNil "ACPL_FireSupport_PlaneList_RESISTANCE") then {ACPL_FireSupport_PlaneList_RESISTANCE = [];publicVariable "ACPL_FireSupport_PlaneList_RESISTANCE";};
				_list = ACPL_FireSupport_ArtyList_RESISTANCE + ACPL_FireSupport_HeliList_RESISTANCE + ACPL_FireSupport_PlaneList_RESISTANCE;
			};
		};
	};
	case "ARTY": {
		switch (_side) do {
			case WEST: {
				if (isNil "ACPL_FireSupport_ArtyList_WEST") exitwith {false};
				_list = ACPL_FireSupport_ArtyList_WEST;
			};
			case EAST: {
				if (isNil "ACPL_FireSupport_ArtyList_EAST") exitwith {false};
				_list = ACPL_FireSupport_ArtyList_EAST;
			};
			case RESISTANCE: {
				if (isNil "ACPL_FireSupport_ArtyList_RESISTANCE") exitwith {false};
				_list = ACPL_FireSupport_ArtyList_RESISTANCE;
			};
		};
	};
	case "HELI": {
		switch (_side) do {
			case WEST: {
				if (isNil "ACPL_FireSupport_HeliList_WEST") exitwith {false};
				_list = ACPL_FireSupport_HeliList_WEST;
			};
			case EAST: {
				if (isNil "ACPL_FireSupport_HeliList_EAST") exitwith {false};
				_list = ACPL_FireSupport_HeliList_EAST;
			};
			case RESISTANCE: {
				if (isNil "ACPL_FireSupport_HeliList_RESISTANCE") exitwith {false};
				_list = ACPL_FireSupport_HeliList_RESISTANCE;
			};
		};
	};
	case "PLANE": {
		switch (_side) do {
			case WEST: {
				if (isNil "ACPL_FireSupport_PlaneList_WEST") exitwith {false};
				_list = ACPL_FireSupport_PlaneList_WEST;
			};
			case EAST: {
				if (isNil "ACPL_FireSupport_PlaneList_EAST") exitwith {false};
				_list = ACPL_FireSupport_PlaneList_EAST;
			};
			case RESISTANCE: {
				if (isNil "ACPL_FireSupport_PlaneList_RESISTANCE") exitwith {false};
				_list = ACPL_FireSupport_PlaneList_RESISTANCE;
			};
		};
	};
};


if (count _list > 0) then {_return = true;}

_return