params [
	["_unit", ObjNull],
	["_container", ObjNull]
];

private _special = _container getvariable ["ACPL_DoubleWeapons_disallow", false];

if (_special) then {
	if (_opened) then {
		_container hideobject true;

		[_container] spawn {
			params ["_object"];

			sleep 5;
			_object hideObject false;
		};

		waitUntil {!(isNull findDisplay 602)};
		
		findDisplay 602 closeDisplay 1;

		_unit action ["Gear","GroundWeaponHolder" createVehicle position player];
	};
};