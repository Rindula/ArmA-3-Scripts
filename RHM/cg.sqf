	if (isnil "jme_cg" ) then {jme_cg=0};
	if (jme_cg==0) then
	{
		cutText [format["CarGodmode ON"], "PLAIN DOWN"];
		hint format["CarGodmode ON"];
		jme_cg = 1;
		jme_cg_lol = true;
	
		while {jme_cg_lol} do
		{
			if ((vehicle player isKindOf "LandVehicle") || (vehicle player isKindOf "Air") || (vehicle player isKindOf "Ship")) then 
			{
				if ((fuel (vehicle player)) < 0.9) then {vehicle player setFuel 1;};
				if ((damage (vehicle player)) != 0) then {vehicle player setdammage 0;};
			};
		uiSleep 0.01;
		};
	}
	else
	{
		cutText [format["CarGodmode OFF"], "PLAIN DOWN"];
		hint format["CarGodmode OFF"];
		jme_cg_lol = false;
		jme_cg = 0;
	};
	
	hint "Thanks JungleNor for Car God"