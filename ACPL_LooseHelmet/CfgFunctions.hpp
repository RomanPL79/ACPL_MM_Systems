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
		
		//[] class ACPL_LooseHelmet_fnc_inventoryhandler;
		class inventoryhandler {};
		
		//[] spawn ACPL_LooseHelmet_fnc_noWeapCheck;
		class noWeapCheck {};
		
		//[] call ACPL_LooseHelmet_fnc_lookforgun;
		class lookforgun {};
		
		//[] call ACPL_LooseHelmet_fnc_pickup;
		class pickup {};

		//[] spawn ACPL_LooseHelmet_fnc_notMoving;
		class notMoving {};

		//[] spawn ACPL_LooseHelmet_fnc_DoMove;
		class doMove {};

		//[] spawn ACPL_LooseHelmet_fnc_DoStop;
		class DoStop {};

		//[] spawn ACPL_LooseHelmet_fnc_DisableLooseHelmet_module;
		class DisableLooseHelmet_module {};
	}
	
	class FSM
	{
		file = "ACPL_LooseHelmet\FSMS";
		
		//[] spawn ACPL_LooseHelmet_fnc_PickUpFSM;
		class PickUpFSM
		{
			ext = ".fsm";
		};
		
		//[] spawn ACPL_LooseHelmet_fnc_LookForWeap;
		class LookForWeap
		{
			ext = ".fsm";
		};
	};
}