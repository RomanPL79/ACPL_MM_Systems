params [
	["_object", ObjNull],
	["_destroy", true]
];

if (_destroy) then {
	_object setvariable ["ACPL_LooseHelmet_Destroyed", true, true];
} else {
	_object setvariable ["ACPL_LooseHelmet_Destroyed", false, true];
};