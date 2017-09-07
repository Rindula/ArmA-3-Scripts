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
player removeAction collapseaction2;

collapseaction = player addAction [format["<t color='#8B0000' shadow='1'shadowColor='#B0C4DE'>RHM Version %1</t> - <t color='#DAA520'>Scrollmenu</t>",version],{if (collapse) then {collapse=false}else{collapse=true};},"",1000,false,false,"","true"];
if (adminmenu) then {
menu = [];
menu set [count menu,player addAction ["<t color='#aa0000'>#> Admin Menu</t>",{if !(men) then {men=true}else{men=false}},"",999,false,false,"","collapse"]];
// menu set [count menu,player addAction ["<t color='#AFE791'>-- TESTTTTT</t>",{[format["%1 mag dich... er liebt dich... er ist verrückt nach dir... er ist ... tot",name player],"hint"] call BIS_fnc_MP},"",999,false,false,"","men"]];
menu set [count menu,player addAction ["<t color='#ff0000'>-- End mission</t>","rhm\endmission.sqf","",999,false,false,"","men && collapse"]];
// menu set [count menu,player addAction ["<t color='#ff0000'>-- Aim</t>","rhm\Aim.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#ff0000'>-- Aufräumen</t>",{{deleteVehicle _x}forEach allDead},"",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#ff0000'>-- Musicman</t>",{execVM "rhm\music.sqf"},"",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#ffa000'>-- ESP</t>",{if (esp) then {esp=false; hint "ESP ausgeschalten"}else{esp=true; hint "ESP aktiviert"};},"",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#ff0000'>-- Zurückgelegte Distanz anzeigen</t>","rhm\showdis.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#AFE791'>-- Alle Lizenzen</t>","rhm\licenses.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#AFE791'>-- Spectate Player</t>","rhm\spectate.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#AFE791'>-- Mark Player on Map</t>",{[] spawn RHM_MapMarkerList; collapse = false;},"",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#AFE791'>-- Schlüssel geben</t>",{if(!(cursorTarget in life_vehicles)) then {life_vehicles set[count life_vehicles,cursorTarget];};},"",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#AFE791'>--> Spieler wiederbeleben</t>",{[[name player],"life_fnc_revived",cursorTarget,FALSE] spawn life_fnc_MP;},"",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#AFE791'>--> Stadtsuche</t>",{execVM "rhm\executor.sqf"},"",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\zeus_ca.paa' /> <t color='#AFE791'>Blitzen</t>","rhm\blitz.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\callsupport_ca.paa' /> <t color='#FA5858'>Wantedlist</t>","rhm\wantedlist.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#111111'>#>> Console öffnen</t>", "rhm\cons.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#af00af'>#>> Übernehmen</t>", "rhm\take.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<img image='\A3\Ui_f\data\Logos\a_64_ca.paa' /> <t color='#afaf00'>Virtuelles Arsenal</t>", "rhm\arsenal.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#82FA58'>#>> Infos</t>","rhm\tot.sqf","",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\cursors\track_gs.paa' /> <t color='#8181F7'>GPS Tracker anbringen</t>","rhm\track.sqf","",999,false,true,"Compass","men && collapse"]];
menu set [count menu,player addAction ["<t color='#5151e7'>#>> GPS Tracker entfernen</t>", {{deleteMarker _x} forEach tracker; tracker = []},"",999,false,false,"","men && collapse"]];
menu set [count menu,player addAction ["<t color='#f151e7'>#>> News Banner entfernen</t>",{[[[],"rhm\nonewsbanner.sqf"],"BIS_fnc_execVM"]  call BIS_fnc_MP;},"",999,false,true,"","men && collapse"]];
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
feed set [count feed,player addAction ["<img image='\A3\Ui_f\data\gui\cfg\Hints\thirdperson_ca.paa' /> <t color='#5ECC1A'>Live Feed starten</t>", "rhm\feed.sqf","",996,false,false,"","!live && collapse"]];
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
times set [count times,player addAction ["><t color='#555500'>-> Tag",{"day" execVM "rhm\time.sqf"}, [], 995, false, false,"","timesm && collapse"]];
times set [count times,player addAction ["><t color='#555500'>-> Nacht",{"night" execVM "rhm\time.sqf"}, [], 995, false, false,"","timesm && collapse"]];

funnyThing = [];
funnyThing set [count funnyThing, player addAction ["#Fun",{
	execVM "rhm\fun.sqf"
},"",995,false,false,"","collapse"]];
funnyThing set [count funnyThing, player addAction ["AI Jet",{
	execVM "rhm\jetlag.sqf"
},"",995,false,false,"","collapse"]];