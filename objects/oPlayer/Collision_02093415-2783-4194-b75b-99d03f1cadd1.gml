/// @description Insert description here
// You can write your code in this editor
/// @description Cherry Power
with(oPlayerStats){
	if(hp<2){
	    ///Super Player
	    hp=2;
	    oGame.alarm[1] = 30;
	    global.freeze = true;
	    //scPlayerSize();
	} else if(hp>1 && powerUp != Powers.screenWrap){
	    hp=3;
	    powerUp = Powers.screenWrap;
	    oGame.alarm[1] = 30;
	    global.freeze = true;
	    //scPlayerSize();
	}
}
with(other) instance_destroy();

