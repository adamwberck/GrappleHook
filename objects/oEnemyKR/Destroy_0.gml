/// @description Make Shell
if(hp>-9){
    var shell = instance_create(x-8,y+6,oShellR);
    if(flip){
        with(shell){
            sprite_index = sShellRF;
            vy -= 3;
        }
    }
}else{
    event_inherited();
}

