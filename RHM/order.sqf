_veh = createVehicle ["B_Heli_Transport_01_F", position player, [], 0, "none"];
uiSleep(0.1);
	_light = "#lightpoint" createvehicle [0,0,1];
	_light setLightDayLight true;
	_light setLightAmbient [0.05, 0.05, 0.1];
	_light setlightcolor [0.1, 0.1, 1];
	_light setLightBrightness 2;
	
	_light attachTo [_veh,[0,0,1]];
_currentTask = player createSimpleTask ["Querfeldeinflug"];
clearItemCargoGlobal _veh;
_currentTask setSimpleTaskDescription ["Steig in den Heli ein, und wähle dein Flugziel auf der Karte aus!", "Einsteigen", "Einsteigen"];
_currentTask setSimpleTaskDestination (getPos _veh);
_currentTask setTaskState "Assigned";
["TaskAssigned",["","Einsteigen"]] call BIS_fnc_showNotification;
player setCurrentTask _currentTask;
_veh setObjectTextureGlobal [0,"#(rgb,8,8,3)color(0.8,0.8,0.8,1)"];
_veh setObjectTextureGlobal [1,"#(rgb,8,8,3)color(0,0,0.2,1)"];
_veh setObjectTextureGlobal [2,"#(rgb,8,8,3)color(0,0,0.2,1)"];
posi = nil;
createVehicleCrew _veh;
uiSleep(0.1);
_veh engineOn true;
_veh action ["CollisionLightOn", _veh];
_veh action ["lightOn", _veh];
{_x disableAI "AUTOTARGET"; group _x setBehaviour "SAFE"; _x setCaptive true;} forEach crew _veh;
while {true and alive _veh} do {
    scopeName "waitForJoin";
    if (player in (crew _veh)) then {
        breakOut "waitForJoin";
    };
    if (player distance _veh > 20) then{
        _veh engineOn false;
    } else {
        _veh engineOn true;
        _veh lock false;
    };
    uiSleep(0.1);
    hintSilent format["Einmal einsteigen bitte..."];
};
["TaskSucceeded",["","Einsteigen"]] call BIS_fnc_showNotification;
["TaskAssigned",["","Ziel wählen"]] call BIS_fnc_showNotification;
_currentTask setSimpleTaskDescription ["Wähle dein Flugziel auf der Karte aus!", "Zielen", "Zielen"];
_veh lock true;
openMap true;
onMapSingleClick {posi = _pos; openMap false; onMapSingleClick '';};
while {isNil "posi" and alive _veh} do {
    hintSilent "Bitte klicke auf die Map, wohin du fliegen willst.";
    uiSleep(0.1);
};
hintSilent "";
["TaskSucceeded",["","Ziel wählen"]] call BIS_fnc_showNotification;
["TaskAssigned",["","Warte auf deine Ankunft..."]] call BIS_fnc_showNotification;
_currentTask setSimpleTaskDescription ["Warte auf deine Ankunft...", "Warten", "Ziel"];
_currentTask setSimpleTaskDestination (posi);
_veh doMove (posi);
_veh flyInHeight 200;
_flying = true;
while {_flying} do {
if ((posi distance (position _veh)) < 250) then {
	_flying = false;
};
if (!alive _veh) then {
	_flying = false;
};
_eta = round(((_veh distance2D [posi select 0, posi select 1, position _veh select 2])/speed _veh)*3.6);
_seconds = _eta;
if (_seconds < 0) then {
	_seconds = _seconds * -1;
};
if !(_seconds > 1000000) then {
_minutes = 0;
while {_seconds > 59} do {
	_minutes = _minutes + 1;
	_seconds = _seconds - 60;
};

if (_seconds < 0) then {
	_seconds = 0;
};
if (_seconds < 10) then {
	_seconds = format["0%1",_seconds];
};
_eta = format["%1:%2",_minutes,_seconds];
};
hintSilent format["Passagiere: %1\n\nFlughöhe: %2m\nGeschwindigkeit: %3 km/h\nVSpeed: %4 m/s\nETA: %5",count(crew _veh) - 4,round(position _veh select 2),round(speed _veh), round((velocity _veh select 2)),_eta];
uiSleep(0.001);
};
doStop _veh;
["TaskSucceeded",["","Warte auf deine Ankunft..."]] call BIS_fnc_showNotification;
_veh land "LAND";


[{
	if (vehicle player getCargoIndex player != -1) then {
		doGetOut player;
	};
}, "BIS_fnc_Spawn", crew _veh] call BIS_fnc_MP;

while {vehicle player != player and alive _veh} do {
    hintSilent format["Passagiere: %1\n\nFlughöhe: %2m\nGeschwindigkeit: %3 km/h\nVSpeed: %4 m/s\n\nLandeanflug... Bitte anschnallen!",count(crew _veh) - 4,round(position _veh select 2),round(speed _veh), round((velocity _veh select 2))];
    uiSleep(0.001);
};
hintSilent "";
_currentTask setSimpleTaskDescription ["Helikopterflug erfolgreich abgeschlossen. Ziel nahezu erreicht.", "Fertig", "Ziel"];
_currentTask setTaskState "Succeeded";
["TaskSucceeded",["","Querfeldeinflug überstanden"]] call BIS_fnc_showNotification;
_veh engineOn false;
uiSleep(60);
{deleteVehicle _x}forEach crew _veh;
deleteVehicle _veh;
deleteVehicle _light;
player removeSimpleTask _currentTask;