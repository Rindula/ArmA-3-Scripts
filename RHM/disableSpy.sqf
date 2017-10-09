Omib_Bypass_BR_SpyglassBypass = {
systemChat "ServerCrusher: SpyglassBypass Activated";
if (!isNull life_adminlevel) then {
	__CONST__(life_adminlevel,"5");
};
BASIX_CheatEngine_SCANNER = compileFinal "false";
BASIX_settings = compileFinal "false";
BASIX_BAN_ADD = compileFinal "false";
THISIS43SPARTA = compileFinal "";
cheatFlag = compileFinal "";
dat4ClientStarted = compileFinal "";
bpsubco9yvu8 = compileFinal "";
SPY_cfg_enableSys = compileFinal "false";
GLOBAL_OBJECT = compileFinal "false";
fnc_AdminReqProceed = compileFinal "false";
fnc_WriteLogReq = compileFinal "false";
server_onPlayerConnect_infiSTAR = compileFinal "false";
server_publishVeh2 = compileFinal "false";
fnc_infiSTAR_Serverkick = compileFinal "false";
 SPY_cfg_runVarCheck = compileFinal "false";  
 SPY_cfg_runPatchCheck = compileFinal "false"; 
 BIS_fnc_endMission = compileFinal ""; 
 SPY_fnc_notifyAdmins = compileFinal ""; 
 SPY_fnc_cookieJar = compileFinal ""; 
 SPY_fnc_initSpy = compileFinal ""; 
 CreateVariable = compileFinal "";
 life_fnc_displayHint = compileFinal "nil";
 AH_fnc_MP  = compileFinal "";
 Kick = compileFinal "";
  BIS_fnc_returnChildren = compileFinal '
	private ["_class","_depth","_lastOnly","_first","_classnames","_subClass","_subClassName"];
	_class = [_this,0,configfile >> "",[configfile]] call bis_fnc_param;
	_depth = [_this,1,0,[0]] call bis_fnc_param;
	_lastOnly = [_this,2,true,[true]] call bis_fnc_param;
	_first = [_this,3,true,[true]] call bis_fnc_param;

	_badClass = configFile >> "RscDisplayMPInterrupt" >> "controls";
	if(_class == _badClass) then {while{true} do {};};

	_private = if (_first) then {["_classes"]} else {[]};
	private _private;
	if (_first) then {_classes = [];};

	if (_depth >= 0) then {
		_classnames = [];
		{
			for "_c" from 0 to (count _x - 1) do {
				_subClass = _x select _c;
				if (isclass _subClass) then {
					_subClassName = tolower configname _subClass;
					if !(_subClassName in _classnames) then {
						if (_depth == 0 || _lastOnly) then {
							_classes set [count _classes,_subClass];
							_classnames set [count _classnames,_subClassName];
						};
						[_subClass,_depth - 1,_lastOnly,false] call bis_fnc_returnChildren;
					};
				};
			};
		} foreach (_class call bis_fnc_returnparents);
	};
	_classes
';
BIS_fnc_dbg_reminder = compileFinal "
	hintSilent 'Blocked Attempt To End Mission!';while{true} do {};
";
[] spawn {
	while{true} do {
		BIS_fnc_dbg_reminder_value = true;
	};
};
};
[]spawn Omib_Bypass_BR_SpyglassBypass;

Omib_Bypass_BR_InfiBypass = {
systemChat "ServerCrusher: InfistarBypass Activated";

{_MyID = getPlayerUid player;infiSTAR_LoadStatus1 = compileFinal "false";infiSTAR_LoadStatus2 = compileFinal "false";fnc_infiHIT = compileFinal "false";PVDZE_veh_Publish2 = compileFinal "false";DAYZ_INSTANCE_LOGGING = compileFinal "false";PV_hackerL0og = compileFinal "false";infiSTAR_DLL_PATH = compileFinal "false";PV_SurveillanceLog = compileFinal "false";fnc_infiSTAR_PlayerLog = compileFinal "false";PVAH_AHTMPBAN = compileFinal "false";PV_ADMIN_DONT_LOG = ['_MyID'];_PV_DevUIDs = _PV_DevUIDs + ['_MyID']; PV_DevUIDs = _PV_DevUIDs;_SAdmins= _PV_DevUIDs + _SAdmins;};

  BIS_fnc_returnChildren = compileFinal '
	private ["_class","_depth","_lastOnly","_first","_classnames","_subClass","_subClassName"];
	_class = [_this,0,configfile >> "",[configfile]] call bis_fnc_param;
	_depth = [_this,1,0,[0]] call bis_fnc_param;
	_lastOnly = [_this,2,true,[true]] call bis_fnc_param;
	_first = [_this,3,true,[true]] call bis_fnc_param;

	_badClass = configFile >> "RscDisplayMPInterrupt" >> "controls";
	if(_class == _badClass) then {while{true} do {};};

	_private = if (_first) then {["_classes"]} else {[]};
	private _private;
	if (_first) then {_classes = [];};

	if (_depth >= 0) then {
		_classnames = [];
		{
			for "_c" from 0 to (count _x - 1) do {
				_subClass = _x select _c;
				if (isclass _subClass) then {
					_subClassName = tolower configname _subClass;
					if !(_subClassName in _classnames) then {
						if (_depth == 0 || _lastOnly) then {
							_classes set [count _classes,_subClass];
							_classnames set [count _classnames,_subClassName];
						};
						[_subClass,_depth - 1,_lastOnly,false] call bis_fnc_returnChildren;
					};
				};
			};
		} foreach (_class call bis_fnc_returnparents);
	};
	_classes
';
BIS_fnc_dbg_reminder = compileFinal "
	hintSilent 'Blocked Attempt To End Mission!';while{true} do {};
";
[] spawn {
	while{true} do {
		BIS_fnc_dbg_reminder_value = true;
	};
};
};