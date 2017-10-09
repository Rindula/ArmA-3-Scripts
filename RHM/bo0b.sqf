hint "Open the Map and Select the Map Position u want to bomb";
_sCode = 'hint "Bombs in comming, RUN!";';
_sCode = _sCode + 'cpbLoops = 20;';
_sCode = _sCode + 'cpLoopsDelay = 0.1;';
_sCode = _sCode + 'for "_i" from 0 to cpbLoops do {';
_sCode = _sCode + '"Bo_Mk82" createvehicle ([(cTargetPos select 0) - 50 + random 100, (cTargetPos select 1) - 50 + random 100, 50]);';
_sCode = _sCode + 'uiSleep cpLoopsDelay;};';
_sCode = _sCode + 'cTargetPos = nil;cpbLoops = nil;cpLoopsDelay = nil;';

onMapSingleClick "cTargetPos = _pos;[] spawn compile sCode; onMapSingleClick '';true;";