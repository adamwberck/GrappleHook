/// @description Insert description here
// You can write your code in this editor
with(oPlayerStats) {
	if(hp<2){
	    ///Super Player
	    hp=2;
	    oGame.alarm[1] = 30;
	    global.freeze = true;
	    //scPlayerSize();
	} else if(hp>1 && powerUp != Powers.time){
	    hp=3;
	    powerUp = Powers.time;
	    oGame.alarm[1] = 30;
	    global.freeze = true;
		global.isRecording = true;
	    //scPlayerSize();
	
		//create trail
	}
}
with(other) instance_destroy();