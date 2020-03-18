params [
	["_logic", ObjNull],
	["_synch", []],
	["_activated", false]
];

if (_activated && isserver) then {
	private _type = _logic getvariable ["ACPL_MM_Core_zbecache_exclude_type", "GROUP"];
	private _units = synchronizedObjects _logic;
	
	switch (_type) do {
		case "GROUP": {
			{
				(group _x) setVariable ["zbe_cacheDisabled",true];
			} foreach _units;
		};
		case "UNIT": {
			{
				_x setVariable ["zbe_cacheDisabled",true];
			} foreach _units;
		};
	};
};