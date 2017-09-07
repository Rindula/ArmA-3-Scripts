while {true} do {

{
    if (alive _x) then {
    if !(_x in markers) then {
        _mark = createMarkerLocal [str(_x), position _x];
        markers set [count markers, _x];
    };

        _curtarget = str(_x);
        _curtargetname = getText (configFile >> 'cfgVehicles' >> typeOf _x >> 'displayName');
        _curtargetdir = if (round(getDir _x) >= 360) then {0} else {round(getDir _x)};



switch (side _x) do {
	case west : {
		switch (true) do {
			case (_x isKindOf "Car"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "b_motor_inf" };
			case (_x isKindOf "Tank"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "b_armor" };
			case (_x isKindOf "Helicopter"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "b_air" };
			case (_x isKindOf "Plane"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "b_plane" };
			case (_x isKindOf "Ship"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "b_naval" };
		};
	};
	case east : {
		switch (true) do {
			case (_x isKindOf "Car"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "o_motor_inf" };
			case (_x isKindOf "Tank"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "o_armor" };
			case (_x isKindOf "Helicopter"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "o_air" };
			case (_x isKindOf "Plane"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "o_plane" };
			case (_x isKindOf "Ship"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "o_naval" };
		};
	};
	case resistance : {
		switch (true) do {
			case (_x isKindOf "Car"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "n_motor_inf" };
			case (_x isKindOf "Tank"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "n_armor" };
			case (_x isKindOf "Helicopter"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "n_air" };
			case (_x isKindOf "Plane"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "n_plane" };
			case (_x isKindOf "Ship"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "n_naval" };
		};
	};
	default {
		switch (true) do {
			case (_x isKindOf "Car"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "mil_unknown" };
			case (_x isKindOf "Tank"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "mil_unknown" };
			case (_x isKindOf "Helicopter"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "mil_unknown" };
			case (_x isKindOf "Plane"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "mil_unknown" };
			case (_x isKindOf "Ship"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "mil_unknown" };
		};
		_curtarget setMarkerAlphaLocal 0.1;
	};
};

_curtarget setMarkerPosLocal position _x;
} else {
    _temp = _x getVariable ["rhm_tot",false];
    if (!(str(_x) in deaded)&&!(_temp)) then {
    [_x] spawn {
        _veh = _this select 0;
        deleteMarkerLocal str(_veh);
        deaded set [count deaded, str(_veh)];
        _curtargetname = getText (configFile >> 'cfgVehicles' >> typeOf _veh >> 'displayName');
        _veh setVariable ["rhm_tot",true,true];
        [parseText format["<t color = '#e00000'>Verbindung zu einem GPS Systems verloren!</t>"], [0.25, 1, 0.5, 0.05], nil, 1] spawn     BIS_fnc_textTiles;
        uiSleep(2);
        [parseText format["Fahrzeug: %1<br />Grad: %2°<br />Distanz: %3m", _curtargetname, round([player, _veh] call BIS_fnc_dirTo), round(player distance _veh)],[0.25, 1, 0.5, 0.15]] spawn  BIS_fnc_textTiles;
    };
    };
};
} forEach vehicles;
uiSleep (0.01);
};