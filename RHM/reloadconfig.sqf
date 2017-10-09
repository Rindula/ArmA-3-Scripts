execVM "rhm\config\keyconfig.sqf";
execVM "rhm\config\config.sqf";
execVM "rhm\esp.sqf";
for "_i" from 1 to 5 do {
	titleText ["Config neugeladen","PLAIN DOWN",5];
	uiSleep 0.5;
};
titleText ["","PLAIN DOWN"];