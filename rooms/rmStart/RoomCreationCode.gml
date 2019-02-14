var nextRoom=room+1;
if(global.room_debug==nextRoom){
    var i=0;
    while(room_exists(i)){
        var roomName = room_get_name(i)
        if(roomName == "rmEnd"){
            room_goto(i-1);
            break;
        }else{
            i++;
        }
    }
}else{
room_goto_next()
}