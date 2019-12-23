class Man;
class CAManBase: Man {
	class ACE_SelfActions {
		class ACE_Equipment {
			class ACPL_LooseHelmet_menu {
				displayName = localize "STR_ACPL_LooseHelmet_act_menu";
				condition = "(headgear _player != '') || (primaryweapon _player != '')";
				statement = "";
				
				class ACPL_LooseHelmet_gun {
					displayName = localize "STR_ACPL_LooseHelmet_act_menu_gun";
					condition = "(primaryweapon _player != '')";
					statement = "[_player, 'GUN'] call ACPL_LooseHelmet_fnc_FixAction";
					icon = "\ACPL_LooseHelmet\icons\gun.paa";
				};
				class ACPL_LooseHelmet_helmet {
					displayName = localize "STR_ACPL_LooseHelmet_act_menu_helmet";
					condition = "(headgear _player != '')";
					statement = "[_player, 'HELMET'] call ACPL_LooseHelmet_fnc_FixAction";
					icon = "\ACPL_LooseHelmet\icons\helmet.paa";
				};
			};
		};
	};
};