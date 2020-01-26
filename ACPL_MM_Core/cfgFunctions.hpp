class ACPL_MM_Core {
	tag = "ACPL_MM_Core";
	class Functions {
		file = "ACPL_MM_Core\functions";
		
		//[] call ACPL_MM_Core_fnc_DoMove;
		class DoMove {};
		
		//[] spawn ACPL_MM_Core_fnc_WeatherLoop;
		class WeatherLoop {};
		
		//[] call ACPL_MM_Core_fnc_RemoveMedicaments
		class RemoveMedicaments {};
		
		//[] call ACPL_MM_Core_fnc_AddMedicaments
		class AddMedicaments {};
		
		//[] call ACPL_MM_Core_fnc_AddCustomMedicaments
		class AddCustomMedicaments {};
		
		//[] call ACPL_MM_Core_fnc_CreateMC
		class CreateMC {};
		
		//[] call ACPL_MM_Core_fnc_MedicalChangeRole
		class MedicalChangeRole {};
		
		//[] call ACPL_MM_Core_fnc_MedicalAddExcluded
		class MedicalAddExcluded {};
		
		//[] call ACPL_MM_Core_fnc_CalculateCamo
		class CalculateCamo {};
		
		//[] call ACPL_MM_Core_fnc_CheckEnemy
		class CheckEnemy {};
		
		//[] call ACPL_MM_Core_fnc_EnemyToClose
		class EnemyToClose {};
		
		//[] call ACPL_MM_Core_fnc_isInCombat
		class isInCombat {};
		
		//[] call ACPL_MM_Core_fnc_CheckVisFrom
		class CheckVisFrom {};
		
		//[] call ACPL_MM_Core_fnc_CheckTakenPos
		class CheckTakenPos {};
		
		//[] call ACPL_MM_Core_fnc_CheckSeeEnemy
		class CheckSeeEnemy {};
		
		//[] call ACPL_MM_Core_fnc_CheckSeeEnemy_FromPos
		class CheckSeeEnemy_FromPos {};
		
		//[] call ACPL_MM_Core_fnc_PlayerInRange
		class PlayerInRange {};
	};
	
	class DoStop {
		file = "ACPL_MM_Core\doStop_fncs";
		
		//[] call ACPL_MM_Core_fnc_DoStop_init
		class DoStop_init {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_Prepare
		class DoStop_Prepare {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_isBusy
		class DoStop_isBusy {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_needToReact
		class DoStop_needToReact {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_needToRoam
		class DoStop_needToRoam {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_checkWrongUnitPos
		class DoStop_checkWrongUnitPos {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_checkWrongPos
		class DoStop_checkWrongPos {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_DoMove
		class DoStop_DoMove {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_canrunCheck
		class DoStop_canrunCheck {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_runCheck
		class DoStop_runCheck {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_checkSuppresed
		class DoStop_checkSuppresed {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_Suppressed
		class DoStop_Suppressed {};
		
		//[] spawn ACPL_MM_Core_fnc_DoStop_hide
		class DoStop_hide {};
		
		//[] spawn ACPL_MM_Core_fnc_DoStop_duck
		class DoStop_duck {};
		
		//[] spawn ACPL_MM_Core_fnc_DoStop_ChangePos
		class DoStop_ChangePos {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_isStaticNearby
		class DoStop_isStaticNearby {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_MountStatic
		class DoStop_MountStatic {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_Static_hasammo
		class DoStop_Static_hasammo {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_Static_isDestroyed
		class DoStop_Static_isDestroyed {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_exitVehEnd
		class DoStop_exitVehEnd {};
		
		//[] call ACPL_MM_Core_fnc_DoStop_start
		class DoStop_start {};
	}
	
	class DoStop_FSMs
	{
		file = "ACPL_MM_Core\doStop_fncs\FSMs";
		
		//[] spawn ACPL_MM_Core_fnc_DoStop;
		class DoStop
		{
			ext = ".fsm";
		};
		
		//[] spawn ACPL_MM_Core_fnc_DoRoam;
		class DoRoam
		{
			ext = ".fsm";
		};
		
		//[] spawn ACPL_MM_Core_fnc_DoReact;
		class DoReact
		{
			ext = ".fsm";
		};
	}
	
	class betterSupp
	{
		file = "ACPL_MM_Core\betterSupp";
		
		//[] spawn ACPL_MM_Core_fnc_BS_init;
		class BS_init {};
	}
	
	class DoSupp
	{
		file = "ACPL_MM_Core\DoSupp";
		
		//[] spawn ACPL_MM_Core_fnc_DoSupp_fnc;
		class DoSupp_fnc {};
		
		//[] call ACPL_MM_Core_fnc_DoSupp_ListAvaibleTargets;
		class DoSupp_ListAvaibleTargets {};
		
		//[] spawn ACPL_MM_Core_fnc_DoSupp_OrderSupp;
		class DoSupp_OrderSupp {};
		
		//[] call ACPL_MM_Core_fnc_DoSupp_isBusy;
		class DoSupp_isBusy {};
	}
	
	class DoSupp_FSMs
	{
		file = "ACPL_MM_Core\DoSupp\FSMs";
		
		//[] spawn ACPL_MM_Core_fnc_DoSupp;
		class DoSupp {
			ext = ".fsm";
		};
	}
}