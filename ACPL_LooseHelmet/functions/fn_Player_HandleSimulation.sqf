params [
	["_unit", ObjNull],
	["_oldList", []]
];

// Sets sleep time
private _sleep = if (!(isPlayer _unit) || !(local _unit)) then {30} else {1};

// If is not a player then call with delay
if !(isPlayer _unit) exitwith {[{_this call ACPL_LooseHelmet_fnc_Player_HandleSimulation;}, [_unit], _sleep] call CBA_fnc_waitAndExecute;};

// Gets list of nearby weaponHolders
private _weaponHolders = (_unit nearEntities [["WeaponHolderSimulated_Scripted"], 5]) select {!(_x getVariable ["ACPL_LooseHelmet_Destroyed", false])};

// Checks is old list containing any detected weaponHolders
_oldList = _oldList - _weaponHolders;

// Disable simulation for weaponHolders from previous loop
{
	(_x getVariable ["ACPL_LooseHelmet_WH_dummy", ObjNull]) enableSimulation false;
	_x enableSimulation false;
} foreach _oldList;

// If no weaponHolders, unit is no player or unit 
if (count _weaponHolders == 0 || !(isPlayer _unit) || !(local _unit)) exitwith {
	[{_this call ACPL_LooseHelmet_fnc_Player_HandleSimulation;}, [_unit], _sleep] call CBA_fnc_waitAndExecute;
};

// Enables simulation for found weaponHolders
{
	(_x getVariable ["ACPL_LooseHelmet_WH_dummy", ObjNull]) enableSimulation true;
	_x enableSimulation true;
} foreach _weaponHolders;

// Starts function with delay
[{_this call ACPL_LooseHelmet_fnc_Player_HandleSimulation;}, [_unit, _weaponHolders], _sleep] call CBA_fnc_waitAndExecute;