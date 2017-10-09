[{

    _vehi  = vehicle player;
    _vel   = velocity _vehi;
    _dir   = direction _vehi;
    _speed = 5;
    _vehi setVelocity [ (_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2 )];
    
},"BIS_fnc_Spawn",driver vehicle player] call BIS_fnc_MP;