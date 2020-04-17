params [
	["_object", ObjNull],
	["_livetime", 300]
];

private _time = time + _livetime;
private _pos = getposATL _object;

waitUntil {sleep 1;_time < time};

for "_i" from 0 to 49 do {
	private _z = (_pos select 2) - 0.01;
	_pos set [2, _z];
	_object setposATL _pos;
	sleep 0.01;
};

deletevehicle _object;