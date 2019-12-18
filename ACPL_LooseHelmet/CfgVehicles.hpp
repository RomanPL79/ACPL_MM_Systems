class Items_base_F;
class ACPL_LooseHelmet_invisible_can: Items_base_F
{
	author="[ACPL] Roman79";
	mapSize=0.050000001;
	class SimpleObject
	{
		eden=0;
		animate[]={};
		hide[]={};
		verticalOffset=0.039999999;
		verticalOffsetWorld=0;
		init="''";
	};
	editorPreview="";
	_generalMacro="";
	scope=0;
	scopeCurator=0;
	displayName="ACPL_LooseHelmet_invisible_can";
	model="ACPL_LooseHelmet\models\invisible_can.p3d";
	icon="";
};

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
					icon "\ACPL_LooseHelmet\icons\gun.paa";
				};
				class ACPL_LooseHelmet_helmet {
					displayName = localize "STR_ACPL_LooseHelmet_act_menu_helmet";
					condition = "(headgear _player != '')";
					statement = "[_player, 'HELMET'] call ACPL_LooseHelmet_fnc_FixAction";
					icon "\ACPL_LooseHelmet\icons\helmet.paa";
				};
			};
		};
	};
};