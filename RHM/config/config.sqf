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



loaded = true;