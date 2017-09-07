private["_ziel","_such","_kx","_ky"];
disableSerialization;
_ziel = _this select 0;
_such = _ziel select [0,3];

if(isNil "located") then {located= false;};

_return = switch (toLower(_ziel)) do
{
	case "dp 1": {getMarkerPos "dp_1";};
	case "dp 2": {getMarkerPos "dp_2";};
	case "dp 3": {getMarkerPos "dp_3";};
	case "dp 4": {getMarkerPos "dp_4";};
	case "dp 5": {getMarkerPos "dp_5";};
	case "dp 6": {getMarkerPos "dp_6";};
	case "dp 7": {getMarkerPos "dp_7";};
	case "dp 8": {getMarkerPos "dp_8";};
	case "dp 9": {getMarkerPos "dp_9";};
	case "dp 10": {getMarkerPos "dp_10";};
	case "dp 11": {getMarkerPos "dp_11";};
	case "dp 12": {getMarkerPos "dp_12";};
	case "dp 13": {getMarkerPos "dp_13";};
	case "dp 14": {getMarkerPos "dp_14";};
	case "dp 15": {getMarkerPos "dp_15";};
	case "dp 16": {getMarkerPos "dp_16";};
	case "dp 17": {getMarkerPos "dp_17";};
	case "dp 18": {getMarkerPos "dp_18";};
	case "dp 19": {getMarkerPos "dp_19";};
	case "dp 20": {getMarkerPos "dp_20";};
	case "dp 21": {getMarkerPos "dp_21";};
	case "dp 22": {getMarkerPos "dp_22";};
	case "dp 23": {getMarkerPos "dp_23";};
	case "dp 24": {getMarkerPos "dp_24";};
	case "dp 25": {getMarkerPos "dp_25";};
	case "kavala": {[3600,13100,0]};
	case "neri": {[4100,11700,0]};
	case "panochori": {[5100,11200,0]};
	case "aggelochori": {[3700,13700,0]};
	case "negades": {[4900,16100,0]};
	case "agios Konstantinos": {[3900,17300,0]};
	case "oreokastro": {[4600,21400,0]};
	case "edessa": {[7200,11000,0]};
	case "topolia": {[7400,15400,0]};
	case "kore": {[7100,16400,0]};
	case "syrta": {[8600,18300,0]};
	case "agios Dionysios": {[9300,15900,0]};
	case "zaros": {[9100,12000,0]};
	case "abdera": {[9500,20300,0]};
	case "galati": {[10300,19000,0]};
	case "orino": {[10400,17200,0]};
	case "therisa": {[10600,12200,0]};
	case "poliakko": {[11000,13400,0]};
	case "alikampos": {[11100,14500,0]};
	case "katalaki": {[11700,13700,0]};
	case "neochori": {[12500,14300,0]};
	case "lakka": {[12300,15700,0]};
	case "koroni": {[11800,18400,0]};
	case "ifestiona": {[12800,19700,0]};
	case "stavros": {[13000,15000,0]};
	case "athira": {[14000,18700,0]};
	case "frini": {[14600,20800,0]};
	case "gravia": {[14500,17600,0]};
	case "sagonisi": {[14300,13500,0]};
	case "agia Triada": {[16700,20500,0]};
	case "telos": {[16300,17300,0]};
	case "anthrakia": {[16600,16100,0]};
	case "pyrgos": {[16800,12600,0]};
	case "ekali": {[17100,10000,0]};
	case "kalithea": {[17800,18100,0]};
	case "charkia": {[18100,15200,0]};
	case "rodopoli": {[18800,16600,0]};
	case "agios Petros": {[19300,17500,0]};
	case "nifi": {[19500,15400,0]};
	case "dorida": {[19400,13200,0]};
	case "chalkeia": {[20200,11700,0]};
	case "panagia": {[20500,8900,0]};
	case "selakano": {[20800,6600,0]};
	case "feres": {[21700,7600,0]};
	case "paros": {[20900,16900,0]};
	case "kalochori": {[21400,16400,0]};
	case "ioannina": {[23200,20000,0]};
	case "delfinaki": {[23900,20200,0]};
	case "sofia": {[25700,21400,0]};
	case "molos": {[27000,23200,0]};
	default {located = false;};
};

if (_such == "000") then 
{
	_return = [50,((_ky*100)+50),0];
};
if (located) then {
	located_coord = _return;
} else {
	hint format["Fehler: Stadt oder Position %1 nicht gefunden!",'"'+toUpper(_ziel)+'"'];
}