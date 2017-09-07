keybinds = nil;
keybinds =
{
	switch (_this) do 
	{
		case 38:
		{
			execVM format['rhm\blitzer.sqf'];
		};
		case 39:
		{
			execVM format['rhm\getowner.sqf'];
		};
		case 54:
		{
			// execVM format['rhm\wlist.sqf'];
		};
		case 59:
		{
			player switchCamera "INTERNAL";
		};	
		/* case 60:
		{
			execVM format['rhm\aero_v10k.sqf'];
		};	
		case 61:
		{
			execVM format['rhm\aero_v100k.sqf'];
		};	
		case 62:
		{
			execVM format['rhm\aero_v500k.sqf'];
		};
		case 63:
		{
			execVM format['rhm\aero_v1m.sqf'];
		}; */
		case 66:
		{
			execVM format['rhm\test.sqf'];
		};
		case 68:
		{
			fclose = !fclose;
		};
		/* case 71:
		{
			execVM format['rhm\tp.sqf'];
		};
		case (72):
		{
			execVM format['rhm\mess.sqf'];
		};
		case (73):
		{
			execVM format['rhm\track.sqf'];
		};
		case (75):
		{
			[[position player select 0,(position player select 1) + 1000,20],[position player select 0,(position player select 1) -2000,20],10,"FULL"] execVM format['rhm\flyby.sqf'];
		};
		case (76):
		{
			execVM format['rhm\move.sqs'];
		};
		case (77):
		{
			openMap true;
			onMapSingleClick{
				hint "Erstelle Heli";
				[position player,_pos,50,"FULL","C_Heli_Light_01_civil_F","CIV"] execVM format['rhm\flybyin.sqf'];
				openMap false;
				onMapSingleClick {nil};
			};
		};
		case (80):
		{
			execVM "rhm\arsenal.sqf"
		};
		case (81):
		{
			execVM "rhm\mark.sqf"
		}; */
		case 86:
		{
			if (vehicle player != player) then {
				vehicle player setVelocity [0,0,((velocity (vehicle player) select 2) /2)+1];
			};
		};
		case 87:
		{
			if (local vehicle player) then {
				execVM "rhm\release.sqf";
			} else {
				[[[],"rhm\release.sqf"],"BIS_fnc_execVM",driver vehicle player] call BIS_fnc_MP;
			};
		};
		case 207:
		{
			// execVM format['rhm\wantedadd.sqf'];
		};
		case 210:
		{
			// execVM format['rhm\carfuel.sqf'];
		};
		case 211:
		{
			execVM format['rhm\console.sqf'];
		};
	};
};