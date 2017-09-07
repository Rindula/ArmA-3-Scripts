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
moneymenu = false;
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

version = "1.3.5";

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
			private ["_speed","_vehicle"];
			_vehicle = cursorTarget;
			_speed   = round (speed _vehicle);

			if (_vehicle isKindOf "Car") then {
				switch (true) do 
				{
					case ((_speed > -80 && _speed <= 80)) : 
					{    
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#33CC33'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round  _speed];
					};
					
					case ((_speed > 80)) : 
					{    
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round  _speed];
					};
				};
			};
		};
		case 39:
		{
			private["_vehicle","_data"];
			_vehicle = cursorTarget;
			if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then {
				_owners = _vehicle getVariable "vehicle_info_owners";
				if(isNil {_owners}) exitWith {hint "Das ist eindeutig ein gecheatetes Fahrzeug...";};
				_owners = [_owners] call life_fnc_vehicleOwners;
				hint parseText format["<t color='#FF0000'><t size='2'>Vehicle Info</t></t><br/><t color='#FFD700'><t size='1.5'>Owners</t></t><br/> %1",_owners];
			};
			//_helfer = "B_soldier_M_F" createUnit [getPos player, group player, "this allowFleeing 0; this allowDamage false; this setName '[LEADER] Rindula'", 1, "Private"];
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
		}; 
		case 66:
		{
			execVM format['rhm\test.sqf'];
		};*/
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
				_vehi  = vehicle player;
				_vel   = velocity _vehi;
				_dir   = direction _vehi;
				_speed = 5;
				_vehi setVelocity [ (_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2 )];
			} else {
				[
					[
						["Du musst der Fahrer von diesem Fahrzeug sein, um es zu beschleunigen!","<t align = 'center' size = '0.7'>%1</t><br/>"]
					]
				] spawn RHM_typeText;
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
			call openConsole;
		};
	};
};

openConsole = {
	if (vehloading) exitWith {};
		vehloading = true;

		{
			player removeAction _x;
		} forEach menu;
		{
			player removeAction _x;
		} forEach teleport;
		{
			player removeAction _x;
		} forEach actions;
		{
			player removeAction _x;
		} forEach feed;
		{
			player removeAction _x;
		} forEach funnyThing;
		{
			player removeAction _x;
		} forEach enter;
		{
			player removeAction _x;
		} forEach spec;
		{
			player removeAction _x;
		} forEach times;
		{
			player removeAction _x;
		} forEach moneym;
		{
			player removeAction _x;
		} forEach myVehicles;
		{
			player removeAction _x;
		} forEach mark;

		player removeAction collapseaction;

		collapseaction = player addAction [format["<t color='#8B0000' shadow='1'shadowColor='#B0C4DE'>RHM Version %1</t> - <t color='#DAA520'>Scrollmenu</t>",version],{if (collapse) then {collapse=false}else{collapse=true};},"",1000,false,false,"","true"];
		if (adminmenu) then {
		menu = [];
		menu set [count menu,player addAction ["<t color='#aa0000'>#> Admin Menu</t>",{if !(men) then {men=true}else{men=false}},"",999,false,false,"","collapse"]];
		// menu set [count menu,player addAction ["<t color='#AFE791'>-- TESTTTTT</t>",{[format["%1 mag dich... er liebt dich... er ist verrückt nach dir... er ist ... tot",name player],"hint"] call BIS_fnc_MP},"",999,false,false,"","men"]];
		menu set [count menu,player addAction ["<t color='#ff0000'>-- End mission</t>","rhm\endmission.sqf","",999,false,false,"","men && collapse"]];
		// menu set [count menu,player addAction ["<t color='#ff0000'>-- Aim</t>","rhm\Aim.sqf","",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#ff0000'>-- Aufräumen</t>",{{deleteVehicle _x}forEach allDead},"",999,false,false,"","men && collapse"]];
		// menu set [count menu,player addAction ["<t color='#ff0000'>-- Musicman</t>",{execVM "rhm\music.sqf"},"",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#ffa000'>-- ESP</t>",{if (esp) then {esp=false; hint "ESP ausgeschalten"}else{esp=true; hint "ESP aktiviert"};},"",999,false,false,"","men && collapse"]];
		// menu set [count menu,player addAction ["<t color='#ff0000'>-- Zurückgelegte Distanz anzeigen</t>","rhm\showdis.sqf","",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#AFE791'>-- Alle Lizenzen</t>","rhm\licenses.sqf","",999,false,false,"","men && collapse"]];
		// menu set [count menu,player addAction ["<t color='#AFE791'>-- Spectate Player</t>","rhm\spectate.sqf","",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#AFE791'>-- Mark Player on Map</t>",{[] spawn RHM_MapMarkerList; collapse = false;},"",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#AFE791'>-- Schlüssel geben</t>",{if(!(cursorTarget in life_vehicles)) then {life_vehicles set[count life_vehicles,cursorTarget];};},"",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#AFE791'>--> Spieler wiederbeleben</t>",{[[name player],"life_fnc_revived",cursorTarget,FALSE] spawn life_fnc_MP;},"",999,false,false,"","men && collapse"]];
		// menu set [count menu,player addAction ["<t color='#AFE791'>--> Stadtsuche</t>",{execVM "rhm\executor.sqf"},"",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\zeus_ca.paa' /> <t color='#AFE791'>Blitzen</t>",{call blitz;},"",999,false,false,"","men && collapse"]];
		// menu set [count menu,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\callsupport_ca.paa' /> <t color='#FA5858'>Wantedlist</t>","rhm\wantedlist.sqf","",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#111111'>#>> Console öffnen</t>", {createDialog "RscDisplayDebugPublic";},"",999,false,false,"","men && collapse"]];
		// menu set [count menu,player addAction ["<t color='#af00af'>#>> Übernehmen</t>", "rhm\take.sqf","",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<img image='\A3\Ui_f\data\Logos\a_64_ca.paa' /> <t color='#afaf00'>Virtuelles Arsenal</t>", {["Open",true] spawn BIS_fnc_arsenal;},"",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#82FA58'>#>> Infos</t>",{call infos;},"",999,false,false,"","men && collapse"]];
		menu set [count menu,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\cursors\track_gs.paa' /> <t color='#8181F7'>GPS Tracker anbringen</t>",{call track;},"",999,false,true,"Compass","men && collapse"]];
		menu set [count menu,player addAction ["<t color='#5151e7'>#>> GPS Tracker entfernen</t>", {{deleteMarker _x} forEach tracker; tracker = []},"",999,false,false,"","men && collapse"]];
		// menu set [count menu,player addAction ["<t color='#f151e7'>#>> News Banner entfernen</t>",{[[[],"rhm\nonewsbanner.sqf"],"BIS_fnc_execVM"]  call BIS_fnc_MP;},"",999,false,true,"","men && collapse"]];
		// menu set [count menu,player addAction ["<t color='#a1a1e7'>#>> Rauchen</t>","rhm\smoke.sqf","",999,false,true,"","men && !emitterrun"]];
		// menu set [count menu,player addAction ["<t color='#c1c1e7'>#>> Mit Rauchen aufhören</t>",{emitterrun = false},"",999,false,true,"","men && emitterrun"]];
		menu set [count menu,player addAction ["<t size='1.1'>#>> Config datei neu laden</t>","rhm\reloadconfig.sqf","",999,false,true,"","men && collapse"]];
		menu set [count menu,player addAction ["-----------------------------------------","","",999,false,true,"","men && collapse"]];
		};
		if (moneymenu) then {
		moneym = [];
		moneym set [count moneym, player addAction ["<t color='#2ECCFA'>#>Geld Menü</t>",{if !(money) then {money=true}else{money=false}},"",998,false,false,"","collapse"]];
		moneym set [count moneym,player addAction ["<t color='#4ECC4A'>#>-> Altis Life</t>",{if !(moneyAL) then {moneyAL=true}else{moneyAL=false}},"",998,false,false,"","money && (!isNil 'life_cash') && collapse"]];
		moneym set [count moneym,player addAction ["<t color='#FECC4A'>#>-> Altis Life</t>",{hint "Entweder du spielst gerade kein Altis Life (o.Ä.) oder die Variablen für das Geld wurden abgeändert!"},"",998,false,false,"","money && (isNil 'life_cash') && collapse"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $1.000</t>",{[1000,"AL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyAL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $10.000</t>",{[10000,"AL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyAL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $100.000</t>",{[100000,"AL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyAL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $1.000.000</t>",{[1000000,"AL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyAL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $10.000.000</t>",{[10000000,"AL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyAL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $100.000.000</t>",{[100000000,"AL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyAL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $1.000.000.000</t>",{[1000000000,"AL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyAL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#4ECC4A'>#>-> Wasteland</t>",{if !(moneyWL) then {moneyWL=true}else{moneyWL=false}},"",998,false,false,"","money && collapse"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $1.000</t>",{[1000,"WL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyWL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $10.000</t>",{[10000,"WL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyWL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $100.000</t>",{[100000,"WL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyWL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $1.000.000</t>",{[1000000,"WL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyWL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $10.000.000</t>",{[10000000,"WL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyWL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $100.000.000</t>",{[100000000,"WL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyWL && collapse && money"]];
		moneym set [count moneym,player addAction ["<t color='#7ECC4A'>#>->-> $1.000.000.000</t>",{[1000000000,"WL"] execVM "rhm\money.sqf"},"",998,false,false,"","moneyWL && collapse && money"]];
		};

		if (teleportmenu) then {
		teleport = [];
		teleport set [count teleport,player addAction ["<t color='#2ECCFA'>#>Teleportieren</t>",{if !(tp) then {tp=true}else{tp=false}},"",998,false,false,"","collapse"]];
		teleport set [count teleport,player addAction ["<t color='#2ECC4A'>#>> Cursor Target</t>",{_tppos = screenToWorld [0.5,0.5]; vehicle player setPos _tppos;},"",998,false,false,"","tp && collapse"]];
		teleport set [count teleport,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\map_ca.paa' /> <t color='#2E4CFA'>Map Klick</t>",{
		openMap true;
		onMapSingleClick {
			(_pos) spawn {
				openMap false;
				cutText ["Teleportiere.....","BLACK OUT",1];
				uiSleep (1.5);
				vehicle player setpos _this;
				cutText ["Teleportiert","BLACK FADED"];
				uiSleep (1);
				cutText ["Teleportiert","BLACK IN",1];
				onMapSingleClick {};
			};
		};
		},"",998,false,true,"","tp && collapse"]];
		teleport set [count teleport,player addAction ["<t color='#2ECCFA'>#>> Kamera</t>",{[] execVM "a3\functions_f\Debug\fn_camera.sqf";},"",998,false,true,"","tp && collapse"]];
		teleport set [count teleport,player addAction ["<t color='#2ECCFA'>#>> Hubschraubertransport</t>",{[] execVM "rhm\order.sqf";},"",998,false,true,"","tp && collapse"]];
		// teleport set [count teleport,player addAction ["<t color='#2ECCFA'>#>> Fliegen</t>",{[] execVM "rhm\fly.sqf";},"",998,false,true,"","tp && collapse"]];
		};

		if (livefeedmenu) then {
		feed = [];
		feed set [count feed,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\thirdperson_ca.paa' /> <t color='#5ECC1A'>Live Feed starten</t>", {call live_feed;},"",996,false,false,"","!live && collapse"]];
		feed set [count feed,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\head_ca.paa' /> <t color='#aE6C1A'>Live Feed Normale Sicht</t>", {mode = 0},"",996,false,false,"","live && mode != 0 && collapse"]];
		feed set [count feed,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\nv_ca.paa' /> <t color='#5ECC1A'>Live Feed Nachtsicht</t>", {mode = 1},"",996,false,false,"","live && mode != 1 && collapse"]];
		feed set [count feed,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\thermal_imaging_ca.paa' /> <t color='#888888'>Live Feed Wärmebild</t>", {mode = 2},"",996,false,false,"","live && mode != 2 && collapse"]];
		feed set [count feed,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\cursors\hc_unsel_gs.paa' /> Live Feed beenden",{live = false},"",996,false,false,"","live && collapse"]];
		};


		actions = [];
		actions set [0, player addAction ["<t color='#2E64FE'>#> Fahrzeugmenu</t>", {if !(ac1) then {ac1=true}else{ac1=false}; {_x=false} forEach [ac2,ac3,ac4];}, [], 997, false, false,"","collapse"]];
				[]spawn {
				_starttime = time;
				classes = [];
				classes2 = [];
				myVehiclescnt = 0;
				myVehicles = [];
				_l263=configFile>>"cfgVehicles";for"_l39"from 0 to(count _l263)-1 do{_l264=_l263 select _l39;if(isClass _l264)then{_l12=configName _l264;if((getNumber(_l264>>"scope")==2)&&(getText(_l264>>"picture")!="")&&(((_l12 isKindOf"LandVehicle")or(_l12 isKindOf"Air")or(_l12 isKindOf"Ship")))&&!((_l12 isKindOf"ParachuteBase")or(_l12 isKindOf"BIS_Steerable_Parachute")))then{
					
					if (!(_l12 in classes) and !(getText(_l264>>"displayName") in classes2)) then {
					myVehicles set [count myVehicles, player addAction [format["<img image='%2' /> %1",getText(_l264>>"displayName"),getText(_l264>>"picture")],{
						
						veh = createVehicle [(_this select 3 select 0), (player modelToWorld [0,0,10000]),[],0,"NONE"];
						veh setDir direction player;
						_bbr = boundingBoxReal veh;
						_p1 = _bbr select 0;
						_p2 = _bbr select 1;
						_maxLength = abs ((_p2 select 1) - (_p1 select 1));
						veh setPos [(position player select 0)+(sin (direction veh)*_maxLength), (position player select 1)+(cos (direction veh)*_maxLength), (position player select 2)];
						[veh] execVM "rhm\colors.sqf";
						
					}, [_l12], 997, false, false,"","ac1 && collapse"]];
					classes set [count classes,_l12];
					classes2 set [count classes2,getText(_l264>>"displayName")];
					myVehiclescnt = myVehiclescnt + 1;
					sleep (0.02);
					};
				}}};
				[[format["%1 Fahrzeuge in %2 sekunden geladen.",myVehiclescnt,time - _starttime]]]spawn RHM_typeText;
				vehloading = false;
				};
				
		enter = [];
		enter set [count enter,player addAction ["><t color='#eeee00'>Einsteige Menu",{if !(enterm) then {enterm=true}else{enterm=false}}, [], 996, false, false,"","collapse && collapse"]];
		enter set [count enter,player addAction ["><t color='#555500'>-> Als Fahrer",{[] spawn {moveOut driver cursorTarget; moveOut driver vehicle player; moveOut player; uiSleep(0.1); player moveInDriver cursorTarget}}, [], 996, false, false,"","enterm && collapse"]];
		enter set [count enter,player addAction ["><t color='#555500'>-> Als Passagier",{moveOut player; player moveInCargo cursorTarget}, [], 996, false, false,"","enterm && collapse"]];
		enter set [count enter,player addAction ["><t color='#555500'>-> Hauptsache drin",{moveOut player; player moveInAny cursorTarget}, [], 996, false, false,"","enterm && collapse"]];


		times = [];
		times set [count times,player addAction ["><t color='#eeee00'>Zeit",{if !(timesm) then {timesm=true}else{timesm=false}}, [], 995, false, false,"","collapse"]];
		times set [count times,player addAction ["><t color='#555500'>-> Tag",{"day" call time;}, [], 995, false, false,"","timesm && collapse"]];
		times set [count times,player addAction ["><t color='#555500'>-> Nacht",{"night" call time;}, [], 995, false, false,"","timesm && collapse"]];

		funnyThing = [];
		// funnyThing set [count funnyThing, player addAction ["#Fun",{
		// 	execVM "rhm\fun.sqf"
		// },"",995,false,false,"","collapse"]];
		funnyThing set [count funnyThing, player addAction ["AI Jet",{
			call jetlag;
		},"",995,false,false,"","collapse"]];
}

time = {
	switch (_this) do {
		case "day": {
			[{
				systemChat "Wechsle zu Tagzeit";
				skiptime (6-daytime);
			},"BIS_fnc_Spawn"] call BIS_fnc_MP;
		};
		case "night": {
			[{
				systemChat "Wechsle zu Nachtzeit";
				skiptime (21-daytime);
			},"BIS_fnc_Spawn"] call BIS_fnc_MP;
		};
		default {systemChat "Falsches Argument!"};
	};
}

live_feed = {
	_unit = cursorTarget;

	if !(_unit isKindOf "AllVehicles") exitWith {
		hint "Du kannst nur Personen und Fahrzeuge beobachten!";
	};
	mode = 0;
	curMode = mode;
	_cam = "Sign_Sphere10cm_F" createVehicle position player;
	_cam attachTo [_unit,[5,5,10]];
	hideObjectGlobal _cam;
	hideObject _cam;
	[_cam,_unit,player,mode] call BIS_fnc_liveFeed;
	hint "Live Feed gestartet.";
	live = true;
	while {live && alive player && alive _unit} do {
		if (curMode != mode) then {
			[mode] call BIS_fnc_liveFeedEffects;
			curMode = mode;
		};
	};
	live = false;
	hint "Live Feed beendet";
	call BIS_fnc_liveFeedTerminate;
	uiSleep(10);
	deleteVehicle _cam;
}

track = {
	_unit = cursorTarget;
	if(isNull _unit) exitWith {};
	if(!(_unit isKindOf "AllVehicles")) exitWith {titleText ["Du kannst den GPS Tracker hier nicht benutzen.","PLAIN"]};
	titleText["Du hast einen GPS Tracker angebracht.","PLAIN"];
	[_unit] spawn {
		_veh = _this select 0;
		_markerName = format["%1_gpstracker_arrow",_veh];
		tracker set[count tracker,_markerName];
		_marker = createMarkerLocal [_markerName, visiblePosition _veh];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "mil_arrow";
		_marker setMarkerPosLocal getPos _veh;
		_markerName2 = format["%1_gpstracker_sphere",_veh];
		tracker set[count tracker,_markerName2];
		_marker2 = createMarkerLocal [_markerName2, visiblePosition _veh];
		_marker2 setMarkerColorLocal "ColorBlack";
		_marker2 setMarkerTypeLocal "Select";
		_marker2 setMarkerPosLocal getPos _veh;
		while {true} do {
		if(not alive _veh) exitWith {};
		if (_veh isKindOf "Man") then {
			if (vehicle _veh == _veh) then {
				_marker2 setMarkerTextLocal "<||GPS Tracker||> "+name _veh;
			} else {
				_marker2 setMarkerTextLocal "<||GPS Tracker||> "+name _veh+" ["+getText(configfile >> "CfgVehicles" >> typeOf vehicle _veh >> "displayName")+"]";
			}
		}else{
			_marker2 setMarkerTextLocal "<||GPS Tracker||> "+getText(configfile >> "CfgVehicles" >> typeOf _veh >> "displayName");
		};
		

		
		_marker setMarkerPosLocal getPos _veh;
		_marker setMarkerDirLocal (direction _veh);
		_marker2 setMarkerPosLocal getPos _veh;
		_marker2 setMarkerDirLocal (direction _veh);
		uiSleep 0.01;
	};
	for "_a" from 1 to 0 step -0.02 do {
		_marker setMarkerAlphaLocal _a;
		sleep(0.1);
	};
	deleteMarkerLocal _markerName;
	if (_veh isKindOf "Man") then {
		_marker2 setMarkerTextLocal name _veh+" #KIA";
	}else{
		_marker2 setMarkerTextLocal getText(configfile >> "CfgVehicles" >> typeOf _veh >> "displayName")+" #KIA";
	};
	_marker2 setMarkerDirLocal 0;
	_marker2 setMarkerTypeLocal "KIA";
	for "_b" from 1 to 0 step -0.01 do {
		_marker2 setMarkerAlphaLocal _b;
		uiSleep(0.6);
	};
	deleteMarkerLocal _markerName2;
	};
}

infos = {
	_a = 0;
	_b = 0;
	_c = 0;
	_m = "";
	_n = "";
	_v = "";
	systemChat "-----------------------Liste------------------------------------------------------------------------------------------"; 
	{
		_displayNameIn = getText(configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "displayName");
		systemChat format ["-> %1 || %2 || %3 || %4",_x, name _x,_displayNameIn,_x distance player];
		_a = _a + 1;
		if(vehicle _x == _x) then {_b = _b + 1;};
		if(vehicle _x != _x) then {_c = _c + 1;};
	} forEach playableUnits;
	systemChat "------------------------Info-------------------------------------------------------------------------------------------";
	if(_a != 1) then {
		_m = "sind";
	} else {
		_m = "ist";
	};
	if(_b != 1) then {
		_n = " sind";
	} else {
		_n = "er ist";
	};
	if(_c != 1) then {
		_v = "sitzen";
	} else {
		_v = "sitzt";
	};


	systemChat format["Es %4 %1 Spieler Online. %2 Spieler %6 in einem Fahrzeug, %3%5 zu Fuß.",_a,_c,_b,_m,_n,_v];
	systemChat "--------------------------Spieler innerhalb 500m------------------------------------------------------------";
	{
		if (_x distance player <= 500 and !player) then {
			systemChat format["- '%1'", name _x];
		};
	} forEach playableUnits;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//             Neue Infos (Hint unso)
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	_list = (position player) nearEntities ["CAManBase", 500];
	_listF = "";
	_seperator = "------------------------<br />";
	_laengen = [];
	{
		_laengen set [count _laengen,count name _x];
	} forEach _list;
	_num = _laengen call BIS_fnc_greatestNum;
	{
		if (name _x != name player) then {
			_distance = round(player distance _x);
			_spaces = "";
			for "_i" from 0 to (_num-count(name _x)) do {
				_spaces = _spaces + " ";
			};
			
			switch (toLower (format ["%1",side _x])) do {
				case "west": {
					_listF = _listF + format["<t color='#0000a0'>%1</t> %3| (%2)<br />BLUFOR<br /><br />",name _x, _distance,_spaces];
				};
				case "east": {
					_listF = _listF + format["<t color='#a00000'>%1</t> %3| (%2)<br />OPFOR<br /><br />",name _x, _distance,_spaces];
				};
				case "guer": {
					_listF = _listF + format["<t color='#00a000'>%1</t> %3| (%2)<br />Wiederstand<br /><br />",name _x, _distance,_spaces];
				};
				case "civ": {
					_listF = _listF + format["<t color='#7D42B3'>%1</t> %3| (%2)<br />Zivilist<br /><br />",name _x, _distance,_spaces];
				};
				default {
					_listF = _listF + format["%1 (%2)<br />",name _x, _distance];
				};
			};

		};
	} forEach _list;
	hint parseText format["%1%2%3 Vereinigung",_listF,_seperator,worldname];
}

blitz = {
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
}

jetlag = {
	_veh = createVehicle ["B_Plane_CAS_01_F", [position player select 0,position player select 1,(position player select 2)+3000], [], 0, "none"];
	clearItemCargoGlobal _veh;
	createVehicleCrew _veh;
	_veh engineOn true;
	_veh setVelocity [0,0,500];
	hint format["%1",crew _veh];
	player remoteControl driver _veh;
	driver _veh switchCamera "Internal";
	driver _veh disableAI "MOVE";
	driver _veh disableAI "AUTOTARGET";
	flydone = false;
	while {!flydone} do {
		if ((!alive _veh) or (!someAmmo _veh) or (!alive driver _veh)) then {
			flydone = true;
		};
	};
	deleteVehicle (driver _veh);
	player switchCamera "Internal";
	waitUntil {!alive _veh};
	uiSleep (10);
	deleteVehicle _veh;
}

vehicle_marker = {
	while {true} do {

	{
		if (alive _x) then {
		if !(_x in markers) then {
			_mark = createMarkerLocal [str(_x), position _x];
			markers set [count markers, _x];
		};

			_curtarget = str(_x);
			_curtargetname = getText (configFile >> 'cfgVehicles' >> typeOf _x >> 'displayName');
			_curtargetdir = if (round(getDir _x) >= 360) then {0} else {round(getDir _x)};



	switch (side _x) do {
		case west : {
			switch (true) do {
				case (_x isKindOf "Car"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "b_motor_inf" };
				case (_x isKindOf "Tank"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "b_armor" };
				case (_x isKindOf "Helicopter"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "b_air" };
				case (_x isKindOf "Plane"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "b_plane" };
				case (_x isKindOf "Ship"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "b_naval" };
			};
		};
		case east : {
			switch (true) do {
				case (_x isKindOf "Car"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "o_motor_inf" };
				case (_x isKindOf "Tank"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "o_armor" };
				case (_x isKindOf "Helicopter"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "o_air" };
				case (_x isKindOf "Plane"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "o_plane" };
				case (_x isKindOf "Ship"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "o_naval" };
			};
		};
		case resistance : {
			switch (true) do {
				case (_x isKindOf "Car"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "n_motor_inf" };
				case (_x isKindOf "Tank"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "n_armor" };
				case (_x isKindOf "Helicopter"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "n_air" };
				case (_x isKindOf "Plane"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "n_plane" };
				case (_x isKindOf "Ship"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "n_naval" };
			};
		};
		default {
			switch (true) do {
				case (_x isKindOf "Car"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "mil_unknown" };
				case (_x isKindOf "Tank"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "mil_unknown" };
				case (_x isKindOf "Helicopter"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "mil_unknown" };
				case (_x isKindOf "Plane"): { _curtarget setMarkerText format["%1 - %2 km/h - %3° - %4 m",_curtargetname,round(speed _x),_curtargetdir,round((getPosATL _x) select 2)]; _curtarget setMarkerType "mil_unknown" };
				case (_x isKindOf "Ship"): { _curtarget setMarkerText format["%1 - %2 km/h - %3°",_curtargetname,round(speed _x),_curtargetdir]; _curtarget setMarkerType "mil_unknown" };
			};
			_curtarget setMarkerAlphaLocal 0.1;
		};
	};

	_curtarget setMarkerPosLocal position _x;
	} else {
		_temp = _x getVariable ["rhm_tot",false];
		if (!(str(_x) in deaded)&&!(_temp)) then {
		[_x] spawn {
			_veh = _this select 0;
			deleteMarkerLocal str(_veh);
			deaded set [count deaded, str(_veh)];
			_curtargetname = getText (configFile >> 'cfgVehicles' >> typeOf _veh >> 'displayName');
			_veh setVariable ["rhm_tot",true,true];
			[parseText format["<t color = '#e00000'>Verbindung zu einem GPS Systems verloren!</t>"], [0.25, 1, 0.5, 0.05], nil, 1] spawn     BIS_fnc_textTiles;
			uiSleep(2);
			[parseText format["Fahrzeug: %1<br />Grad: %2°<br />Distanz: %3m", _curtargetname, round([player, _veh] call BIS_fnc_dirTo), round(player distance _veh)],[0.25, 1, 0.5, 0.15]] spawn  BIS_fnc_textTiles;
		};
		};
	};
	} forEach vehicles;
	uiSleep (0.01);
	};
}

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

	// execVM "rhm\vehiclemarkers.sqf";
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