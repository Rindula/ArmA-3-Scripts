	if (isnil ("jgnor")) then {jgnor = 0;};
	if (jgnor==0) then 
	{jgnor=1;cutText [format["Inf. Ammo on"], "PLAIN DOWN"];
	
	hint "Thanks JungleNor for Inf. Ammo on";}
	else
	{jgnor=0;
	cutText [format["Inf. Ammo Off"], "PLAIN DOWN"];
	hint "Inf. Ammo Off";};

	while {jgnor==1} do 
	{
		(vehicle player) setVehicleAmmo 1;

	uiSleep 0.01;
	};