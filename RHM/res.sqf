private["_unit"];
			_unit = cursorTarget;
			player setVariable["restrained",false,true];//unrestrain you
			if(isNull _unit) exitWith {}; //Not valid
			
			//if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
			if(!isPlayer _unit) exitWith {}; //Not a human
			if(_unit getVariable "restrained") exitWith 
			{
				if(isNull _unit) exitWith {}; //Not valid
				_unit setVariable["restrained",false,true];
			};
			_unit setVariable["restrained",true,true];
			[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
			[[0,format["%1 was restrained by an Admin", name _unit, name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;