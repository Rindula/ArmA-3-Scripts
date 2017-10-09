switch (_this) do {
	case "day": {
		[{
			systemChat "Wechsle zu Tagzeit";
			skiptime (6-daytime);
		},"BIS_fnc_Spawn"] call BIS_fnc_MP;
	};
	case "night": {
		[{
			systemChat "Wechsle zu Nachtzeit";
			skiptime (21-daytime);
		},"BIS_fnc_Spawn"] call BIS_fnc_MP;
	};
	default {systemChat "Falsches Argument!"};
};