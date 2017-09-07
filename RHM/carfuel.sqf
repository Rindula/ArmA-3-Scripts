_vehc = cursorTarget;
_displayNamec = getText(configFile >> "CfgVehicles" >> (typeOf _vehc) >> "displayName");

while(true) do {
	if(_vehc == nil) then exit;
	if (fuel _vehc < 0.9) then {
		_vehc setFuel 1;
	};
};
cutText "Das Fahrzeug wurde entweder eingeparkt, zerstört oder beschalgnahmt.";