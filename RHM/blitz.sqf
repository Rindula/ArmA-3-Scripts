	_logic = player;
	_light = objNull;
	_pos = if (isNull cursorTarget) then {screenToWorld [0.5,0.5]}else{getPos cursorTarget};
	_dir = _logic getvariable ["dir",random 360];
	//--- Play sound (tied to the explosion effect)
	_bolt = createvehicle ["LightningBolt",_pos,[],0,"can collide"];
	_bolt setposatl _pos;
	_bolt setdamage 1;

	_light = "#lightpoint" createvehicle _pos;
	_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
	_light setLightDayLight true;
	_light setLightAmbient [0.05, 0.05, 0.1];
	_light setlightcolor [1, 1, 2];

	uiSleep 0.1;
	_light setLightBrightness 0;
	uiSleep (random 0.1);

	_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
	_lightning = _class createvehicle [100,100,100];
	_lightning setdir _dir;
	_lightning setpos _pos;

	_cursorTarget = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];
	_duration = if (isnull _cursorTarget) then {(3 + random 1)} else {1};

	for "_i" from 0 to _duration do {
		_time = time + 0.1;
		_light setLightBrightness (100 + random 100);
		waituntil {
			time > _time
		};
	};

	deletevehicle _lightning;
	deletevehicle _light;

	//--- Disable engine lightnings
	0 setlightnings 0;
