params [
	["_dummy", ObjNull],
	["_holder", ObjNull]
];

// if dummy is not existing then exit
if (isNull _dummy) exitwith {};

// Defines delay
private _sleep = 0;

// Move under the ground
for "_i" from 0 to 19 do {
	_sleep = _sleep + 0.01;
	[{
		private _pos = getposATL _this;
		private _z = (_pos # 2) - 0.01;
		_pos set [2, _z];
		_this setposATL _pos;
	}, _dummy, _sleep] call CBA_fnc_waitAndExecute;
};

// Delete dummy and holder
_sleep = _sleep + 0.01;
[{
	{deletevehicle _x;} foreach _this;
}, [_dummy, _holder], _sleep] call CBA_fnc_waitAndExecute;