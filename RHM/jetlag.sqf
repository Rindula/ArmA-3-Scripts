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