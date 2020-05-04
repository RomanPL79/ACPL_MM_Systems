params [
	["_arty", ObjNull],
	["_player", ObjNull]
];

_arty setvariable ["ACPL_FireSupport_ArtyCancel", true, false];
if (!isNil "_player") then {
	[localize "STR_ACPL_FireSupport_CancelFireMission_hint"] remoteExec ["hint",_player];
};