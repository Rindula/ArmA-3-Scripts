	closeDialog 0;
	player setVariable ["lastPosition", myvtr65];
	player setVariable ["lastTimes", myvtr65];
	if !("ItemMap" in items player) then {player addweapon "ItemMap";};

	jgnr_plane=
	{
		"respawn_west" setMarkerPos position player;
		_pos = getPos Player;
		_pos = [_pos select 0, _pos select 1, -100];
	
		_aim = (vehicle player);
		if (true) then
		{
			_aim setPosASL _pos;
		};

		_pos = [_this select 0, _this select 1, _this select 2];
		_pos = [_this select 0, _this select 1, (getTerrainHeightASL _pos)-0.5];
	
		if (true) then
		{
			_aim setPosASL _pos;
		};
		onMapSingleClick "";
		openMap [false, false];
	};

	openMap [true, false];
	onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call jgnr_plane";