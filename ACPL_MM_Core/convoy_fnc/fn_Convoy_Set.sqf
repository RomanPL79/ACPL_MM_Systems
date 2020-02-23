params ["_convoyGroup",["_convoySpeed",50],["_convoySeparation",50],["_pushThrough", true]];

_convoyGroup setvariable ["ACPL_MM_Core_Convoy", true, true];

if (_pushThrough) then {
	_convoyGroup enableAttack !(_pushThrough);
	{(vehicle _x) setUnloadInCombat [false, false];} forEach (units _convoyGroup);
};

_convoyGroup setFormation "COLUMN";

{
   	(vehicle _x) limitSpeed _convoySpeed*1.15;
    (vehicle _x) setConvoySeparation _convoySeparation;
	_x setVariable ["VCOM_NOAI",true];
	_x setVariable ["Vcm_Disable",true];
	_x setvariable ["TCL_Disabled",true];
} forEach (units _convoyGroup);

_convoyGroup setVariable ["Vcm_Disable",true];
_convoyGroup setvariable ["TCL_Disabled",true];
_convoyGroup setVariable ["zbe_cacheDisabled",true];

(vehicle leader _convoyGroup) limitSpeed _convoySpeed;

while {sleep 5;_convoyGroup getvariable ["ACPL_MM_Core_Convoy", true]} do {
	{
		if ((speed vehicle _x < 5) && (_pushThrough || (behaviour _x != "COMBAT"))) then {
			(vehicle _x) doFollow (leader _convoyGroup);
		};	
	} forEach (units _convoyGroup)-(crew (vehicle (leader _convoyGroup)))-allPlayers;
	{
		(vehicle _x) setConvoySeparation _convoySeparation;
	} forEach (units _convoyGroup);
};

{
   	(vehicle _x) limitSpeed 9999;
    (vehicle _x) setConvoySeparation _convoySeparation;
	_x setVariable ["VCOM_NOAI",false];
	_x setVariable ["Vcm_Disable",false];
	_x setvariable ["TCL_Disabled",false];
} forEach (units _convoyGroup);

_convoyGroup setVariable ["Vcm_Disable",false];
_convoyGroup setvariable ["TCL_Disabled",false];
_convoyGroup setVariable ["zbe_cacheDisabled",false];