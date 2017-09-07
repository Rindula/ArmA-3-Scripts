_amount = _this select 0;
_type = _this select 1;

switch (_type) do {
    case "AL": {
        life_cash =  life_cash + _amount;
    };
    case "WL": {
        player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _amount, true];
    };
    default {
        systemChat "Falscher Fehler! Bitte melde diesen Fehler Rindula!";
        systemChat "[Geldmenü Variablenübergabe]";
    };
}