class Man;
class CAManBase: Man {
	class ACE_SelfActions {
		class ACE_Equipment {
			class ACPL_WeaponsOnBack_menu {
				displayName = "$STR_ACPL_WeaponsOnBack_act_menu";
				condition = "(_player getvariable ['ACPL_WeaponsOnBack_place', true]) || (primaryweapon _player != '') || (secondaryweapon _player != '')";
				statement = "";
				icon = "\ACPL_WeaponsOnBack\icons\gun.paa";
				
				class ACPL_WeaponsOnBack_put_primary {
					displayName = "$STR_ACPL_WeaponsOnBack_act_primary";
					condition = "(primaryweapon _player != '') && !(_player getvariable ['ACPL_WeaponsOnBack_place', true])";
					statement = "[[_player, 'GUN', true], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_WeaponsOnBack\icons\primary.paa";
				};
				class ACPL_WeaponsOnBack_put_secondary {
					displayName = "$STR_ACPL_WeaponsOnBack_act_secondary";
					condition = "(secondaryweapon _player != '') && !(_player getvariable ['ACPL_WeaponsOnBack_place', true])";
					statement = "[[_player, 'GUN', true], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_WeaponsOnBack\icons\secondary.paa";
				};
				class ACPL_WeaponsOnBack_drop {
					displayName = "$STR_ACPL_WeaponsOnBack_act_drop";
					condition = "(_player getvariable ['ACPL_WeaponsOnBack_place', true])";
					statement = "[[_player, 'GUN', true], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_WeaponsOnBack\icons\drop.paa";
				};
				class ACPL_WeaponsOnBack_swap {
					displayName = "$STR_ACPL_WeaponsOnBack_act_swap";
					condition = "(_player getvariable ['ACPL_WeaponsOnBack_place', true])";
					statement = "[[_player, 'GUN', true], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_WeaponsOnBack\icons\arrow.paa";
				};
				class ACPL_WeaponsOnBack_info {
					displayName = "$STR_ACPL_WeaponsOnBack_act_info";
					condition = "(_player getvariable ['ACPL_WeaponsOnBack_place', true])";
					statement = "[[_player, 'GUN', true], ACPL_LooseHelmet_fnc_FixAction] remoteExec ['call', _player];";
					icon = "\ACPL_WeaponsOnBack\icons\gun.paa";
				};
			};
		};
	};
};
