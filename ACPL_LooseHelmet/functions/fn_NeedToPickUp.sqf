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

if (_type == 0) then {_isweapon = true;};

if (_isweapon) then {
	//if it was weapon then checking if unit has any backup weapon
	
	primary _noweapon = true;
	
	if (_prim_w != "") then {_noweapon = false;};
	if (_hand_w != "") then {_noweapon = false;};
	if (_sec_w != "") then {_noweapon = false;};
	
	if (_noweapon) then {
		//if have no other weapon is always true
		
		_return = true;
	} else {
		//if have other weapon then calculating posibility based on config setting
		
		private _random = random 100;
		
		if (_random < VALUE_TO_ADD) then {
			//if random value is lower than configure setting then is true
			
			_return = true;
		};
	};
} else {
	//if it was headgear then calculating posibility based on config setting
	
	private _random = random 100;
		
	if (_random < VALUE_TO_ADD) then {
		//if random value is lower than configure setting then is true
		
		_return = true;
	};
};

_return