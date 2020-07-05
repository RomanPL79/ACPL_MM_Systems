params [
	["_unit", ObjNull],
	["_reset", false]
];

if !(local _unit) exitwith {};

if (!ACPL_MM_Core_MedicalSupplies_Enabled) exitwith {};

if (_unit getvariable ["ACPL_MM_Core_Medical_Excluded", false] || _unit getvariable ["ACPL_MM_Core_Medical_Done", false]) exitwith {};
_unit setvariable ["ACPL_MM_Core_Medical_Done", true];

private _medic = [_unit] call ace_medical_treatment_fnc_isMedic;

[_unit] call ACPL_MM_Core_fnc_RemoveMedicaments;

private _bandages = 0;
private _e_bandages = 0;
private _p_bandages = 0;
private _quick = 0;
private _adenosine = 0;
private _splint = 0;
private _morphine = 0;
private _epinephrine = 0;
private _saline250 = 0;
private _saline500 = 0;
private _saline1 = 0;
private _plasma250 = 0;
private _plasma500 = 0;
private _plasma1 = 0;
private _blood250 = 0;
private _blood500 = 0;
private _blood1 = 0;
private _torniquet = 0;
private _pak = 0;
private _sewing = 0;

if (_medic) then {
	_bandages = ACPL_MM_Core_MedicalSupplies_med_bandages;
	_e_bandages = ACPL_MM_Core_MedicalSupplies_med_e_bandages;
	_p_bandages = ACPL_MM_Core_MedicalSupplies_med_p_bandages;
	_quick = ACPL_MM_Core_MedicalSupplies_med_quicklot;
	_adenosine = ACPL_MM_Core_MedicalSupplies_med_adenosine;
	_splint = ACPL_MM_Core_MedicalSupplies_med_splint;
	_morphine = ACPL_MM_Core_MedicalSupplies_med_morphine;
	_epinephrine = ACPL_MM_Core_MedicalSupplies_med_epinephrine;
	_saline250 = ACPL_MM_Core_MedicalSupplies_med_saline250;
	_saline500 = ACPL_MM_Core_MedicalSupplies_med_saline500;
	_saline1 = ACPL_MM_Core_MedicalSupplies_med_saline1;
	_plasma250 = ACPL_MM_Core_MedicalSupplies_med_plasma250;
	_plasma500 = ACPL_MM_Core_MedicalSupplies_med_plasma500;
	_plasma1 = ACPL_MM_Core_MedicalSupplies_med_plasma1;
	_blood250 = ACPL_MM_Core_MedicalSupplies_med_blood250;
	_blood500 = ACPL_MM_Core_MedicalSupplies_med_blood500;
	_blood1 = ACPL_MM_Core_MedicalSupplies_med_blood1;
	_torniquet = ACPL_MM_Core_MedicalSupplies_med_torniquet;
	_pak = ACPL_MM_Core_MedicalSupplies_med_PAK;
	_sewing = ACPL_MM_Core_MedicalSupplies_med_sewing;
} else {
	_bandages = ACPL_MM_Core_MedicalSupplies_bandages;
	_e_bandages = ACPL_MM_Core_MedicalSupplies_e_bandages;
	_p_bandages = ACPL_MM_Core_MedicalSupplies_p_bandages;
	_quick = ACPL_MM_Core_MedicalSupplies_quicklot;
	_adenosine = ACPL_MM_Core_MedicalSupplies_adenosine;
	_morphine = ACPL_MM_Core_MedicalSupplies_morphine;
	_epinephrine = ACPL_MM_Core_MedicalSupplies_epinephrine;
	_saline250 = ACPL_MM_Core_MedicalSupplies_saline250;
	_saline500 = ACPL_MM_Core_MedicalSupplies_saline500;
	_plasma250 = ACPL_MM_Core_MedicalSupplies_plasma250;
	_plasma500 = ACPL_MM_Core_MedicalSupplies_plasma500;
	_torniquet = ACPL_MM_Core_MedicalSupplies_torniquet;
	_pak = ACPL_MM_Core_MedicalSupplies_PAK;
	_splint = ACPL_MM_Core_MedicalSupplies_splints;
};

// Adding medicaments
{
	_x params ["_amount", "_class"];
	
	for "_i" from 1 to _amount do {_unit additem _class;};
} foreach [
	[_bandages, "ACE_fieldDressing"],
	[_e_bandages, "ACE_elasticBandage"],
	[_adenosine, "ACE_adenosine"],
	[_splint, "ACE_splint"],
	[_blood250, "ACE_bloodIV_250"],
	[_blood500, "ACE_bloodIV_500"],
	[_blood1, "ACE_bloodIV"],
	[_epinephrine, "ACE_epinephrine"],
	[_morphine, "ACE_morphine"],
	[_p_bandages, "ACE_packingBandage"],
	[_pak, "ACE_personalAidKit"],
	[_plasma1, "ACE_plasmaIV"],
	[_plasma250, "ACE_plasmaIV_250"],
	[_plasma500, "ACE_plasmaIV_500"],
	[_saline1, "ACE_salineIV"],
	[_saline250, "ACE_salineIV_250"],
	[_saline500, "ACE_salineIV_500"],
	[_sewing, "ACE_surgicalKit"],
	[_torniquet, "ace_tourniquet"],
	[_quick, "ACE_quikclot"]
];