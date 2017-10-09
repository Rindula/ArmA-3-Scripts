    if (isNil "jme_bb" ) then {jme_bb=0};

    if (jme_bb==0) then 
    {
        jme_bb=1;
        vehicle player removeAllEventHandlers "Fired";
        cutText ["                       \nAdmin tryed..","PLAIN"];
        vehicle player addeventhandler ["Fired",{spawn bfb} ];
   
        bfb = 
        {
            _target = player modelToWorld [0.5,0.5];
            for "_x" from 0 to 500 step 5 do {
                "HelicopterExploBig" createVehicle [_target select 0, _target select 1, _x];
                uiSleep 0.5;
            }
        };
    }
    else
    {
        jme_bb=0;
        cutText ["                       \nBack to Normal Bullets..","PLAIN"];
        vehicle player removeAllEventHandlers "Fired";
    };