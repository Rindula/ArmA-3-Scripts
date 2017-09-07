					addMissionEventHandler ["Draw3D",{ 
						if (esp) then {
                            {
								_icon = getText(configFile >> "CfgVehicles" >> typeOf _x >> "icon");
                                if ((_x in playableUnits) && (side _x != side player) && (getPlayerUID _x != "") && ((player distance _x) < 3000)) then {
                                    if (vehicle _x == _x) then {
										drawIcon3D[_icon, [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 | %1m", round((player distance _x)*10)/10, name _x]), 1, 0.04, "TahomaB"];
									} else {
										drawIcon3D[_icon, [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 [%3] | %1m", round((player distance _x)*10)/10, name _x,getText(configfile >> "CfgVehicles" >> typeOf (vehicle _x) >> "displayName")]), 1, 0.04, "TahomaB"];
									}
                                } else {
                                    if ((_x in playableUnits) && (getPlayerUID _x != "") && ((player distance _x) < 3000) && (vehicle _x == _x) && (_x != player)) then {
                                        drawIcon3D[_icon, [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 | %1m", round((player distance _x)*10)/10, name _x]), 1, 0.04, "TahomaB"]
                                    };
                                    if ((_x in playableUnits) && (getPlayerUID _x != "") && ((player distance _x) < 3000) && (vehicle _x != _x) && (_x != player)) then {
                                        drawIcon3D[_icon, [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 [%3] | %1m", round((player distance _x)*10)/10, name _x,getText(configfile >> "CfgVehicles" >> typeOf (vehicle _x) >> "displayName")]), 1, 0.04, "TahomaB"]
                                    };
                                };
                                    if (!(_x in playableUnits) && ((player distance _x) < 3000) && (vehicle _x == _x) && (_x != player) && (side _x == side player)) then {
                                        drawIcon3D[_icon, [0, 1, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 | %1m", round((player distance _x)*10)/10, name _x]), 1, 0.02, "TahomaB"]
                                    };
                                    if (!(_x in playableUnits) && ((player distance _x) < 3000) && (vehicle _x != _x) && (_x != player) && (side _x == side player)) then {
                                        drawIcon3D[_icon, [0, 1, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 [%3] | %1m", round((player distance _x)*10)/10, name _x,getText(configfile >> "CfgVehicles" >> typeOf (vehicle _x) >> "displayName")]), 1, 0.02, "TahomaB"]
                                    };
                                    if (!(_x in playableUnits) && ((player distance _x) < 3000) && (vehicle _x == _x) && (_x != player) && (side _x != side player)) then {
                                        drawIcon3D[_icon, [1, 1, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 | %1m", round((player distance _x)*10)/10, name _x]), 1, 0.02, "TahomaB"]
                                    };
                                    if (!(_x in playableUnits) && ((player distance _x) < 3000) && (vehicle _x != _x) && (_x != player) && (side _x != side player)) then {
                                        drawIcon3D[_icon, [1, 1, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 [%3] | %1m", round((player distance _x)*10)/10, name _x,getText(configfile >> "CfgVehicles" >> typeOf (vehicle _x) >> "displayName")]), 1, 0.02, "TahomaB"]
                                    };
                            }
                            foreach allUnits;
                        };
					}];