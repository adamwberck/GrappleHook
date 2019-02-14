/// @description Record or play
// You can write your code in this editor
if(global.isPlaying){
	global.time--;
	global.time = max(global.time,0);
}
else if(global.isRecording && !global.paused && !global.freeze){
	global.time++
}

if(global.time<=3){
	global.isPlaying=false
	global.isRecording=true
}