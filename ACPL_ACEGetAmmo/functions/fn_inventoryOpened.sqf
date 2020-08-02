params ["_unit", ["_container", ObjNull], ["_secondary", objNull]];

ACPL_ACEgetAmmo_Vehicle = _container;

waitUntil {!(isnull (finddisplay 602))};

((findDisplay 602) displayCtrl 640) ctrlAddEventHandler ["LBDblClick", "[{_this call ACPL_ACEgetAmmo_fnc_addCrate;}, [(_this # 0), (_this # 1), player], 0.1] call CBA_fnc_waitAndExecute;;"];