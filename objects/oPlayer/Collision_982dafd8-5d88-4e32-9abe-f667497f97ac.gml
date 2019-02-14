/// @description Leaf Power
if(oPlayerStats.hp<2){
    ///Super Player
    oPlayerStats.hp=2;
    oGame.alarm[1] = 30;
    global.freeze = true;
    scPlayerSize();
} else if(oPlayerStats.hp>1 && oPlayerStats.powerUp != oPlayerStats.Powers.glide){
    oPlayerStats.hp=3;
    oPlayerStats.powerUp = oPlayerStats.Powers.glide;
    oGame.alarm[1] = 30;
    global.freeze = true;
    scPlayerSize();
}

with(other) instance_destroy();

