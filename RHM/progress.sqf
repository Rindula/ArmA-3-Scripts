#include progress.hpp

disableSerialization;
private["_ui","_progress"];
5 cutRsc ["rhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "rhm_progress";
_progress = _ui displayCtrl 38201;

_progress progressSetPosition 0.5;
