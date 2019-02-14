/// @description Record
// You can write your code in this editor
if(!oPlayerStats.powerUp==Powers.time){
	global.isRecording = false;
}

if(global.freeze||global.paused||global.isPlaying){
	global.isRecording = false;
}