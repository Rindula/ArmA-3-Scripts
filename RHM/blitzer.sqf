private ["_speed","_vehicle"];
_vehicle = cursorTarget;
_speed   = round (speed _vehicle);

if (_vehicle isKindOf "Car") then {
    switch (true) do 
    {
        case ((_speed > -80 && _speed <= 80)) : 
        {    
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#33CC33'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round  _speed];
        };
        
        case ((_speed > 80)) : 
        {    
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round  _speed];
        };
    };
};