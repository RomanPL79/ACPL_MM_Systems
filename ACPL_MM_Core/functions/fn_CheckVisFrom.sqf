params ["_pos", "_target", ["_ignore", objNull]];

private _return = false;

if (([_ignore, "VIEW"] checkVisibility [_pos, _target]) > 0.1) then {_return = true;};

_return