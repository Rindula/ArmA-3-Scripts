/* _cv = "B_APC_Tracked_01_CRV_F" createVehicle (player modelToWorld [0,10,0]);
_cv setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,1,0,1)"];
_cv setObjectTextureGlobal [1, "#(rgb,8,8,3)color(1,0,0,1)"];
_cv setObjectTextureGlobal [2, "#(rgb,8,8,3)color(1,1,0,1)"];
_cv setObjectTextureGlobal [3, "#(rgb,8,8,3)color(1,0,1,1)"];
_cv setDir direction player; */





h = "B_MRAP_01_F" createVehicle (player modelToWorld [0,7.5,0.5]);
h setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0.5)"];
h setObjectTextureGlobal [1, "#(rgb,8,8,3)color(0,0,0.1,1)"];

m = "B_Mortar_01_F" createVehicle position h;
m disableCollisionWith h;
uiSleep(0.001);
m setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,1)"];
m addEventHandler ["fired",{m setVehicleAmmo 1}];
m attachTo [h,[0,-3,-0.75]];
m lock true;
[[m,h],"mortaracts",true,false] call BIS_fnc_MP;

mortaracts = {
    m = _this select 0;
    h = _this select 1;
    h addAction ["<t color='#ff00ff'>Zum Mörser</t>",{ moveOut (_this select 1); (_this select 1) moveInGunner m }, [], 1.5, false, false,"","driver h == player"];
    m addAction ["<t color='#ff5500'>Zum Hunter</t>",{ moveOut (_this select 1); moveOut driver h; (_this select 1) moveInDriver h }, [], 1.5, false, false,"","gunner m == player"];
};