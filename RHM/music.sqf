[{
	[
        [
                ["Achtung!","<t align = 'center' size = '0.7'>%1</t><br/>"],
                ["Es wird gebeten Kavala sofort zu verlassen!","<t align = 'center' size = '0.7'>%1</t><br/>"],
                ["Es wurden Orbitalbomben gesichtet!","<t align = 'center' size = '0.7'>%1</t>"]
 
        ]
	] spawn BIS_fnc_typeText;
},"BIS_fnc_spawn"] call BIS_fnc_MP;

for "_i" from 60 to 0 step -1 do {
    [parseText format["<t size='2' color='#ff0000'>ETA:</t><br /><t size='3'>%1</t>",_i],"hint"] call BIS_fnc_MP;
    uiSleep(1);
};


["BackgroundTrack03_F_EPC","playMusic"] call BIS_fnc_MP;
for "_a" from 1 to 1000 do {
    _veh = "Bo_GBU12_LGB_MI10" createVehicle [3647 + random(-30) + random(30), 13133 + random (-30) + random(30), 300+(_a*2)];
    _veh setVectorDirAndUp [[0,0,-1],[0,1,0]];
	_veh setVelocity [0,0,-100];
};