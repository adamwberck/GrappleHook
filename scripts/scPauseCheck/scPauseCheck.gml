image_speed = AnimationSpeed;
if(global.paused == true){
    for(var i = 0; i <= 11; i++){
        if(alarm[i] > 0) alarm[i]++;
    }
    image_speed = 0;
    return true;
} else {
    image_speed = AnimationSpeed;
    return false;
}
