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
	};
}