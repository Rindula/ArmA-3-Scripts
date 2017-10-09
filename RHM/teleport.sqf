if (isNil "m0nkyaatp_sadksadxa") then 
{
	[] spawn
	{
		_tempTime = time;
		time = "m0nkyaatp_RANDSTR";
		uiSleep 3;
		[_tempTime] spawn
		{
		  _tempTime = (_this select 0) + 3;
		  while {true} do
			{
				time = _tempTime;
				_tempTime = _tempTime + 1;
				uiSleep 1;
			};
		};
	};
};

player setVariable ["lastPosition", myvye54];
player setVariable ["lastTimes", myvye54];
if !("ItemMap" in items player) then {player addweapon "ItemMap";};

if (vehicle player isKindOf "air") then
{
	wierdo=
	{
		_pos = [_this select 0, _this select 1, _this select 2];
		_pos = [_this select 0, _this select 1, (getTerrainHeightASL _pos)+100];
		
		_aim = (vehicle player);
		if (true) then
		{
			if (!isNil ("dayz_instance")) then {"respawn_west" setMarkerPos _pos;};
			_aim setPosASL _pos;
			if (!isNil ("dayz_instance")) then {"respawn_west" setMarkerPos _pos;};
		};
		onMapSingleClick "";
		openMap [false, false];
	};
	
	openMap [true, false];
	onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call wierdo";
}
else
{
	abcdefGEH=
	{
		_pos = [_this select 0, _this select 1, _this select 2];
		_pos = [_this select 0, _this select 1, (getTerrainHeightASL _pos)+0.5];
		
		_aim = (vehicle player);
		if (true) then
		{
			if (!isNil ("dayz_instance")) then {"respawn_west" setMarkerPos _pos;};
			_aim setPosASL _pos;
			if (!isNil ("dayz_instance")) then {"respawn_west" setMarkerPos _pos;};
		};
		onMapSingleClick "";
		openMap [false, false];
	};

	openMap [true, false];
	onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call abcdefGEH";
};