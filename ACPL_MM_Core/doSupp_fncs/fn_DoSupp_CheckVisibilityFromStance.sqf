params [
	["_unit", ObjNull],
	["_object", ObjNull]
];

//If is not local then exit
if !(local _unit) exitwith {[false, []]};

private _pos = getposASL _unit;
private _list = [];
private _check = false;

//Creating offsets
private _up = (_pos select 2) + 1.53;
private _middle = (_pos select 2) + 1.05;
private _down =(_pos select 2) +  0.38;

//Checking is unit visible from every possible position
_pos set [2, _up];
if (([_unit, "VIEW", _object] checkVisibility [_pos, eyepos _object]) > 0.1) then {
	_check = true;
	_list pushback "UP";
};
_pos set [2, _middle];
if (([_unit, "VIEW", _object] checkVisibility [_pos, eyepos _object]) > 0.1) then {
	_check = true;
	_list pushback "MIDDLE";
};
_pos set [2, _down];
if (([_unit, "VIEW", _object] checkVisibility [_pos, eyepos _object]) > 0.1) then {
	_check = true;
	_list pushback "DOWN";
};

[_check, _list]