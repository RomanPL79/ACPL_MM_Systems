params [
	"_logic",
	"_synch",
	"_activated"
];

if (_activated) then {
	private _objects = synchronizedObjects _logic;
	
	private _bandages = _logic getvariable ["ACPL_MM_Core_Medical_ban", 0];
	private _e_bandages = _logic getvariable ["ACPL_MM_Core_Medical_e_ban", 0];
	private _p_bandages = _logic getvariable ["ACPL_MM_Core_Medical_p_ban", 0];
	private _quick = _logic getvariable ["ACPL_MM_Core_Medical_quicklot", 0];
	private _adenosine = _logic getvariable ["ACPL_MM_Core_Medical_adenosine", 0];
	private _atropine = _logic getvariable ["ACPL_MM_Core_Medical_atropine", 0];
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
	private _strecher = _logic getvariable ["ACPL_MM_Core_Medical_strecher", 0];
	private _medicbag = _logic getvariable ["ACPL_MM_Core_Medical_medicbag", 0];
	private _bodybag = _logic getvariable ["ACPL_MM_Core_Medical_bodybag", 0];
	
	{
		_x setVariable ["ace_medical_isMedicalFacility",true,true];
		_x setVariable ["ace_medical_medicClass",2,true];
		
		_x additemCargoGlobal ["ACE_fieldDressing",_bandages];
		_x additemCargoGlobal ["ACE_elasticBandage",_e_bandages];
		_x additemCargoGlobal ["ACE_adenosine",_adenosine];
		_x additemCargoGlobal ["ACE_atropine",_atropine];
		_x additemCargoGlobal ["ACE_bloodIV_250",_blood250];
		_x additemCargoGlobal ["ACE_bloodIV_500",_blood500];
		_x additemCargoGlobal ["ACE_bloodIV",_blood1];
		_x additemCargoGlobal ["ACE_bodyBag",_bodybag];
		_x additemCargoGlobal ["ACE_epinephrine",_epinephrine];
		_x additemCargoGlobal ["ACE_morphine",_morphine];
		_x additemCargoGlobal ["ACE_packingBandage",_p_bandages];
		_x additemCargoGlobal ["ACE_plasmaIV_250",_plasma250];
		_x additemCargoGlobal ["ACE_plasmaIV_500",_plasma500];
		_x additemCargoGlobal ["ACE_plasmaIV",_plasma1];
		_x additemCargoGlobal ["ACE_salineIV_250",_saline250];
		_x additemCargoGlobal ["ACE_salineIV_500",_saline500];
		_x additemCargoGlobal ["ACE_salineIV",_saline1];
		_x additemCargoGlobal ["ACE_surgicalKit",_sewing];
		_x additemCargoGlobal ["ace_tourniquet",_torniquet];
		_x additemCargoGlobal ["ACE_quikclot",_quick];
		_x additemCargoGlobal ["FSGm_ItemMedicBagMil",_medicbag];
		_x additemCargoGlobal ["ACE_personalAidKit",_pak];
		_x addBackpackCargoGlobal ["vurtual_stretcher_bag",_strecher];
	} foreach _objects;
};