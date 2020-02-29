class Man;
class CAManBase: Man {
	class ACE_SelfActions {
		class ACE_Equipment {
			class ACPL_LooseHelmet_menu {
				displayName = "$STR_ACPL_LooseHelmet_act_menu";
				condition = "(headgear _player != '') || (primaryweapon _player != '')";
				statement = "";
				
				class ACPL_LooseHelmet_gun_fasten {
					displayName = "$STR_ACPL_LooseHelmet_act_menu_gun_fasten";
					condition = "(primaryweapon _player != '') && !(_player getVariable ['ACPL_LooseWeapon_fix_gun', false])";
					statement = "[[_player, 'GUN', true], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_LooseHelmet\icons\gun.paa";
				};
				class ACPL_LooseHelmet_gun_unfasten {
					displayName = "$STR_ACPL_LooseHelmet_act_menu_gun_unfasten";
					condition = "(primaryweapon _player != '') && (_player getVariable ['ACPL_LooseWeapon_fix_gun', false])";
					statement = "[[_player, 'GUN', false], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_LooseHelmet\icons\gun.paa";
				};
				class ACPL_LooseHelmet_helmet_fasten {
					displayName = "$STR_ACPL_LooseHelmet_act_menu_helmet_fasten";
					condition = "(headgear _player != '') && !(_player getVariable ['ACPL_LooseWeapon_fix_helmet', false])";
					statement = "[[_player, 'HELMET', true], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_LooseHelmet\icons\helmet.paa";
				};
				class ACPL_LooseHelmet_helmet_unfasten {
					displayName = "$STR_ACPL_LooseHelmet_act_menu_helmet_unfasten";
					condition = "(headgear _player != '') && (_player getVariable ['ACPL_LooseWeapon_fix_helmet', false])";
					statement = "[[_player, 'HELMET', false], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_LooseHelmet\icons\helmet.paa";
				};
			};
		};
	};
};
