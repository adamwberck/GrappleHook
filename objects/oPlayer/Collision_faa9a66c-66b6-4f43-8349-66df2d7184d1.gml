/// @description Super Player
if(oPlayerStats.hp<2){
    oPlayerStats.hp=2;
    oGame.alarm[1] = 30;
    global.freeze = true;
    scPlayerSize();
}

with(other) instance_destroy();

