params ["_unit"];

private _return = false;

if (_unit getvariable ["ACPL_MM_Core_DoMove", false]) then {_return = true};
if (_unit getvariable ["ace_isunconscious", false]) then {_return = true};
if (_unit getvariable ["ACPL_MM_Core_DoStop_Suppressed", false]) then {_return = true};
if (_unit getvariable ["ACPL_MM_Core_DoStop_DoReact", false]) then {_return = true};
if (_unit getvariable ["ACPL_MM_Core_DoStop_DoRoam", false]) then {_return = true};
if (_unit getvariable ["ACPL_LooseHelmet_Busy", false]) then {_return = true;};
if (_unit getvariable ["ACPL_MM_Core_DoStop_Reloading", false]) then {_return = true;};
if (_unit getvariable ["ACPL_MM_Core_DoSupp_Enabled", false]) then {_return = true;};

_return