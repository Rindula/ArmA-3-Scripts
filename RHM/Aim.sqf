_target = cursorTarget;
hint format["%1",_target];

if (isNil "aim") then {aim = false};
aim = !aim;


if (aim) then {
	hint "Aimbot An";
	while {!aim} do {

		_pos1 = position player;
		_pos2 = position _target;
		
		_ret = ((_pos2 select 0) - (_pos1 select 0)) atan2 ((_pos2 select 1) - (_pos1 select 1));
		if (_ret < 0) then {_ret = _ret + 360}; //remove negative value
		_ret = _ret % 360; //ensure return is 0-360

		player setDir _ret;
	};
} else {
	hint "Aimbot Aus";
}