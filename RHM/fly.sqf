
/*
inFly = true;
uiSleep (0.5);
while {inFly} do {
	if (position player select 2 < 200) then {
		player setVelocity [velocity player select 0,velocity player select 1,(velocity player select 2)+ 0.05];
	};
};

/*
uiSleep (3);
(_position) spawn {
	while {_this select 0 > [round(position player select 0), round(position player select 1), round(position player select 2)]} do {
		player setVelocity [-10,velocity player select 1, velocity player select 2];
	}:
};
(_position) spawn {
	while {_this select 1 > [round(position player select 0), round(position player select 1), round(position player select 2)]} do {
		player setVelocity [velocity player select 0,-10, velocity player select 2];
	}:
};
(_position) spawn {
	while {_this select 0 < [round(position player select 0), round(position player select 1), round(position player select 2)]} do {
		player setVelocity [10,velocity player select 1, velocity player select 2];
	}:
};
(_position) spawn {
	while {_this select 1 < [round(position player select 0), round(position player select 1), round(position player select 2)]} do {
		player setVelocity [velocity player select 0,10, velocity player select 2];
	}:
};

waitUntil {[round(position player select 0), round(position player select 1), round(position player select 2)] == [round(_position select 0), round(_position select 1), round(_position select 2)]};
inFly = false;
player setVelocity [0,0,0];
while {position player select 2 > 0.5} do {
	player setVelocity [0,0,position player select 2 / 2 * -1];
};
*/