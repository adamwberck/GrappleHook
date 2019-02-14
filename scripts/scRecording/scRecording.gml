if(global.isRecording){
	var i=0;
	tArray[global.time,i++] = x;
	tArray[global.time,i++] = y;
	tArray[global.time,i++] = vx;
	tArray[global.time,i++] = vy;
	tArray[global.time,i++] = facing;
	tArray[global.time,i++] = image_alpha;
	if(self.object_index==oPlayer){
		tArray[global.time,i++] = oPlayerStats.hp;
	}
	else{
		tArray[global.time,i++] = hp;
	}
}
else if(global.isPlaying){
	var i=0;
	var arrH = array_height_2d(tArray);
	if(arrH<=1){
		global.isPlaying = false;
		global.isRecording = false;
		vx=0;
		vy=0;
		return true;
	}
	global.time=min(arrH-1,global.time);
	x  =     tArray[global.time,i++];
	y  =     tArray[global.time,i++];
	vx =	 tArray[global.time,i++];
	vy =	 tArray[global.time,i++];
	facing = tArray[global.time,i++];
	image_alpha = tArray[global.time,i++];
	if(self.object_index==oPlayer){
		tArray[global.time,i++] = oPlayerStats.hp;
	}
	else{
		tArray[global.time,i++] = hp;
	}
	return true;
}
var maxReverse = max(3,global.time-180);
if(global.time<maxReverse&&oPlayer.kAction&&oPlayerStats.powerUp==oPlayerStats.Powers.time){
	global.isPlaying = false;
	global.isRecording = false;
	vx=0;
	vy=0;
	return true;
}
return false;