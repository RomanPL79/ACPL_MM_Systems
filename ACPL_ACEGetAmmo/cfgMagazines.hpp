class Default;
class CA_Magazine: Default {
	ACPL_GetAmmo {
		cost = 1;
	};
};

class CA_LauncherMagazine: CA_Magazine {
	ACPL_GetAmmo {
		cost = 10;
	};
};

class 1Rnd_HE_Grenade_shell: CA_Magazine {
	ACPL_GetAmmo {
		cost = 5;
	};
};