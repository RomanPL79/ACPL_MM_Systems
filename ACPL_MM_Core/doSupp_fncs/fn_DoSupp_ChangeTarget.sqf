params [
	["_unit", ObjNull],
	["_dummy", ObjNull],
	["_target", ObjNull]
];

if (
	!(_unit getVariable ["ACPL_MM_Core_DoSupp_Suppressing", false]) ||
	!(alive _unit)
) exitwith {};

_target params [
	["_object", ObjNull],
	"",
	["_precision", 1]
];

//Geting position of target
private _pos = getpos _object;

//If has no visibility on target then shoot at last known position
if (([vehicle _unit, "VIEW", _object] checkVisibility [eyepos _unit, eyepos _object]) < 0.1) then {
	_pos = _unit getVariable ["ACPL_MM_Core_DoSupp_LastFirePos", [0,0,0]];
} else {
	_unit setVariable ["ACPL_MM_Core_DoSupp_LastFirePos", _pos];
};

//Calculating aiming error
private _error = _precision + (1 / (_unit skill "aimingAccuracy"));
private _pos_x = (_pos select 0) + (random [-_error,0,_error]);
private _pos_y = (_pos select 1) + (random [-_error,0,_error]);
private _pos_z = (_pos select 2) + (random [-_error,0,_error]);
if (_pos_z < 0) then {_pos_z = 0;};
_pos = [_pos_x, _pos_y, _pos_z];

//Changing position of the dummy
_dummy setpos _pos;

//If unit is not able to see the target then move it higher
if (([vehicle _unit, "VIEW", _dummy] checkVisibility [eyepos _unit, getposASL _dummy]) < 0.1) then {
	_pos_z = _pos_z + 1.5;
	_pos = [_pos_x, _pos_y, _pos_z];
	_dummy setpos _pos;
};

//Making unit aim at target
_unit doWatch ObjNull;
_unit dowatch _dummy;
_unit lookAt _dummy;
_unit doTarget _dummy;

//Ordering suppressiveFire on dummy
_unit doSuppressiveFire _dummy;

//Calling function again with delay
[{
	_this call ACPL_MM_Core_fnc_DoSupp_ChangeTarget;
}, _this, 5] call CBA_fnc_waitAndExecute;