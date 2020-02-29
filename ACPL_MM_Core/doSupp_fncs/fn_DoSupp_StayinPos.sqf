params [
	["_unit", ObjNull],
	["_stance", "UP"]
];

_unit setUnitPos _stance;

while {_unit getvariable ["ACPL_MM_Core_DoSupp_Suppressing", false]} do {
	switch (_stance) do {
		case "UP": {
			if (stance _unit != "STAND") then {
				[_unit,"PlayerStand"] remoteExec ["playAction",_unit];
				_unit setUnitPos _stance;
			};
		};
		case "MIDDLE": {
			if (stance _unit != "CROUCH") then {
				[_unit,"PlayerCrouch"] remoteExec ["playAction",_unit];
				_unit setUnitPos _stance;
			};
		};
		case "DOWN": {
			if (stance _unit != "PRONE") then {
				[_unit,"PlayerProne"] remoteExec ["playAction",_unit];
				_unit setUnitPos _stance;
			};
		};
	};
	
	sleep 0.1;
};