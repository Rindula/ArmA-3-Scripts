/*
File: rhm\track.sqf
Author: Rindula
Description: Makiert das Fahrzeug oder den Spieler auf der Map.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if(!(_unit isKindOf "AllVehicles")) exitWith {titleText ["Du kannst den GPS Tracker hier nicht benutzen.","PLAIN"]};
titleText["Du hast einen GPS Tracker angebracht.","PLAIN"];
[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_gpstracker_arrow",_veh];
	tracker set[count tracker,_markerName];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "mil_arrow";
	_marker setMarkerPosLocal getPos _veh;
	_markerName2 = format["%1_gpstracker_sphere",_veh];
	tracker set[count tracker,_markerName2];
	_marker2 = createMarkerLocal [_markerName2, visiblePosition _veh];
	_marker2 setMarkerColorLocal "ColorBlack";
	_marker2 setMarkerTypeLocal "Select";
	_marker2 setMarkerPosLocal getPos _veh;
	while {true} do {
	if(not alive _veh) exitWith {};
	if (_veh isKindOf "Man") then {
		if (vehicle _veh == _veh) then {
			_marker2 setMarkerTextLocal "<||GPS Tracker||> "+name _veh;
		} else {
			_marker2 setMarkerTextLocal "<||GPS Tracker||> "+name _veh+" ["+getText(configfile >> "CfgVehicles" >> typeOf vehicle _veh >> "displayName")+"]";
		}
	}else{
		_marker2 setMarkerTextLocal "<||GPS Tracker||> "+getText(configfile >> "CfgVehicles" >> typeOf _veh >> "displayName");
	};
	

	
	_marker setMarkerPosLocal getPos _veh;
	_marker setMarkerDirLocal (direction _veh);
	_marker2 setMarkerPosLocal getPos _veh;
	_marker2 setMarkerDirLocal (direction _veh);
	uiSleep 0.01;
};
for "_a" from 1 to 0 step -0.02 do {
	_marker setMarkerAlphaLocal _a;
	sleep(0.1);
};
deleteMarkerLocal _markerName;
if (_veh isKindOf "Man") then {
	_marker2 setMarkerTextLocal name _veh+" #KIA";
}else{
	_marker2 setMarkerTextLocal getText(configfile >> "CfgVehicles" >> typeOf _veh >> "displayName")+" #KIA";
};
_marker2 setMarkerDirLocal 0;
_marker2 setMarkerTypeLocal "KIA";
for "_b" from 1 to 0 step -0.01 do {
	_marker2 setMarkerAlphaLocal _b;
	uiSleep(0.6);
};
deleteMarkerLocal _markerName2;
};
