/// @description sprite
if(state==scLeft){
	facing = -1;
    image_xscale=facing;
}
else{
	facing = 1;
    image_xscale=facing;
}

draw_self();

