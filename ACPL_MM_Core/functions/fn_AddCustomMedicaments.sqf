params [
	["_logic", ObjNull],
	["_synch", []],
	["_activated", false]
];

if (!isserver || !_activated) exitwith {};

WaitUntil {sleep 1;time > 5};

private _units = synchronizedObjects _logic;

private _bandages = _logic getvariable ["ACPL_MM_Core_Medical_ban", 0];
private _e_bandages = _logic getvariable ["ACPL_MM_Core_Medical_e_ban", 0];
private _p_bandages = _logic getvariable ["ACPL_MM_Core_Medical_p_ban", 0];
private _quick = _logic getvariable ["ACPL_MM_Core_Medical_quicklot", 0];
private _adenosine = _logic getvariable ["ACPL_MM_Core_Medical_adenosine", 0];
private _splint = _logic getvariable ["ACPL_MM_Core_Medical_splint", 0];
private _morphine = _logic getvariable ["ACPL_MM_Core_Medical_morphine", 0];
private _epinephrine = _logic getvariable ["ACPL_MM_Core_Medical_epinephrine", 0];
private _saline250 = _logic getvariable ["ACPL_MM_Core_Medical_saline250", 0];
private _saline500 = _logic getvariable ["ACPL_MM_Core_Medical_saline500", 0];
private _saline1 = _logic getvariable ["ACPL_MM_Core_Medical_saline1", 0];
private _plasma250 = _logic getvariable ["ACPL_MM_Core_Medical_plasma250", 0];
private _plasma500 = _logic getvariable ["ACPL_MM_Core_Medical_plasma500", 0];
private _plasma1 = _logic getvariable ["ACPL_MM_Core_Medical_plasma1", 0];
private _blood250 = _logic getvariable ["ACPL_MM_Core_Medical_blood250", 0];
private _blood500 = _logic getvariable ["ACPL_MM_Core_Medical_blood500", 0];
private _blood1 = _logic getvariable ["ACPL_MM_Core_Medical_blood1", 0];
private _torniquet = _logic getvariable ["ACPL_MM_Core_Medical_torniquet", 0];
private _pak = _logic getvariable ["ACPL_MM_Core_Medical_PAK", 0];
private _sewing = _logic getvariable ["ACPL_MM_Core_Medical_sewing", 0];

private _level = _logic getvariable ["ACPL_MM_Core_Medical_medic", ""];

{		
	_x setvariable ["ACPL_MM_Core_Medical_Excluded", true];
	
	[_x] call ACPL_MM_Core_fnc_RemoveMedicaments;
	
	switch (_level) do {
		case "": {};
		case "nonmedic": {
			_x setVariable ["ace_medical_medicClass", 0, true];
		};
		case "medic": {
			_x setVariable ["ace_medical_medicClass", 1, true];
		};
		case "doctor": {
			_x setVariable ["ace_medical_medicClass", 2, true];
		};
	};
		
	for "_i" from 1 to _bandages do {[_x,"ACE_fieldDressing"] remoteExec ["additem",_x];};
	for "_i" from 1 to _e_bandages do {[_x,"ACE_elasticBandage"] remoteExec ["additem",_x];};
	for "_i" from 1 to _adenosine do {[_x,"ACE_adenosine"] remoteExec ["additem",_x];};
	for "_i" from 1 to _splint do {[_x,"ACE_splint"] remoteExec ["additem",_x];};
	for "_i" from 1 to _blood250 do {[_x,"ACE_bloodIV_250"] remoteExec ["additem",_x];};
	for "_i" from 1 to _blood500 do {[_x,"ACE_bloodIV_500"] remoteExec ["additem",_x];};
	for "_i" from 1 to _blood1 do {[_x,"ACE_bloodIV"] remoteExec ["additem",_x];};
	for "_i" from 1 to _epinephrine do {[_x,"ACE_epinephrine"] remoteExec ["additem",_x];};
	for "_i" from 1 to _morphine do {[_x,"ACE_morphine"] remoteExec ["additem",_x];};
	for "_i" from 1 to _p_bandages do {[_x,"ACE_packingBandage"] remoteExec ["additem",_x];};
	for "_i" from 1 to _pak do {[_x,"ACE_personalAidKit"] remoteExec ["additem",_x];};
	for "_i" from 1 to _plasma1 do {[_x,"ACE_plasmaIV"] remoteExec ["additem",_x];};
	for "_i" from 1 to _plasma250 do {[_x,"ACE_plasmaIV_250"] remoteExec ["additem",_x];};
	for "_i" from 1 to _plasma500 do {[_x,"ACE_plasmaIV_500"] remoteExec ["additem",_x];};
	for "_i" from 1 to _saline1 do {[_x,"ACE_salineIV"] remoteExec ["additem",_x];};
	for "_i" from 1 to _saline250 do {[_x,"ACE_salineIV_250"] remoteExec ["additem",_x];};
	for "_i" from 1 to _saline500 do {[_x,"ACE_salineIV_500"] remoteExec ["additem",_x];};
	for "_i" from 1 to _sewing do {[_x,"ACE_surgicalKit"] remoteExec ["additem",_x];};
	for "_i" from 1 to _torniquet do {[_x,"ace_tourniquet"] remoteExec ["additem",_x];};
	for "_i" from 1 to _quick do {[_x,"ACE_quikclot"] remoteExec ["additem",_x];};
} foreach _units;

deletevehicle _logic;