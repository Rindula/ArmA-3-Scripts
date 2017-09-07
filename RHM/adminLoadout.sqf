[{

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
////////////////////////////////////////////////////////////////////////////////////////////////
player adduniform"U_B_GhillieSuit"; 
player addvest"V_TacVest_blk";
player addheadgear"H_ShemagOpen_khk"; 
player addbackpack"B_Carryall_khcamo";
////////////////////////////////////////////////////////////////////////////////////////////////
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "NVGoggles_OPFOR";
player linkItem "Rangefinder";
////////////////////////////////////////////////////////////////////////////////////////////////
player addWeapon"srifle_LRR_SOS_F";
player addItem "7Rnd_408_Mag"; 
player addItem "7Rnd_408_Mag"; 
player addItem "7Rnd_408_Mag";
player addItem "7Rnd_408_Mag"; 
player addItem "7Rnd_408_Mag"; 
player addItem "7Rnd_408_Mag"; 
player addItem "7Rnd_408_Mag"; 
player addItem "7Rnd_408_Mag"; 
player addItem "7Rnd_408_Mag"; 
player addItem "7Rnd_408_Mag";
player addItem "7Rnd_408_Mag";
player addItem "7Rnd_408_Mag";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
////////////////////////////////////////////////////////////////////////////////////////////////
player addWeapon"hgun_Pistol_heavy_02_F";
player addHandgunItem "optic_Yorris";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";
player addItem "6Rnd_45ACP_Cylinder";

/////////////////////////////////////////////////////////////////////////////////////////////////

[parseText format["<t color = '#CC0000'>Lasset die Spiele beginnen. Viel Glück %1</t>",player], [0.25, 1, 0.5, 0.05], [1, 1], 10] spawn   BIS_fnc_textTiles;

},"BIS_fnc_Spawn",_sender,false] call BIS_fnc_MP;