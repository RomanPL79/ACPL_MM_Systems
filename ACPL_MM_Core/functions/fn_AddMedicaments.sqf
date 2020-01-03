params ["_unit"];

if (!ACPL_MM_Core_MedicalSupplies_Enabled) exitwith {};

WaitUntil {sleep 1;time > 5};

if (isNil "ACPL_MM_Core_Medicaments_Excluded") then {ACPL_MM_Core_Medicaments_Excluded = [];};

if (_unit in ACPL_MM_Core_Medicaments_Excluded) exitwith {};

private _medic = [_unit] call ace_medical_fnc_isMedic;

[_unit] call ACPL_MM_Core_fnc_RemoveMedicaments;

switch (_medic) do {
	case true: {
		private _bandages = ACPL_MM_Core_MedicalSupplies_med_bandages;
		private _e_bandages = ACPL_MM_Core_MedicalSupplies_med_e_bandages;
		private _p_bandages = ACPL_MM_Core_MedicalSupplies_med_p_bandages;
		private _quick = ACPL_MM_Core_MedicalSupplies_med_quicklot;
		private _adenosine = ACPL_MM_Core_MedicalSupplies_med_adenosine;
		private _atropine = ACPL_MM_Core_MedicalSupplies_med_atropine;
		private _morphine = ACPL_MM_Core_MedicalSupplies_med_morphine;
		private _epinephrine = ACPL_MM_Core_MedicalSupplies_med_epinephrine;
		private _saline250 = ACPL_MM_Core_MedicalSupplies_med_saline250;
		private _saline500 = ACPL_MM_Core_MedicalSupplies_med_saline500;
		private _saline1 = ACPL_MM_Core_MedicalSupplies_med_saline1;
		private _plasma250 = ACPL_MM_Core_MedicalSupplies_med_plasma250;
		private _plasma500 = ACPL_MM_Core_MedicalSupplies_med_plasma500;
		private _plasma1 = ACPL_MM_Core_MedicalSupplies_med_plasma1;
		private _blood250 = ACPL_MM_Core_MedicalSupplies_med_blood250;
		private _blood500 = ACPL_MM_Core_MedicalSupplies_med_blood500;
		private _blood1 = ACPL_MM_Core_MedicalSupplies_med_blood1;
		private _torniquet = ACPL_MM_Core_MedicalSupplies_med_torniquet;
		private _pak = ACPL_MM_Core_MedicalSupplies_med_PAK;
		private _sewing = ACPL_MM_Core_MedicalSupplies_med_sewing;
		
		for "_i" from 1 to _bandages do {[_unit,"ACE_fieldDressing"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _e_bandages do {[_unit,"ACE_elasticBandage"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _adenosine do {[_unit,"ACE_adenosine"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _atropine do {[_unit,"ACE_atropine"] remoteExec ["additem",_unit];};
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
	};
	case false: {
		private _bandages = ACPL_MM_Core_MedicalSupplies_bandages;
		private _e_bandages = ACPL_MM_Core_MedicalSupplies_e_bandages;
		private _p_bandages = ACPL_MM_Core_MedicalSupplies_p_bandages;
		private _quick = ACPL_MM_Core_MedicalSupplies_quicklot;
		private _adenosine = ACPL_MM_Core_MedicalSupplies_adenosine;
		private _atropine = ACPL_MM_Core_MedicalSupplies_atropine;
		private _morphine = ACPL_MM_Core_MedicalSupplies_morphine;
		private _epinephrine = ACPL_MM_Core_MedicalSupplies_epinephrine;
		private _saline250 = ACPL_MM_Core_MedicalSupplies_saline250;
		private _saline500 = ACPL_MM_Core_MedicalSupplies_saline500;
		private _plasma250 = ACPL_MM_Core_MedicalSupplies_plasma250;
		private _plasma500 = ACPL_MM_Core_MedicalSupplies_plasma500;
		private _torniquet = ACPL_MM_Core_MedicalSupplies_torniquet;
		private _pak = ACPL_MM_Core_MedicalSupplies_PAK;
		
		for "_i" from 1 to _bandages do {[_unit,"ACE_fieldDressing"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _e_bandages do {[_unit,"ACE_elasticBandage"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _adenosine do {[_unit,"ACE_adenosine"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _atropine do {[_unit,"ACE_atropine"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _epinephrine do {[_unit,"ACE_epinephrine"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _morphine do {[_unit,"ACE_morphine"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _p_bandages do {[_unit,"ACE_packingBandage"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _pak do {[_unit,"ACE_personalAidKit"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _plasma250 do {[_unit,"ACE_plasmaIV_250"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _plasma500 do {[_unit,"ACE_plasmaIV_500"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _saline250 do {[_unit,"ACE_salineIV_250"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _saline500 do {[_unit,"ACE_salineIV_500"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _torniquet do {[_unit,"ace_tourniquet"] remoteExec ["additem",_unit];};
		for "_i" from 1 to _quick do {[_unit,"ACE_quikclot"] remoteExec ["additem",_unit];};
	};
};