ct = 0;

rhm_lock_it_up = {
    private["_vehicle","_state"];
    _vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
    _state = [_this,1,2,[0,false]] call BIS_fnc_param;
    if(isNull _vehicle) exitWith {};

    _vehicle lock _state;
};

while{true} do {
    publicVariable "rhm_lock_it_up";
    if (isNil "life_vehicles") then {
        life_vehicles = [];
    };
    if (isNil "life_carryWeight") then {
        life_carryWeight = 0;
    };
    if(life_carryWeight != 0) then {life_carryWeight = 0;};
    // antidote1 = 2581;
    life_battery = 100;
    life_hunger = 100;
    life_thirst = 100;
    player setFatigue 0;
    [] call life_fnc_hudUpdate;
    vehicle player setFuel 1;
    // vehicle player setWeaponReloadingTime[vehicle player,currentWeapon vehicle player,0];
    // life_isTazed = true;
    // player setVariable["restrained",FALSE,TRUE];

    {
        if ((player distance _x) > 10) then {
            if (local _x) then {
                _x lock 2;
            } else {
                [[_veh,2],"rhm_lock_it_up",_veh,false] spawn BIS_fnc_MP;
            }
        } else {
            if (local _x) then {
                _x lock 0;
            } else {
                [[_veh,0],"rhm_lock_it_up",_veh,false] spawn BIS_fnc_MP;
            }
        };
    } forEach life_vehicles;

    sleep 2;

};

/*
AMV-7 Marshall INIT:
this addEventHandler ["fired", {_this select 0 setVehicleAmmo 1}]; this setCaptive true; this setObjectTexture [2,""]; this lockTurret [[0,0], true]; this lockTurret [[0], true]; this removeWeaponTurret ["LMG_M200",[0]]; this removeWeaponTurret ["autocannon_40mm_CTWS",[0]];
*/