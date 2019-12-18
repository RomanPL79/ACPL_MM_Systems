class ACPL_LooseHelmet {
	tag = "ACPL_SkillSystem";
	class Functions {
		file = "ACPL_LooseHelmet\functions";
		
		//[] call ACPL_LooseHelmet_fnc_HitHandler;
		class HitHandler {};
		
		//[] spawn ACPL_LooseHelmet_fnc_DropHelmet;
		class DropHelmet {};
		
		//[] call ACPL_LooseHelmet_fnc_DropWeapon;
		class DropWeapon {};
		
		//[] call ACPL_LooseHelmet_fnc_Destroyed;
		class Destroyed {};
		
		//[] call ACPL_LooseHelmet_fnc_NeedToPickUp;
		class NeedToPickUp {};
		
		//[] spawn ACPL_LooseHelmet_fnc_GoPickUp;
		class GoPickUp {};
		
		//[] call ACPL_LooseHelmet_fnc_FixAction;
		class FixAction {};
	}
	
	class FSM
	{
		file = "ACPL_LooseHelmet\FSMS";
		
		class PickUp
		{
			ext = ".fsm";
		};
	}
}