params ["_unit", "_type"];

private _return = false;

//getting basic data

switch (_type) do {
	case "WEAPON": {
		//if it was weapon then checking if unit has any backup weapon
		
		private _noweapon = primaryWeapon _unit == "" && handgunWeapon _unit == "" && secondaryWeapon _unit == "";

		//if have other weapon then calculating posibility based on config setting

		//if random value is lower than configure setting then is true
		_return = _noweapon || random 100 < ACPL_LooseHelmet_Weap_PickUpChance;
	};
	case "HELMET": {
		//if it was headgear then calculating posibility based on config setting
		
		//if random value is lower than configure setting then is true
		_return = random 100 < ACPL_LooseHelmet_Helm_PickUpChance;
	};
	case "NVG": {
		//if it was NVG then checking is it a night/day and calculating posibility based on config setting
		//if it's night then always picking up
		
		private _daytime = daytime;
		private _sunriseSunsetTime = date call BIS_fnc_sunriseSunsetTime;
		private _sunrise = _sunriseSunsetTime select 0;
		private _sunset = _sunriseSunsetTime select 1;
		
		private _day = (_daytime > _sunrise) && (_daytime < _sunset);
		
		// if random value is lower than configure setting then is true
		_return = _day || random 100 < ACPL_LooseHelmet_NVG_PickUpChance;
	};
	case "CONTAINER": {
		_return = true;
	};
};

_return
