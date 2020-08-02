class Default;
class CA_Magazine: Default {
	class ACPL_GetAmmo {
		cost = 1;
	};
};

class CA_LauncherMagazine: CA_Magazine {
	class ACPL_GetAmmo {
		cost = 10;
	};
};

class 1Rnd_HE_Grenade_shell: CA_Magazine {
	class ACPL_GetAmmo {
		cost = 5;
	};
};

class VehicleMagazine: CA_Magazine {
	class ACPL_GetAmmo {
		cost = 10;
	};
};

class 30Rnd_120mm_HE_shells: VehicleMagazine {
	class ACPL_GetAmmo {
		cost = 50;
	};
};

class 14Rnd_80mm_rockets: VehicleMagazine {
	class ACPL_GetAmmo {
		cost = 100;
	};
};

class 32Rnd_155mm_Mo_shells: VehicleMagazine {
	class ACPL_GetAmmo {
		cost = 50;
	};
};

class SPG9_HEAT: VehicleMagazine {
	class ACPL_GetAmmo {
		cost = 20;
	};
};

class 1000Rnd_Gatling_30mm_Plane_CAS_01_F: VehicleMagazine {
	class ACPL_GetAmmo {
		cost = 100;
	};
};

class 680Rnd_35mm_AA_shells: VehicleMagazine {
	class ACPL_GetAmmo {
		cost = 100;
	};
};