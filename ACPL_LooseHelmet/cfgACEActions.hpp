class Man;
class CAManBase: Man {
	class ACE_SelfActions {
		class ACE_Equipment {
			class ACPL_LooseHelmet_menu {
				displayName = "$STR_ACPL_LooseHelmet_act_menu";
				condition = "(headgear _player != '') || (primaryweapon _player != '')";
				statement = "";
				
				class ACPL_LooseHelmet_gun {
					displayName = "$STR_ACPL_LooseHelmet_act_menu_gun";
					condition = "(primaryweapon _player != '')";
					statement = "[[_player, 'GUN'],ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call',_player];";
					icon = "\ACPL_LooseHelmet\icons\gun.paa";
				};
				class ACPL_LooseHelmet_helmet {
					displayName = "$STR_ACPL_LooseHelmet_act_menu_helmet";
					condition = "(headgear _player != '')";
					statement = "[[_player, 'HELMET'],ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call',_player];";
					icon = "\ACPL_LooseHelmet\icons\helmet.paa";
				};
			};
		};
	};
};