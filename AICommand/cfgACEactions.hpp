class Man;
class CAManBase: Man {
	class ACE_SelfActions {
		class ACPL_HC_Menu {
			displayName = "$STR_ACPL_AI_Command_Menu";
			condition = "true";
			statement = "";
			exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
			
			class ACPL_HC_on {
				displayName = "$STR_ACPL_AI_Command_Menu_Toggle_on";
				condition = "!(_player getvariable ['ACPL_HC_Toggled', false])";
				statement = "private _id = _player getvariable ['ACPL_HC_commandControlId', 'ALL_WEST'];[_id,true] call AIC_fnc_showCommandControl;hint (localize 'STR_ACPL_AI_Command_Hint_Toggle_on');_player setvariable ['ACPL_HC_Toggled', true];";
				exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
			};
			class ACPL_HC_off {
				displayName = "$STR_ACPL_AI_Command_Menu_Toggle_off";
				condition = "_player getvariable ['ACPL_HC_Toggled', false]";
				statement = "private _id = _player getvariable ['ACPL_HC_commandControlId', 'ALL_WEST'];[_id,false] call AIC_fnc_showCommandControl;hint (localize 'STR_ACPL_AI_Command_Hint_Toggle_off');_player setvariable ['ACPL_HC_Toggled', false];";
				exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
			};
		};
	};
};