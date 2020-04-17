params [
	["_unit", ObjNull]
];

WaitUntil {sleep 1;time > 10};
if ([_unit] call ace_medical_treatment_fnc_isMedic) then {[_unit] spawn ACPL_Support_fnc_MedicalHelp;};