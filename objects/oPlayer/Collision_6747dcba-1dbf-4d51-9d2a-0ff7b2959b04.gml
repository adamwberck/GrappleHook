/// @description Clover Power
with(oPlayerStats) {
	if(hp<2){
	    ///Super Player
	    hp=2;
	    oGame.alarm[1] = 30;
	    global.freeze = true;
	    //scPlayerSize();
	} else if(hp>1 && powerUp != Powers.wallJump){
	    hp=3;
	    powerUp = Powers.wallJump;
	    oGame.alarm[1] = 30;
	    global.freeze = true;
	    //scPlayerSize();
	
		//create trail
		oPlayer.trail = ds_list_create();
	}
}
with(other) instance_destroy();
