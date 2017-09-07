addedLicenses = [];
licenseForm = "";
{
	if not (missionNamespace getVariable (_x select 0)) then {
		missionNamespace setVariable[(_x select 0),true];
		addedLicenses set [count addedLicenses,[_x select 0,_x select 1]];
	};
} foreach life_licenses;

{
	_side = switch (_x select 1) do {
		case "civ": {
			"Zivilist"
		};
		case "cop": {
			"Polizist"
		};
		case "med": {
			"Medic"
		};
		default {
			"Unbekannt"
		};
	};
	
	_sideC = switch (_x select 1) do {
		case "civ": {
			"#8D3795"
		};
		case "cop": {
			"#1A44F9"
		};
		case "med": {
			"#53FD13"
		};
		default {
			"#99FFFFFF"
		};
	};
	licenseForm = licenseForm + format["<t color='%3' size='1.2'>%1 (%2)<br />",[_x select 0] call life_fnc_varToStr,_side,_sideC];
} forEach addedLicenses;
if (licenseForm == "") then {
	licenseForm = "Keine neuen Lizenzen hinzugefügt.";
};
hint parseText format["<t size='2' color='#CBC001' underline='true' shadow='true'shadowColor='#ff0000'>Neue Lizenzen:</t><br /><br />%1",licenseForm];
addedLicenses = nil;
licenseForm = nil;