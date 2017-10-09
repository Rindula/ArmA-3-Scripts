		if (isNil "Jgnor_is_here") then
		{
			Jgnor_is_here = 0;
		};

		if (Jgnor_is_here == 0) then
		{
			Jgnor_is_here = 1;
			hint "Thanks JungleNor for GODMODE";
			cutText [format["GOD ON"], "PLAIN"];
		
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious  = {};
			player removeAllEventHandlers "handleDamage";
			player addEventHandler ["handleDamage", {false}];
			player allowDamage false;
		}
		else
		{
			Jgnor_is_here = 0;
			hint "GOD OFF";
			cutText [format["GOD OFF"], "PLAIN"];
		
			player addEventHandler ["handleDamage", {true}];
			player removeAllEventHandlers "handleDamage";
			player allowDamage true;
		};