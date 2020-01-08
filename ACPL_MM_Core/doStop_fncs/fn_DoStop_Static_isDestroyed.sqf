params ["_vehicle"];

private _return = false;

private _hull = _vehicle gethit "HitHull";
private _gun = _vehicle gethit "HitGun";
private _turret = _vehicle gethit "HitGun";

if (_hull > 0.7) then {
	_return = true;
};
if (_gun > 0.8) then {
	_return = true;
};
if (_turret > 0.8) then {
	_return = true;
};

_return