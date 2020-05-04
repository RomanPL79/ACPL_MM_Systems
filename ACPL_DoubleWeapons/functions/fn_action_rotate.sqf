params [
	["_object", ObjNull],
	["_rotations", []]
];

/*
	Script created by: bapedibupa
*/

private _aroundX = _rotations select 0; 
private _aroundY = _rotations select 1; 
private _aroundZ = _rotations select 2; 

private _dirX = 0; 
private _dirY = 1; 
private _dirZ = 0; 

private _upX = 0; 
private _upY = 0; 
private _upZ = 1; 

if (_aroundX != 0) then { 
    _dirY = cos _aroundX; 
    _dirZ = sin _aroundX; 

    _upY = -sin _aroundX; 
    _upZ = cos _aroundX; 
}; 

if (_aroundY != 0) then { 
    _dirX = _dirZ * sin _aroundY; 
    _dirZ = _dirZ * cos _aroundY; 

     _upX = _upZ * sin _aroundY; 
    _upZ = _upZ * cos _aroundY; 
}; 

 if (_aroundZ != 0) then { 
	_dirXTemp = _dirX; 
	_dirX = (_dirY * -sin _aroundZ) + (_dirXTemp* cos _aroundZ); 
    _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ); 

    _upXTemp = _upX; 
    _upX = (_upY * -sin _aroundZ) + (_upXTemp * cos _aroundZ); 
    _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ); 
}; 

_dirX = [_dirX,3] call BIS_fnc_cutDecimals; 
_dirY = [_dirY,3] call BIS_fnc_cutDecimals; 
_dirZ = [_dirZ,3] call BIS_fnc_cutDecimals; 

_upX = [_upX,3] call BIS_fnc_cutDecimals; 
_upY = [_upY,3] call BIS_fnc_cutDecimals; 
_upZ = [_upZ,3] call BIS_fnc_cutDecimals; 

private _dir = [_dirX,_dirY,_dirZ]; 
private _up = [_upX,_upY,_upZ]; 

_object setVectorDirAndUp [_dir,_up]; 