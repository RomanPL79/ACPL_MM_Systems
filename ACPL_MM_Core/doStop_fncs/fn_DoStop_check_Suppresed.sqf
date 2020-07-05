params [
	["_unit", ObjNull]
];

private _supp = getSuppression _unit;
private _courage = _unit skill "courage";

if (_supp > _courage) exitwith {
	true
};

false