_rope = ropeCreate [vehicle player, [0,0,0], cursorTarget, [0,2,0], 15];
uiSleep(1);
antirope set [count antirope, player addAction [format["%1 Seil/e entfernen",count(ropes vehicle player)],{{ropeDestroy _x} forEach ropes vehicle player; {player removeAction _x} forEach antirope; antirope = [];}]];
//systemChat format["%1",antirope];