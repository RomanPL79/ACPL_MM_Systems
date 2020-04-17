params [
	["_pos", [0,0,0]]
];

if (!ACPL_Support_Heal_LeaveRubbish) exitwith {};

private _classes = [
	"MedicalGarbage_01_1x1_v1_F",
	"MedicalGarbage_01_1x1_v2_F",
	"MedicalGarbage_01_1x1_v3_F",
	"MedicalGarbage_01_3x3_v1_F",
	"MedicalGarbage_01_3x3_v2_F",
	"MedicalGarbage_01_5x5_v1_F",
	"MedicalGarbage_01_Bandage_F",
	"MedicalGarbage_01_FirstAidKit_F",
	"MedicalGarbage_01_Gloves_F",
	"MedicalGarbage_01_Injector_F",
	"MedicalGarbage_01_Packaging_F"
];

private _class = _classes select floor(random(count _classes));
private _object = createVehicle [_class, _pos, [], 2, "CAN_COLLIDE"];

[_object, 300] spawn ACPL_Support_fnc_medical_handle_rubbish;