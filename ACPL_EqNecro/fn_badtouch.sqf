params [
	["_unit", ObjNull],
	["_container", ObjNull],
	["_opened", true]
];

if (!alive _container) then {
	if (_opened) then {
		_container enableSimulation true;
	} else {
		_container enableSimulation false;
	};
};