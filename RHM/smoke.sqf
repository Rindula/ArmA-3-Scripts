emitterrun = true;
emitter set [count emitter,{"#particlesource" createVehicle (getPos player);}];
emitter setParticleClass "MediumSmoke";
while {emitterrun} do {{_x setPos (player modelToWorld [0,0,1]);}forEach emitter};
{deleteVehicle _x;} forEach emitter;
emitter = [];