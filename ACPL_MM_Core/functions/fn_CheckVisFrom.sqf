params ["_pos", "_target", ["_ignore", objNull], ["_ignore_2", objNull]];

private _return = false;

if (([_ignore, "VIEW", _ignore_2] checkVisibility [_pos, _target]) > 0.1) then {_return = true;};

_return