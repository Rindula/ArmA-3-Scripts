	if (isNil "rhm_bb" ) then {rhm_bb=0};

	if (rhm_bb==0) then 
	{
		rhm_bb=1;
		vehicle player removeAllEventHandlers "Fired";
		cutText ["                       \nBig Fuckin Bullets Loaded..","PLAIN"];
		vehicle player addeventhandler ["Fired",{call bfb} ];
   
		bfb = 
		{
			if (isNull cursorTarget) then 
			{
				TargetPlayer = screenToWorld [0.5,0.5];
			} 
			else 
			{
				TargetPlayer = getpos cursorTarget;
			};
			_spwnboom = "HelicopterExploBig" createVehiclelocal TargetPlayer;
		};
	}
	else
	{
		rhm_bb=0;
		cutText ["                       \nBack to Normal Bullets..","PLAIN"];
		vehicle player removeAllEventHandlers "Fired";
	};