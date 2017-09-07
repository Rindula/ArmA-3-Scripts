_veh = _this select 0;

_checkAuto = getText (configfile >> "CfgVehicles" >> typeOf (_veh) >> "vehicleClass");

Strider = [
	"I_MRAP_03_F",
	"I_MRAP_03_hmg_F",
	"I_MRAP_03_gmg_F"
];
if (typeOf _veh in Strider) then {
for "_i" from 0 to 10 do {
	_veh setObjectTextureGlobal [_i,"#(rgb,8,8,3)color(0.41,0.47,0.47,0.4)"];
};
};
if (_checkAuto == "Autonomous") then {
	createVehicleCrew _veh;
};

if (typeOf (_veh) == "B_UGV_01_F") then {
	_veh addAction ["<t color='#fec469'>Mobiles Arsenal öffnen</t>",{["Open",true] spawn BIS_fnc_arsenal;}];
};

_veh engineOn true;