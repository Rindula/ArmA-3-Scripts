private["_markers","_units"];
_markers = [];
_units = [];
disableSerialization;
while {true} do {
if(visibleMap && esp) then {
    {
        if((player != _x)) then {
            _units set[count _units,_x];
        }
    } forEach allUnits;
    
    //Create markers
    {
        _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_mcolor = switch (side _x) do {
			case west : {"ColorWEST"};
			case east : {"ColorEAST"};
			case independent : {"ColorGUER"};
			case civilian : {"ColorCIV"};
			default {"ColorUnknown"};
		};
        _marker setMarkerColorLocal _mcolor;
        _marker setMarkerTypeLocal "mil_triangle";
        _marker setMarkerTextLocal format["||Group locator|| %1", name _x];
        _marker_dot = createMarkerLocal [format["%1_marker_dot",_x],visiblePosition _x];
        _marker_dot setMarkerColorLocal "ColorBlack";
        _marker_dot setMarkerTypeLocal "mil_dot";
    
        _markers set[count _markers,[_marker,_x,_marker_dot]];
    } foreach _units;

    while {visibleMap} do
    {
        {
            private["_marker","_unit","_dot"];
            _marker = _x select 0;
            _unit = _x select 1;
			_dot = _x select 2;
			_control = (findDisplay 12) displayCtrl 51; //Arma 3
			_scale = ctrlMapScale _control; //returns number from 1 to 0.001
			_scale = _scale * 10;
            if(!isNil "_unit") then
            {
                if(!isNull _unit) then
                {
                    _marker setMarkerPosLocal (position _unit);
					_dot setMarkerPosLocal [(position _unit select 0)-(sin (direction _unit)*_scale),(position _unit select 1)-(cos (direction _unit)*_scale),0];
                };
				if (vehicle _unit != _unit) then {
					_marker setMarkerTextLocal format["||ESP|| %1 || Fahrzeug: %2", name _unit, getText(configfile >> "CfgVehicles" >> typeOf (vehicle _unit) >> "displayName")];
				} else {
					_marker setMarkerTextLocal format["||ESP|| %1", name _unit];
				};
				_marker setMarkerDirLocal (direction _unit);
            };
        } foreach _markers;
        if(!visibleMap) exitWith {};
        uiSleep 0.02;
    };

    {deleteMarkerLocal (_x select 0);} foreach _markers;
    {deleteMarkerLocal (_x select 2);} foreach _markers;
    _markers = [];
    _units = [];
};
uiSleep(0.1);
};