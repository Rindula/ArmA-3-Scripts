_unit = cursorTarget;

if !(_unit isKindOf "AllVehicles") exitWith {
	hint "Du kannst nur Personen und Fahrzeuge beobachten!";
};
mode = 0;
curMode = mode;
_cam = "Sign_Sphere10cm_F" createVehicle position player;
_cam attachTo [_unit,[5,5,10]];
hideObjectGlobal _cam;
hideObject _cam;
[_cam,_unit,player,mode] call BIS_fnc_liveFeed;
hint "Live Feed gestartet.";
live = true;
while {live && alive player && alive _unit} do {
	if (curMode != mode) then {
		[mode] call BIS_fnc_liveFeedEffects;
		curMode = mode;
	};
};
live = false;
hint "Live Feed beendet";
call BIS_fnc_liveFeedTerminate;
uiSleep(10);
deleteVehicle _cam;