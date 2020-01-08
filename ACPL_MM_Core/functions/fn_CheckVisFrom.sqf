params ["_pos", "_target"];

private _return = false;

if (([objNull, "VIEW"] checkVisibility [_pos, _target]) > 0) then {_return = true;};

_return