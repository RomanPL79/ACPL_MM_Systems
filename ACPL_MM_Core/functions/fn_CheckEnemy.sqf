params ["_side"];

private _return = [];

private _blue = _side getFriend west;
private _red = _side getFriend east;
private _green = _side getFriend resistance;

if (_blue < 0.6) then {_return = _return + [WEST];};
if (_red < 0.6) then {_return = _return + [EAST];};
if (_green < 0.6) then {_return = _return + [RESISTANCE];};

_return