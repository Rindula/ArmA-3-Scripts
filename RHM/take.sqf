private ["_veh"];
_veh = cursorTarget;
if (_veh isKindOf "Man") then {
	player remoteControl _veh; _veh switchCamera "Internal";
	_veh disableUserInput true;
	uiSleep 1;
	_veh remoteControl _veh; _veh switchCamera "Internal";
} else {
	_vehinf = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	systemChat format["Du kannst kein Fahrzeug (%1) steuern!",_vehinf];
	hintC format["Du kannst das Fahrzeug %1 nicht steuern!",_vehinf];
};