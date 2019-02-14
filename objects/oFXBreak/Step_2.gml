/// @description Movement 
// Handle sub-pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

//verticle movement
repeat(abs(vyNew)) {
    y += sign(vy);
}

//x movement as well as handling slopes
repeat(abs(vxNew)) {
    x += sign(vx);
}

// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0){
    instance_destroy();
}

