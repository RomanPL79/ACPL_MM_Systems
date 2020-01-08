params ["_vehicle"];

private _return = false;

private _magazines = magazines _vehicle;

if (count _magazines > 0) then {
	_return = true;
};

_return