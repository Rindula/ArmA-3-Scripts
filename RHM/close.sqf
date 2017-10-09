{_x hintC "So sehr geehrter Herr Köpcke... wenn Sie Krieg wollen kein Problem! Wir sind bereit! Fuck you... Inkommpetentes stückt Scheiße";} forEach allUnits;
	/*private ["_mode","_duration","_sound"];
	_mode 	  = [_this,0,0,[0]] call BIS_fnc_param;
	_duration = [_this,1,1.5,[0]] call BIS_fnc_param;
	_sound    = [_this,2,true,[true]] call BIS_fnc_param;

	BIS_fnc_cinemaBorder_lockview 	= [_this,3,false,[false]] call BIS_fnc_param;		//unfortunately it must be global variable because it is used in eventhandler
BIS_fnc_cinemaBorder_shown 	= [true,false] select _mode;

[_mode,_duration,_sound] spawn
{
	disableSerialization;

	private ["_mode","_duration","_sound"];

	_mode 	  = _this select 0;
	_duration = _this select 1;
	_sound    = _this select 2;

	waitUntil { !isNull ( [] call BIS_fnc_DisplayMission ) };

	("BIS_fnc_cinemaBorder" call BIS_fnc_rscLayer) cutRsc ["RscCinemaBorder", "PLAIN"];

	private "_DisableGameElements";
	_DisableGameElements =
	{
		private ["_handler", "_displaynumber"];
		_displaynumber = [] call BIS_fnc_DisplayMission;

		// Remove eventhandler if it exists (only happens when restarting)
		if (!(isNil {uiNamespace getVariable "BIS_fnc_cinemaBorder_keyHandler"})) then {
			_displaynumber displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_cinemaBorder_keyHandler"];
			uiNamespace setVariable ["BIS_fnc_cinemaBorder_keyHandler", nil];
		};

		//if action is found in the _actions array or SHIFT/ALT/CTRL was pressed then ignore it (bypass it)
		_handler = _displaynumber displayAddEventHandler
		[
			"KeyDown",
			"
				private ['_actions', '_nrofactions', '_returnvalue', '_actionKeys', '_shift', '_alt', '_ctrl' ];
				_shift = _this select 2;
    				_ctrl = _this select 3;
    				_alt = _this select 4;
				_returnvalue = _false;
				_actions = [ 'showmap', 'TimeDec', 'TimeInc', 'Gear', 'Throw', 'Fire', 'ReloadMagazine', 'SwitchWeapon', 'Diary', 'MoveLeft', 'MoveRight', 'ZoomInToggle', 'ZoomOutToggle', 'ZoomIn', 'ZoomOut', 'BuldZoomIn', 'TurnLeft', 'TurnRight' ];

				if( BIS_fnc_cinemaBorder_lockview ) then
				{
					_actions = _actions + ['PersonView'];
				};

				_actionKeys = [];
				{
					_actionkeys = _actionkeys + actionKeys _x;
				} forEach _actions;

				if( (_this select 1) in _actionKeys || (_shift || _ctrl || _alt) ) then { _returnvalue = true };
				_returnvalue
			"
		];

		uiNamespace setVariable ["BIS_fnc_cinemaBorder_keyHandler", _handler];

		private "_m";
		(findDisplay 129) closeDisplay 2;	//close tasks if opened
		(findDisplay 602) closeDisplay 2;	//close inventory if opened
		_m = openmap [false, false];		//close map if opened
	};

	private "_EnableGameElements";
	_EnableGameElements =
	{
		private [ "_displaynumber" ];
		_displaynumber = [] call BIS_fnc_DisplayMission;
		if (!(isNil {uiNamespace getVariable "BIS_fnc_cinemaBorder_keyHandler"})) then
		{
			_displaynumber displayRemoveEventHandler [ "keydown", uiNamespace getVariable "BIS_fnc_cinemaBorder_keyHandler" ];
			uiNamespace setVariable ["BIS_fnc_cinemaBorder_keyHandler", nil];
		};
	};

	private ["_borderDialog", "_borderTop", "_borderBottom", "_height"];
	_borderDialog = uiNamespace getVariable "RscCinemaBorder";
	_borderTop = _borderDialog displayCtrl 100001;
	_borderBottom = _borderDialog displayCtrl 100002;
	_height = 0.625 * safeZoneH;
	_offset = 0.01;

	switch (_mode) do {
		// In
		case 0: {
			"BIS_fnc_cinemaBorder_disabledSave" call BIS_fnc_disableSaving;
			call _DisableGameElements;
			//if wanted - switch player into the 1st person
			if( BIS_fnc_cinemaBorder_lockview ) then
			{
				player switchCamera "INTERNAL";
			};
			setAccTime 0.001;

			showHUD false;

			if (_sound) then {
				if (isClass (configFile >> "CfgSounds" >> "border_in")) then {
					playSound "border_in";
				};
			};

			_borderTop ctrlSetPosition [safeZoneX - _offset, safeZoneY - _height - _offset, safeZoneW + 6 * _offset, _height + _offset];
			_borderTop ctrlCommit 0;
			_borderTop ctrlSetPosition [safeZoneX - _offset, safeZoneY - _offset,safeZoneW + 6 * _offset, _height + _offset];
			_borderTop ctrlCommit _duration;

			_borderBottom ctrlSetPosition [safeZoneX - _offset, safeZoneY + safeZoneH, safeZoneW + 6 * _offset, _height + _offset];
			_borderBottom ctrlCommit 0;
			_borderBottom ctrlSetPosition [safeZoneX - _offset, safeZoneY + safeZoneH - _height, safeZoneW + 6 * _offset, _height + _offset];
			_borderBottom ctrlCommit _duration;

			uiSleep _duration;

			showCinemaBorder true;
		};

		// Out
		case 1: {
			call _EnableGameElements;
			if (_sound) then {
				if (isClass (configFile >> "CfgSounds" >> "border_out")) then {
					playSound "border_out";
				};
			};

			showCinemaBorder true;

			_borderTop ctrlSetPosition [safeZoneX - _offset, safeZoneY - _offset, safeZoneW + 1 * _offset, _height + _offset];
			_borderTop ctrlCommit 0;
			_borderTop ctrlSetPosition [safeZoneX - _offset, safeZoneY - _height - _offset, safeZoneW + 1 * _offset, _height + _offset];
			_borderTop ctrlCommit _duration;

			_borderBottom ctrlSetPosition [safeZoneX - _offset, safeZoneY + safeZoneH - _height, safeZoneW + 1 * _offset, _height + _offset];
			_borderBottom ctrlCommit 0;
			_borderBottom ctrlSetPosition [safeZoneX - _offset, safeZoneY + safeZoneH, safeZoneW + 1 * _offset, _height + _offset];
			_borderBottom ctrlCommit _duration;

			uiSleep _duration;

			("BIS_fnc_cinemaBorder" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

			"BIS_fnc_cinemaBorder_disabledSave" call BIS_fnc_enableSaving;
			showHUD false;
		};
	};
};*/;