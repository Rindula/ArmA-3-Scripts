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