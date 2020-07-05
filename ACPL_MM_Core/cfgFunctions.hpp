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
		
		//[] call ACPL_MM_Core_fnc_zbecache_module
		class zbecache_module {};
		
		//[] call ACPL_MM_Core_fnc_zbecache_exclude_module
		class zbecache_exclude_module {};

		//[] call ACPL_MM_Core_fnc_KnowsAboutEnemy
		class KnowsAboutEnemy {};
	};

	#include "doStop_fncs\functions.hpp"

	#include "doSupp_fncs\functions.hpp"

	#include "spawner_fncs\functions.hpp"

	class Taskmaster
	{
		file = "ACPL_MM_Core\taskmaster";
		
		//[] spawn ACPL_MM_Core_fnc_shk_taskmaster;
		class shk_taskmaster {};
		
		//[] spawn ACPL_MM_Core_fnc_shk_actualize;
		class shk_actualize {};
		
		//[] spawn ACPL_MM_Core_fnc_shk_createNew;
		class shk_createNew {};
	};

	class Convoy
	{
		file = "ACPL_MM_Core\convoy_fnc";
		
		//[] spawn ACPL_MM_Core_fnc_Convoy_Create;
		class Convoy_Create {};
		
		//[] spawn ACPL_MM_Core_fnc_Convoy_Destroy;
		class Convoy_Destroy {};
		
		//[] spawn ACPL_MM_Core_fnc_Convoy_Set;
		class Convoy_Set {};
	};

	class VCOM
	{
		file = "ACPL_MM_Core\Vcom";
		
		//[] spawn ACPL_MM_Core_fnc_VcomInit;
		class VcomInit {};
	};

	class TCL
	{
		file = "ACPL_MM_Core\TCL_System";
		
		//[] spawn ACPL_MM_Core_fnc_TCLInit;
		class TCLInit {};
	};

	class CM
	{
		file = "ACPL_MM_Core\CustomMarkers_fncs";
		
		//[] spawn ACPL_MM_Core_fnc_CM_add;
		class CM_add {};
		
		//[] spawn ACPL_MM_Core_fnc_CM_Mark;
		class CM_Mark {};
	};
	
	class headless
	{
		file = "ACPL_MM_Core\Headless_fncs";
		
		//[] spawn ACPL_MM_Core_fnc_init_headless;
		class init_headless {};
		
		//[] spawn ACPL_MM_Core_fnc_headless_givecontrol;
		class headless_givecontrol {};
	};
};
