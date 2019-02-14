global.freeze =false;
global.paused =false;
global.room_debug=0;

//time
global.isRecording = false;
global.isPlaying = false;
global.startTime = 0;
global.time = 1;


var i=0;
while(room_exists(i)){
    var roomName = room_get_name(i)
    if(roomName == "rmStart"){
        room_goto(i);
        break;
    }else{
        i++;
    }
}