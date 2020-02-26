params [
	["_unit", ObjNull],
	["_reset", false]
];

if (!isserver) exitwith {};

WaitUntil {sleep 1;!(isNil "ACPL_MM_Core_MedicalSupplies_Enabled")};

if (!ACPL_MM_Core_MedicalSupplies_Enabled) exitwith {};

WaitUntil {sleep 1;(time > 10)};

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
};

for "_i" from 1 to _bandages do {[_unit,"ACE_fieldDressing"] remoteExec ["additem",_unit];};
for "_i" from 1 to _e_bandages do {[_unit,"ACE_elasticBandage"] remoteExec ["additem",_unit];};
for "_i" from 1 to _adenosine do {[_unit,"ACE_adenosine"] remoteExec ["additem",_unit];};
for "_i" from 1 to _splint do {[_unit,"ACE_splint"] remoteExec ["additem",_unit];};
for "_i" from 1 to _blood250 do {[_unit,"ACE_bloodIV_250"] remoteExec ["additem",_unit];};
for "_i" from 1 to _blood500 do {[_unit,"ACE_bloodIV_500"] remoteExec ["additem",_unit];};
for "_i" from 1 to _blood1 do {[_unit,"ACE_bloodIV"] remoteExec ["additem",_unit];};
for "_i" from 1 to _epinephrine do {[_unit,"ACE_epinephrine"] remoteExec ["additem",_unit];};
for "_i" from 1 to _morphine do {[_unit,"ACE_morphine"] remoteExec ["additem",_unit];};
for "_i" from 1 to _p_bandages do {[_unit,"ACE_packingBandage"] remoteExec ["additem",_unit];};
for "_i" from 1 to _pak do {[_unit,"ACE_personalAidKit"] remoteExec ["additem",_unit];};
for "_i" from 1 to _plasma1 do {[_unit,"ACE_plasmaIV"] remoteExec ["additem",_unit];};
for "_i" from 1 to _plasma250 do {[_unit,"ACE_plasmaIV_250"] remoteExec ["additem",_unit];};
for "_i" from 1 to _plasma500 do {[_unit,"ACE_plasmaIV_500"] remoteExec ["additem",_unit];};
for "_i" from 1 to _saline1 do {[_unit,"ACE_salineIV"] remoteExec ["additem",_unit];};
for "_i" from 1 to _saline250 do {[_unit,"ACE_salineIV_250"] remoteExec ["additem",_unit];};
for "_i" from 1 to _saline500 do {[_unit,"ACE_salineIV_500"] remoteExec ["additem",_unit];};
for "_i" from 1 to _sewing do {[_unit,"ACE_surgicalKit"] remoteExec ["additem",_unit];};
for "_i" from 1 to _torniquet do {[_unit,"ace_tourniquet"] remoteExec ["additem",_unit];};
for "_i" from 1 to _quick do {[_unit,"ACE_quikclot"] remoteExec ["additem",_unit];};