/// @description Make Shell
if(hp>-9){
    var shell = instance_create(x-8,y+6,oShell);
    if(flip){
        with(shell){
            sprite_index = sShellF;
            vy-=3;
        }
    }
}else{
    event_inherited();
}

