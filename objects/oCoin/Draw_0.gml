image_speed=1/20;
if (distance_to_object(oPlayer)<= 20){
    sprite_index = sSuperHappyCoin;
}
else if (distance_to_object(oPlayer)<= 40){
    sprite_index = sHappyCoin;
}   else sprite_index = sSadCoin;
draw_self();

///Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

