params [
	["_logic", ObjNull],
	["_synch", []],
	["_activated", false]
];

WaitUntil {sleep 1;time > 2};

private _units = synchronizedObjects _logic;

if (_activated) then {
	{
		_x setvariable ["ACPL_MM_Core_Medical_Excluded", true];
		_x setvariable ["ACPL_MM_Core_Medical_Done", true];
	} foreach _units;
	
	deletevehicle _logic;
};