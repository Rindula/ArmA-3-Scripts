	if !("ItemMap" in items player) then {player addweapon "ItemMap";};

	if (isnil "jme_vm") then {jme_vm = 0;}; if (jme_vm == 0) then {jme_vm = 1; hint "JME: Vehicle Markers ON";} else {jme_vm = 0; hint "JME: Vehicle Markers OFF";};
	while {jme_vm == 1} do
	{
		{
			jme_vmarkers = str _x;
			deleteMarkerLocal jme_vmarkers;
			jme_vmarkers = createMarkerLocal [jme_vmarkers, visiblePosition _x];
			jme_vmarkers setMarkerTypeLocal "waypoint";
			jme_vmarkers setMarkerPosLocal visiblePosition _x;
			jme_vmarkers setMarkerSizeLocal [0.5,0.5];
			jme_vmarkers setMarkerTextLocal format['%1',typeOf _x];
			if ((_x isKindOf "Air") || (_x isKindOf "Tank")) then {jme_vmarkers setMarkerColorLocal ("ColorRed");} else {jme_vmarkers setMarkerColorLocal ("ColorBlue");};
		} forEach vehicles;
	uiSleep 1;
	};
	{jme_vmarkers = str _x; deleteMarkerLocal jme_vmarkers;} forEach vehicles;