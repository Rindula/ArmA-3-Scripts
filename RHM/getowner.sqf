private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then {
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint "This vehicle has no information, it was probably spawned in through cheats.";};
	_owners = [_owners] call life_fnc_vehicleOwners;
	hint parseText format["<t color='#FF0000'><t size='2'>Vehicle Info</t></t><br/><t color='#FFD700'><t size='1.5'>Owners</t></t><br/> %1",_owners];
};
//_helfer = "B_soldier_M_F" createUnit [getPos player, group player, "this allowFleeing 0; this allowDamage false; this setName '[LEADER] Rindula'", 1, "Private"];