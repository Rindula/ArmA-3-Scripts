_unit=player;
removeallweapons _unit;
removeVest _unit;

_unit addVest "V_Rangemaster_belt";
removebackpack _unit;

removeuniform _unit;
_unit addUniform "U_Rangemaster";

//_unit addBackpack "B_Carryall_Base";//you can add a backpack if you want to
_unit addWeapon "hgun_P07_snds_F";
player addWeapon "Binocular";


_magazines = getArray (configFile >> "CfgWeapons" >> "hgun_P07_snds_F" >> "magazines");

{
player addmagazine _x;
player addmagazine _x;
player addmagazine _x;
player addmagazine _x;
}foreach _magazines;

reload player;

hint format ["","You're now a Fake Cops"];