rhm_rundistance   = 0;
rhm_drivedistance = 0;
rhm_flydistance   = 0;

while {true} do
{
    rhm_weg1 = false;
    rhm_weg2 = false;
    if (isNil "rhm_Wegmarker11") then
    {
        rhm_Wegmarker11 = createMarkerLocal ["rhm_Wegmarker1",getPos player];
        rhm_weg2 = true;
    }
    else
    {
        rhm_Wegmarker12 = createMarkerLocal ["rhm_Wegmarker2",getPos player];
        rhm_weg1 = true;
    };
    if (!isNil "rhm_Wegmarker11" && !isNil "rhm_Wegmarker12") then
    {
        if (((vehicle player) isKindOf "Car") && (vehicle player) != player) then
        {
            _meter = round(getMarkerPos "rhm_Wegmarker1" distance getMarkerPos"rhm_Wegmarker2");
            rhm_drivedistance = rhm_drivedistance + _meter;
        };
            
        if (((vehicle player) isKindOf "Air") && (vehicle player) != player) then
        {
            _meter = round(getMarkerPos "rhm_Wegmarker1" distance getMarkerPos"rhm_Wegmarker2");
            rhm_flydistance = rhm_flydistance + _meter;
        };
            
        if !((vehicle player) != player) then
        {
            _meter = round(getMarkerPos "rhm_Wegmarker1" distance getMarkerPos"rhm_Wegmarker2");
            rhm_rundistance = rhm_rundistance + _meter;
        };
    };
    if (rhm_weg1 && !isNil "rhm_Wegmarker11") then {deleteMarkerLocal "rhm_Wegmarker1";rhm_Wegmarker11 = nil;};
    
    if (rhm_weg2 && !isNil "rhm_Wegmarker12") then {deleteMarkerLocal "rhm_Wegmarker2";rhm_Wegmarker12 = nil;};
    
    uiSleep 0.5;
};

