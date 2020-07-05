params ["_unit"];

//Checking is unit busy
private _return = false;

if (_unit getvariable ["ACPL_MM_DoStop_Busy", false]) then {_return = true};
if (_unit getvariable ["ace_isunconscious", false]) then {_return = true};
if (_unit getvariable ["ACPL_LooseHelmet_Busy", false]) then {_return = true;};
if (_unit getVariable ["ACPL_Support_MedicBusy", false]) then {_return = true;};

_return