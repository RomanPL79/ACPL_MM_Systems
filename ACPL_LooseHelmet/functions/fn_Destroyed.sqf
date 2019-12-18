params ["_objects", "_velocity"];

private _random = random 100;

_random = (_velocity / 100 * _random);

if (_random < ACPL_LooseHelmet_DestroyChance) then {
	{
		[_x,false] remoteExec ["enablesimulation",0,true];
	} foreach _objects;
};