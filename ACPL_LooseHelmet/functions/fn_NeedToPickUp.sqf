/* ----------------------------------------------------------------------------
	Function: ACPL_LooseHelmet_fnc_NeedToPickUp

	Description: Checking that is necessary picking up that item

	Parameters: 
		- unit			unit who will be picking up item
		- type			type of item ("GUN", "HELMET" or "NVG")

	Returns: true or false

	Author: [ACPL] Roman79
	
	Version: 1
	
	Execution: call

---------------------------------------------------------------------------- */

params ["_unit", "_type"];

private _return = false;

//getting basic data

private _beh = behaviour _unit;
private _incombat = false;
private _isweapon = false;
private _weapons = weapons _unit;

private _prim_w = primaryWeapon _unit;
private _hand_w = handgunWeapon _unit;
private _sec_w = secondaryWeapon _unit;

if (_beh == "COMBAT") then {_incombat = true;};

switch (_type) do {
	case "GUN": {
		//if it was weapon then checking if unit has any backup weapon
		
		private _noweapon = true;
		
		if (_prim_w != "") then {_noweapon = false;};
		if (_hand_w != "") then {_noweapon = false;};
		if (_sec_w != "") then {_noweapon = false;};
		
		if (_noweapon) then {
			//if have no other weapon is always true
			
			_return = true;
		} else {
			//if have other weapon then calculating posibility based on config setting
			
			private _random = random 100;
			
			if (_random < ACPL_LooseHelmet_Weap_PickUpChance) then {
				//if random value is lower than configure setting then is true
				
				_return = true;
			};
		};
	};
	case "HELMET": {
		//if it was headgear then calculating posibility based on config setting
		
		private _random = random 100;
			
		if (_random < ACPL_LooseHelmet_Helm_PickUpChance) then {
			//if random value is lower than configure setting then is true
			
			_return = true;
		};
	};
	case "NVG": {
		//if it was NVG then checking is it a night/day and calculating posibility based on config setting
		//if it's night then always picking up
		
		private _time = daytime;
		
		private _day = true;
		
		private _sunriseSunsetTime = date call BIS_fnc_sunriseSunsetTime;
		private _sunrise = _sunriseSunsetTime select 0;
		private _sunset = _sunriseSunsetTime select 1;
		
		if ((_time < _sunrise) && (_time > _sunset)) then {
			_day = false
		};
		
		if (_day) then {
		
			private _random = random 100;
				
			if (_random < ACPL_LooseHelmet_NVG_PickUpChance) then {
				//if random value is lower than configure setting then is true
				
				_return = true;
			};
		} else {
			_return = true;
		};
	};
};

_return