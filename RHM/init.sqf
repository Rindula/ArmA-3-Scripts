if (!isNil "running") exitWith {
    player commandChat "Script läuft bereits!";
};
// infiSTAR_IS_RUN_ON_THIS_SERVER = 0;
// execVM "rhm\disableSpy.sqf";
running = true;
if (!isnil "keyp") then
{
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", keyp];
};

loaded = false;


systemChat "[RHM] Lädt";

/////////////////////////////////////////////////////////
//     Initialisierungstext beim Start (Blackscreen mit Text)
//     Standardtext:
//      Menu by Rindula\n\nControls:\nDel = Scroll Actions\nF8 = Multiactions\nF11 = Speed\n< = Insta Stop eines Fahrzeugs\nÖ = Fahrzeug besitzer herrausfinden (Altis Life)
/////////////////////////////////////////////////////////
initText = "Menu by Rindula\n\nControls:\nDel = Scroll Actions\nF8 = Multiactions\nF11 = Speed\n< = Insta Stop eines Fahrzeugs\nÖ = Fahrzeug besitzer herrausfinden (Altis Life)";
showintro = false; // Default: true --- Den Text oben (initText) beim starten zeigen

/////////////////////////////////////////////////////////
// Sicherheitsoptionen an- (true) oder aus- (false) schalten
/////////////////////////////////////////////////////////
secure = true; // Default: true



//Menü auswahl zum aktivieren oder deaktivieren
adminmenu = true;
moneymenu = true;
teleportmenu = true;
livefeedmenu = true;



////////////////////////////////////////////////////////////////////////////
/*Alles was hier drunter steht NICHT abändern!!!                          //
Falls hier was geändert wird, komme ich nicht für eventuelle Schäden auf! //
                                                                          //
- Rindula*/                                                               //
////////////////////////////////////////////////////////////////////////////
keyp = nil;
anewsb = nil;
emitter = [];
spec = [];
emitterrun = false;
live = false;
tracker = [];
vList = [];
vListC = [];
mark = [];
markers = [];
deaded = [];
antirope = [];
men = false;
tp = false;
emergencyac = false;
ac1 = false;
ac2 = false;
ac3 = false;
ac4 = false;
enterm = false;
timesm = false;
money = false;
moneyAL = false;
moneyWL = false;
esp = false;
collapse = false;
vehloading = false;
fclose = false;
rhm_doorOpen = false;



player addAction ["FASTCLOSE",{preprocessFile "rhm\fastclose.sqf";},[],100000000,false,true,"","fclose"];

version = "1.3.4.7";

anewsb =
{
    displayaanhack_ = uinamespace getvariable 'BIS_AAN';
    displayaanhack_ closeDisplay 0;
    displayaanhack_ = nil;
};

[] spawn {
    while {true} do {
        waituntil {!("B_UavTerminal" in assignedItems player) && !("O_UavTerminal" in assignedItems player) && !("I_UavTerminal" in assignedItems player) && !("ItemGPS" in assignedItems player)};
        player addWeapon (["B_UavTerminal","O_UavTerminal","I_UavTerminal","ItemGPS"] select ([west,east,resistance,civilian] find (side player)));
    };
};
[] spawn {
    while {true} do {
        waituntil {!("Laserdesignator" in assignedItems player)};
        player addWeapon "Laserdesignator";
    };
};
[] spawn {
    while {true} do {
        waituntil {!("Laserbatteries" in magazines player)};
        player addItem "Laserbatteries";
        sleep (1);
    };
};
[] spawn {
    while {true} do {
        waituntil {!("ItemMap" in assignedItems player)};
        player addWeapon "ItemMap";
    };
};
[] spawn {
    while {true} do {
        {
            _x getVariable ["marker_rhm",false];
        } forEach playableUnits;
		sleep (1);
    };
};

[] spawn {
    while {true} do {
        _googles   = goggles player;
        _uniform   = uniform player;
        _vest      = vest player;
        _items     = items player;
        _magazines = magazines player;
        waitUntil {((getPosASL player select 2) < (getPosATL player select 2)) && !(typeOf (vehicle player) isKindOf "Ship") && (vehicle player == player)};
        removeGoggles player;
        removeUniform player;
        removeVest player;
        player addGoggles "G_B_Diving";
        player addUniform "U_B_survival_uniform";
        player addVest "V_RebreatherB";
        waitUntil {((getPosAsL player select 2) > 0) || (vehicle player != player)};
        removeGoggles player;
        removeUniform player;
        removeVest player;
        player addGoggles _googles;
        player addUniform _uniform;
        player addVest _vest;
        waitUntil {(goggles player == _googles) && (uniform player == _uniform) && (vest player == _vest)};
        removeAllItems player;
        {
            player removeMagazine _x;
        } forEach magazines player;
        {
            player addItem _x;
        } foreach _items;
        {
            player addMagazine _x;
        } foreach _magazines;
    };
};

                RHM_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            spec set [count spec,player addAction[format["%1 || %2", _x, name _x], {
                                _player = (_this select 3); {
                                    _x = player;
                                    first = _x;
                                    _x = _player;
                                    second = _x;
                                    secondowner = owner _x;
                                }
                                foreach playableunits;
                                (vehicle second) switchcamera "EXTERNAL";
                                hint "Press F1 to switch back \n by Rindula";
                            }, _x]];
                        };
                    }
                    forEach(playableUnits);
                };

                RHM_MapMarkerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            mark set [count mark, player addAction[format["<t color='#00A8B8'>%1 || %2</t>", _x, name _x], {
                                _x setVariable ["marker_rhm",true,true];
                                (_x) spawn RHM_MapMarker;
                            }, [],50],false,false,"","(_x getVariable 'marker_rhm') == false"];
                            mark set [count mark, player addAction[format["<t color='#FE562C'>%1 || %2</t>", _x, name _x], {
                                player setVariable [format["%1_marker_rhm"],false,true];
                            }, [],50],false,false,"","(_x getVariable 'marker_rhm') == true"];
                        };
                    }
                    forEach(allUnits);
                };

                RHM_MapMarker = {
                    _unit = _this;
                    _name = name _unit;
					systemChat str(_this);
                    _active = player getVariable format["%1_marker_rhm",_unit];
                    _marker = createMarkerLocal [format["%1_themarker_rhm",_unit],visiblePosition _unit];
                    _marker setMarkerColorLocal "ColorBlack";
                    _marker setMarkerTypeLocal "mil_dot";
                    _marker setMarkerTextLocal format["%1",_name];
                    while {_active && alive _unit && (_unit in playableUnits)} do {
                        _marker setPos position _unit;
                    };
                    deleteMarker _marker;
                };

[] spawn {
    while {true} do {
		_veh = vehicle player;
        if ((typeOf _veh) == "B_Heli_Transport_01_F") then {
			if (((position _veh select 2) < 5) && ((speed _veh) < 30)) then {
				_veh animateDoor ["door_r",1,false];
				_veh animateDoor ["door_l",1,false];
				waitUntil {(_veh animationPhase "door_r") == 1};
				rhm_doorOpen = true;
			} else {
				_veh animateDoor ["door_r",0,false];
				_veh animateDoor ["door_l",0,false];
				waitUntil {(_veh animationPhase "door_r") == 0};
				rhm_doorOpen = false;
			};
		};
    };
};





    RHM_day = {
        RHM_dday = "if(isServer) then {while {true} do {setDate [2012, 9, 1, 13, 0];sleep 30;};};";
        [RHM_dday] call RHM_ladida;
        ["TaskSucceeded", ["", "Zeit : Tag ( Bitte warten )"]] call bis_fnc_showNotification;
    };


    RHM_night = {
        RHM_nighd = "if(isServer) then {while {true} do {setDate [2012, 9, 1, 23, 0];sleep 30;};};";
        [RHM_nighd] call RHM_ladida;
        ["TaskSucceeded", ["", "Zeit : Nacht ( Bitte warten )"]] call bis_fnc_showNotification;
    };

{
	if (((_x isKindOf "Car") || (_x isKindOf "Plane") || (_x isKindOf "Ship") || (_x isKindOf "Helicopter") || (_x isKindOf "Tank")) && !(str(_x) in deaded)) then {
		deaded set [count deaded, str(_x)];
	};
} foreach allDead;








RHM_typeText = {
/*
	Author: Rindula

	Description:
	Types a structured text on the screen, letter by letter, cursor blinking.

	Parameter(s):
	_this: array containing blocks of text with same structured text formatting

	Remarks:
	* Every text block is an array of text and formatting tag.
	* Blocks don't have to span over whole line.

	Example:

[
	[
		[format["Willkommen auf %1, %2",worldName, name player],"<t align = 'center' size = '0.7'>%1</t><br/>"],
		[format["Aktuelle Version: %1", version],"<t align = 'center' size = '0.7'>%1</t><br/>"]
	]
] spawn RHM_typeText;
*/

#define DELAY_CHARACTER	0.01;
#define DELAY_CURSOR	0.05;

private["_data","_posX","_posY","_rootFormat","_toDisplay"];
private["_blocks","_block","_blockCount","_blockNr","_blockArray","_blockText","_blockTextF","_blockTextF_","_blockFormat","_formats","_inputData","_processedTextF","_char","_cursorInvis","_blinkCounts","_blinkCount"];

_data 				= [_this, 0, [], [[]]] call BIS_fnc_param;
_speed              = [_this, 1, 0.05, [123]] call BIS_fnc_param;
_posX 				= 0;
_posY 				= 0;
_rootFormat 		= format["<t >%1</t>", _data];

_blockCount = count _data;

_invisCursor = "<t color ='#00000000' shadow = '0'>_</t>";

//process the input data
_blocks 	= [];
_formats 	= [];
_blinkCounts 	= [];

{
	_inputData = _x;

	_block 		= [_inputData, 0, "", [""]] call BIS_fnc_param;
	_format 	= [_inputData, 1, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>", [""]] call BIS_fnc_param;
	_blinkCount 	= [_inputData, 2, 5, [123]] call BIS_fnc_param;

	//convert strings into array of chars
	_blockArray = toArray _block;
	{_blockArray set [_forEachIndex, toString [_x]]} forEach _blockArray;

	_blocks  = _blocks + [_blockArray];
	_formats = _formats + [_format];
	_blinkCounts = _blinkCounts + [_blinkCount];
}
forEach _data;

//do the printing
_processedTextF  = "";

{
	_blockArray  = _x;
	_blockNr     = _forEachIndex;
	_blockFormat = _formats select _blockNr;
	_blockText   = "";
	_blockTextF  = "";
	_blockTextF_ = "";

	{
		_char = _x;

		_blockText = _blockText + _char;

		_blockTextF  = format[_blockFormat, _blockText + _invisCursor];
		_blockTextF_ = format[_blockFormat, _blockText + "_"];

		//print the output
		_toDisplay = format[_rootFormat,_processedTextF + _blockTextF_];
		[_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;

		playSound "ReadoutClick";

		sleep DELAY_CHARACTER;
		_toDisplay = format[_rootFormat,_processedTextF + _blockTextF];
		[_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
		sleep DELAY_CURSOR;
	}
	forEach _blockArray;

	_blinkCount = _blinkCounts select _forEachIndex;

	if (_blinkCount > 0) then
	{
		for "_i" from 1 to _blinkCount do
		{
			_toDisplay = format[_rootFormat,_processedTextF + _blockTextF_];
			[_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep DELAY_CHARACTER;
			_toDisplay = format[_rootFormat,_processedTextF + _blockTextF];
			[_toDisplay, _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep DELAY_CURSOR;
		};
	};

	//store finished block
	_processedTextF  = _processedTextF + _blockTextF;
}
forEach _blocks;
};


keybinds = nil;
keybinds =
{
	switch (_this) do 
	{
		case 38:
		{
			execVM format['rhm\blitzer.sqf'];
		};
		case 39:
		{
			execVM format['rhm\getowner.sqf'];
		};
		case 54:
		{
			// execVM format['rhm\wlist.sqf'];
		};
		case 59:
		{
			player switchCamera "INTERNAL";
		};	
		/* case 60:
		{
			execVM format['rhm\aero_v10k.sqf'];
		};	
		case 61:
		{
			execVM format['rhm\aero_v100k.sqf'];
		};	
		case 62:
		{
			execVM format['rhm\aero_v500k.sqf'];
		};
		case 63:
		{
			execVM format['rhm\aero_v1m.sqf'];
		}; */
		case 66:
		{
			execVM format['rhm\test.sqf'];
		};
		case 68:
		{
			fclose = !fclose;
		};
		/* case 71:
		{
			execVM format['rhm\tp.sqf'];
		};
		case (72):
		{
			execVM format['rhm\mess.sqf'];
		};
		case (73):
		{
			execVM format['rhm\track.sqf'];
		};
		case (75):
		{
			[[position player select 0,(position player select 1) + 1000,20],[position player select 0,(position player select 1) -2000,20],10,"FULL"] execVM format['rhm\flyby.sqf'];
		};
		case (76):
		{
			execVM format['rhm\move.sqs'];
		};
		case (77):
		{
			openMap true;
			onMapSingleClick{
				hint "Erstelle Heli";
				[position player,_pos,50,"FULL","C_Heli_Light_01_civil_F","CIV"] execVM format['rhm\flybyin.sqf'];
				openMap false;
				onMapSingleClick {nil};
			};
		};
		case (80):
		{
			execVM "rhm\arsenal.sqf"
		};
		case (81):
		{
			execVM "rhm\mark.sqf"
		}; */
		case 86:
		{
			if (vehicle player != player) then {
				vehicle player setVelocity [0,0,((velocity (vehicle player) select 2) /2)+1];
			};
		};
		case 87:
		{
			if (local vehicle player) then {
				execVM "rhm\release.sqf";
			} else {
				[[[],"rhm\release.sqf"],"BIS_fnc_execVM",driver vehicle player] call BIS_fnc_MP;
			};
		};
		case 207:
		{
			// execVM format['rhm\wantedadd.sqf'];
		};
		case 210:
		{
			// execVM format['rhm\carfuel.sqf'];
		};
		case 211:
		{
			execVM format['rhm\console.sqf'];
		};
	};
};

rhm_rundistance   = 0;
rhm_drivedistance = 0;
rhm_flydistance   = 0;

while {true} do
{
    rhm_weg1 = false;
    rhm_weg2 = false;
    if (isNil "rhm_Wegmarker11") then
    {
        rhm_Wegmarker11 = createMarkerLocal ["rhm_Wegmarker1",getPos player];
        rhm_weg2 = true;
    }
    else
    {
        rhm_Wegmarker12 = createMarkerLocal ["rhm_Wegmarker2",getPos player];
        rhm_weg1 = true;
    };
    if (!isNil "rhm_Wegmarker11" && !isNil "rhm_Wegmarker12") then
    {
        if (((vehicle player) isKindOf "Car") && (vehicle player) != player) then
        {
            _meter = round(getMarkerPos "rhm_Wegmarker1" distance getMarkerPos"rhm_Wegmarker2");
            rhm_drivedistance = rhm_drivedistance + _meter;
        };
            
        if (((vehicle player) isKindOf "Air") && (vehicle player) != player) then
        {
            _meter = round(getMarkerPos "rhm_Wegmarker1" distance getMarkerPos"rhm_Wegmarker2");
            rhm_flydistance = rhm_flydistance + _meter;
        };
            
        if !((vehicle player) != player) then
        {
            _meter = round(getMarkerPos "rhm_Wegmarker1" distance getMarkerPos"rhm_Wegmarker2");
            rhm_rundistance = rhm_rundistance + _meter;
        };
    };
    if (rhm_weg1 && !isNil "rhm_Wegmarker11") then {deleteMarkerLocal "rhm_Wegmarker1";rhm_Wegmarker11 = nil;};
    
    if (rhm_weg2 && !isNil "rhm_Wegmarker12") then {deleteMarkerLocal "rhm_Wegmarker2";rhm_Wegmarker12 = nil;};
    
    uiSleep 0.5;
};

// execVM "rhm\groupicons.sqf";
// execVM "rhm\mapmarker.sqf";
// waituntil {!isnull (finddisplay 46)};
keyp = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this select 1 call keybinds; false;"];
rhm_c7n = radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "Channel 7 News", "Channel 7 News", allUnits, false];
// player addEventHandler ["killed",{if ((player != _this select 1) || (vehicle player != _this select 1) || (_this select 1 != objNull)) then {_message="Du wurdest umgebracht, weil du jemanden getötest hast, der noch gebraucht wurde!"; [_message,"hint",(_this select 1),false,true] call BIS_fnc_MP; (_this select 1) call BIS_fnc_neutralizeUnit;}}];
systemChat "[RHM] Geladen";
player customChat [rhm_c7n, format["Willkommen bei Channel 7 News. Heutige Nachrichtenthemen: Einwanderung von Hackern auf %1", worldName]];
uiSleep(0.5);
if (showintro) then {
titleText [initText,"BLACK",5];
5 fadeSound 0;
uiSleep(7.5);
titleText [initText,"BLACK IN",5];
5 fadeSound 1;
} else {
    systemChat "[RHM] Viel spaß.";
};

// [format["[RHM] Aktuelle Version: %1",version]] call BIS_fnc_textTiles;
// [parseText format["<t color = '#00CCf0'>[RHM]</t> <t color = '#CCCC00'>Aktuelle Version:</t> <t align = 'center' color = '#C00000'> %1</t>",version], [0.25, 1, 0.5, 0.05], [1, 1], 10] spawn 	BIS_fnc_textTiles;
running = true;

_intro = [
	[
	["Rindulas Hack Menü geladen","<t align = 'center' size = '0.7'>%1</t><br/>"]
	],1
] spawn RHM_typeText;
player createDiarySubject ["RHM","Rindula's Menu"];
player createDiaryRecord ["RHM", ["DP Finder", "Klicke auf einen DP Punkt um ihn dir anzeigen zu lassen:<br /><br /><marker name='dp_1'>DP 1</marker><br /><marker name='dp_2'>DP 2</marker><br /><marker name='dp_3'>DP 3</marker><br /><marker name='dp_4'>DP 4</marker><br /><marker name='dp_5'>DP 5</marker><br /><marker name='dp_6'>DP 6</marker><br /><marker name='dp_7'>DP 7</marker><br /><marker name='dp_8'>DP 8</marker><br /><marker name='dp_9'>DP 9</marker><br /><marker name='dp_10'>DP 10</marker><br /><marker name='dp_11'>DP 11</marker><br /><marker name='dp_12'>DP 12</marker><br /><marker name='dp_13'>DP 13</marker><br /><marker name='dp_14'>DP 14</marker><br /><marker name='dp_15'>DP 15</marker><br /><marker name='dp_16'>DP 16</marker><br /><marker name='dp_17'>DP 17</marker><br /><marker name='dp_18'>DP 18</marker><br /><marker name='dp_19'>DP 19</marker><br /><marker name='dp_20'>DP 20</marker><br /><marker name='dp_21'>DP 21</marker><br /><marker name='dp_22'>DP 22</marker><br /><marker name='dp_23'>DP 23</marker><br /><marker name='dp_24'>DP 24</marker><br /><marker name='dp_25'>DP 25</marker>"]];
player createDiaryRecord ["RHM", ["--- Infos ---", "Rindula's Hack und Admin Menu - Jetzt auch auf der Map..."]];

	execVM "rhm\vehiclemarkers.sqf";
	// execVM "rhm\wlist.sqf";

        _googles   = goggles player;
        _uniform   = uniform player;
        _vest      = vest player;
        _backpack  = backpack player;
        _items     = items player;
        _magazines = magazines player;
        if !(profileNamespace getVariable ["rhm_InventoryLoadout", false]) then {
			profileNamespace setVariable ["rhm_InventoryLoadout",[_googles,_uniform,_vest,_backpack,_items,_magazines]];
		} else {
			_loadout 	= profileNamespace getVariable "rhm_InventoryLoadout";
			_googles 	= _loadout select 0;
			_uniform 	= _loadout select 1;
			_vest 		= _loadout select 2;
			_backpack 	= _loadout select 3;
			_items 		= _loadout select 4;
			_magazines 	= _loadout select 5;
		};

		waitUntil {scriptDone _intro};
_mins = date select 4;
_hours = date select 3;
if (_mins < 0) then {
	_mins = _mins * -1;
};

if (_mins < 0) then {
	_mins = 0;
};
if (_mins < 10) then {
	_mins = format["0%1",_mins];
};
if (_hours < 10) then {
	_hours = format["0%1",_hours];
};
_times = format["%1:%2",_hours,_mins];
if ((date select 1 == 7) && (date select 2 == 13)) then {
	intro = [
		[
			[format["Willkommen auf %1, %2",worldName, name player],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["Aktuelle Version: %1", version],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			["Zeit: " + _times + " Uhr","<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["Datum: %1.%2.%3", date select 2, date select 1, date select 0],"<t align = 'center' size = '0.7' color='#00ff00'>%1</t><br/>"],
			[format["Heute ist Rindulas Geburtstag (zumindest laut inGame datum)"],"<t align = 'center' size = '0.7' color='#ffff00'>%1</t><br/>"]
		]
	] spawn RHM_typeText;
} else {
	intro = [
		[
			[format["Willkommen auf %1, %2",worldName, name player],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["Aktuelle Version: %1", version],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			["Zeit: " + _times + " Uhr","<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["Datum: %1.%2.%3", date select 2, date select 1, date select 0],"<t align = 'center' size = '0.7' color='#ffffff'>%1</t><br/>"]
		]
	] spawn RHM_typeText;
};
waitUntil {scriptDone intro};
sleep 2;

_script = [
		[
			[format["Spieleranzahl pro Team"],"<t align = 'center' size = '0.7' underline='true'>%1</t><br/>"],
			[format["BLUFOR: %1",{side _x == west} count playableUnits],"<t align = 'center' size = '0.7' color='#0000ff'>%1</t><br/>"],
			[format["OPFOR: %1",{side _x == east} count playableUnits],"<t align = 'center' size = '0.7' color='#ff0000'>%1</t><br/>"],
			[format["Indipendent: %1",{side _x == resistance} count playableUnits],"<t align = 'center' size = '0.7' color='#00aa00'>%1</t><br/>"],
			[format["Zivilisten: %1",{side _x == civilian} count playableUnits],"<t align = 'center' size = '0.7' color='#aa00ff'>%1</t><br/>"]
		]
	] spawn RHM_typeText;
waitUntil {scriptDone _script};
sleep 2;

["Preload"] call BIS_fnc_arsenal;

[
		[
			[format["Steuerung:"],"<t align = 'center' size = '0.7' underline='true'>%1</t><br/>"],
			[format["ENTF: Scroll Menü öffnen"],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["F11: Fahrzeug beschleunigen"],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["&lt; (links neben Y): Instant Stop (Kann zum langamen fliegen nach oben genutzt werden)"],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["F1: Notfall Kamera wechsel zur Internen sicht"],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["F10: Fastclose Funktion"],"<t align = 'center' size = '0.7'>%1</t><br/>"],
			[format["Ö: Altis Life, Fahrzeug Besitzer anzeigen lassen"],"<t align = 'center' size = '0.7'>%1</t><br/>"]
		]
	] spawn RHM_typeText;