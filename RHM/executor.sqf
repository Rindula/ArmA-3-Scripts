/*
made by JungleNor
May 16th 2014
smoke weed everyday
*/
located_coord = nil;

waitUntil {isNil "located_coord"};

[] spawn {		
	uiSleep 0.1;
	closedialog 0;
	uiSleep 0.1;
	createdialog 'RscDisplayInsertMarker';
	uiSleep 0.1;
	disableSerialization;
	
	_ctrl = (findDisplay 54) displayCtrl 101;
	_ctrl ctrlSetFont "PuristaBold";
	_ctrl ctrlSetTextColor[1,1,1,1];
	_ctrl ctrlCommit 0;
	
	_ctrl = (findDisplay 54) displayCtrl 1;
	_ctrl ctrlSetFont "PuristaBold";
	_ctrl ctrlSetTextColor[1,1,1,1];
	_ctrl ctrlSetText "Suchen";
	_ctrl buttonSetAction "_RHM_CODE = (ctrlText 101);[_RHM_CODE] execVM 'rhm\locator.sqf'";
	_ctrl ctrlCommit 1;
	
	_ctrl = (findDisplay 54) displayCtrl 2;
	_ctrl ctrlSetFont "PuristaBold";
	_ctrl ctrlSetText "CLEAR";
	_ctrl ctrlSetTextColor [1,1,1,1];
	_ctrl buttonSetAction "ctrlsetText[101,''''];";
	_ctrl ctrlCommit 0;

	_ctrl = (findDisplay 54) displayCtrl 1001;
	_ctrl ctrlSetFont "PuristaBold";
	_ctrl ctrlSetText "RHM's Stadtsuche";
	_ctrl ctrlSetTextColor [0,0,0,1];
	_ctrl ctrlSetBackgroundColor [0,0.7,1,1];
	_ctrl buttonSetAction "ctrlsetText[101,''''];";
	_ctrl ctrlCommit 0;
	
	_ctrl = (findDisplay 54) displayCtrl 1100;
	_ctrl ctrlSetFont "PuristaBold";
	_ctrl ctrlSettext "Stadt:";
	_ctrl ctrlSetTextColor [1,1,1,1];
	_ctrl ctrlCommit 2;

	_ctrl = (findDisplay 54) displayCtrl 2400;
	_ctrl ctrlSetFont "PuristaBold";
	_ctrl ctrlSettext "Hilfe";
	_ctrl ctrlSetTextColor [1,1,1,1];
	_ctrl ctrlCommit 0;
	
	_ctrl = (findDisplay 54) displayCtrl 1101;
	_ctrl ctrlSetFont "PuristaBold";
	_ctrl ctrlSettext 'Beispielstadt: Kavala\n\nIn Altislife können auch DP-Punkte gesucht werden.';
	_ctrl ctrlSetTextColor [1,1,1,1];
	_ctrl ctrlCommit 0;
	
	_ctrl = (findDisplay 54) displayCtrl 1081;
	_ctrl ctrlSetBackgroundColor [0,0,0,0.5];
	_ctrl ctrlCommit 0;
};

waitUntil {!isNil "located_coord"};
openMap true;
map ctrlMapAnimAdd [1, 0.1, located_coord];