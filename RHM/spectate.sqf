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
} forEach times;  
{
    player removeAction _x;
} forEach moneym;
                spec set [count spec,player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by Rindula";
                    execVM "rhm\console.sqf";
                }, "", 50]];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected" from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by Rindula - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                [] call RHM_PlayerList;