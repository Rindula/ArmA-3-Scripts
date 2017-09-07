life_cash = life_cash + 1000000; 
hint parsetext format["<t size='3' color='#00ff00'>Du hast das Geld erfogreich bekommen.<br /></t><br /><t size='2' color='#f0f000'>Betrag:<br />$%1</t>", 1000000];
uiSleep 5;
hint parsetext format["<t size='1.5' color='#00fff0'>Hab spaß damit<br />%1...<br /><br />Deine Playerid:<br />%2</t>", profileName, getPlayerUID player];