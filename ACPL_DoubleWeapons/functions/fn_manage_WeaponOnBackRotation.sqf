params [
	["_unit", ObjNull],
	["_weaponhandler", ObjNull]
];

private _stance = stance _unit;
private _rotation = [];

switch (_stance) do {
	case "STAND": {
		if (weaponLowered _unit) then {
			_rotation = [];
		} else {
			_rotation = [];
		};
	};
	case "CROUCH": {
		if (weaponLowered _unit) then {
			_rotation = [];
		} else {
			_rotation = [];
		};
	};
	case "PRONE": {
		if (weaponLowered _unit) then {
			_rotation = [];
		} else {
			_rotation = [];
		};
	};
	case "UNDEFINED": {
		
	};
	case "": {};
};