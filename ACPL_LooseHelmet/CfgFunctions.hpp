class ACPL_LooseHelmet {
	tag = "ACPL_LooseHelmet";
	class Functions {
		file = "ACPL_LooseHelmet\functions";
		
		//[] call ACPL_LooseHelmet_fnc_HitHandler;
		class HitHandler {};
		
		//[] spawn ACPL_LooseHelmet_fnc_DropHelmet;
		class DropHelmet {};
		
		//[] call ACPL_LooseHelmet_fnc_DropWeapon;
		class DropWeapon {};
		
		//[] call ACPL_LooseHelmet_fnc_Destroy;
		class Destroy {};
		
		//[] call ACPL_LooseHelmet_fnc_NeedToPickUp;
		class NeedToPickUp {};
		
		//[] spawn ACPL_LooseHelmet_fnc_GoPickUp;
		class GoPickUp {};
		
		//[] call ACPL_LooseHelmet_fnc_FixAction;
		class FixAction {};
		
		//[] call ACPL_LooseHelmet_fnc_player_pickup;
		class player_pickup {};
		
		//[] class ACPL_LooseHelmet_fnc_inventoryhandler;
		class inventoryhandler {};
	}
	
	class FSM
	{
		file = "ACPL_LooseHelmet\FSMS";
		
		//[] spawn ACPL_LooseHelmet_fnc_PickUp;
		class PickUp
		{
			ext = ".fsm";
		};
	}
}