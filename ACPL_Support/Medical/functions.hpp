class Medical {
	file = "ACPL_Support\Medical";
	
	//[] call ACPL_Support_fnc_medical_action_heal;
	class medical_action_heal {};
	
	//[] call ACPL_Support_fnc_medical_check_woundednearby;
	class medical_check_woundednearby {};
	
	//[] call ACPL_Support_fnc_medical_create_medicalrubbish;
	class medical_create_medicalrubbish {};
	
	//[] call ACPL_Support_fnc_medical_handle_rubbish;
	class medical_handle_rubbish {};
	
	//[] call ACPL_Support_fnc_medical_init;
	class medical_init {};
};

class Medical_FSM {
	file = "ACPL_Support\Medical\fsm";
	
	//[] spawn ACPL_Support_fnc_MedicalHelp;
	class MedicalHelp {
		ext = ".fsm";
	};
};