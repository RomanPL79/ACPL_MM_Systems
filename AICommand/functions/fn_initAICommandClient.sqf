#include "functions.h"

/*
	Author: [SA] Duda

	Description:
	
	Starts Advanced AI Command on client side. The AIC_fnc_initAICommand
	function is responsible for calling this and shouldn't be used outside of that.

	Parameter(s):
	_this select 0: STRING - Configuration mode
	_this select 1: ARRAY - Parameters
	
*/

params ["_configurationMode",["_parameters",[]]];

if(!hasInterface) exitWith {};

waitUntil {!isNil "AIC_INIT_STARTUP_SCRIPTS_EXECUTED" && !isNull player};

if(_configurationMode == "SPECIFIED_COMMANDERS_SPECIFIED_GROUPS") then {
	_parameters params ["_commandersModule","_commandControlId"];
	if(!isServer) then {
		[_commandControlId] call AIC_fnc_createCommandControl;
	};
	{
		if(_x == player) then {
			[_commandControlId, false] call AIC_fnc_showCommandControl;
			player setvariable ["ACPL_HC_commandControlId", _commandControlId];
		};
	} forEach (synchronizedObjects _commandersModule);
};

if(_configurationMode == "SPECIFIED_COMMANDERS_ALL_GROUPS") then {
	_parameters params ["_commandersModule"];
	{
		if(_x == player) then {
			if(side player == west) then {
				["ALL_WEST",false] call AIC_fnc_showCommandControl;
				player setvariable ["ACPL_HC_commandControlId", "ALL_WEST"];
			};
			if(side player == east) then {
				["ALL_EAST",false] call AIC_fnc_showCommandControl;
				player setvariable ["ACPL_HC_commandControlId", "ALL_EAST"];
			};
			if(side player == resistance) then {
				["ALL_GUER",false] call AIC_fnc_showCommandControl;
				player setvariable ["ACPL_HC_commandControlId", "ALL_GUER"];
			};
			if(side player == civilian) then {
				["ALL_CIV",false] call AIC_fnc_showCommandControl;
				player setvariable ["ACPL_HC_commandControlId", "ALL_CIV"];
			};
		};
	} forEach (synchronizedObjects _commandersModule);
};

if(_configurationMode == "ALL_COMMANDERS_ALL_GROUPS") then {
	if(side player == west) then {
		["ALL_WEST",false] call AIC_fnc_showCommandControl;
		player setvariable ["ACPL_HC_commandControlId", "ALL_WEST"];
	};
	if(side player == east) then {
		["ALL_EAST",false] call AIC_fnc_showCommandControl;
		player setvariable ["ACPL_HC_commandControlId", "ALL_EAST"];
	};
	if(side player == resistance) then {
		["ALL_GUER",false] call AIC_fnc_showCommandControl;
		player setvariable ["ACPL_HC_commandControlId", "ALL_GUER"];
	};
	if(side player == civilian) then {
		["ALL_CIV",false] call AIC_fnc_showCommandControl;
		player setvariable ["ACPL_HC_commandControlId", "ALL_CIV"];
	};
};