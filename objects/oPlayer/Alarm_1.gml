/// @description Sprint

if (abs(vx) >= vxMax && (onGround || sprint == 7)){
    sprint = min(7,sprint + 1);
} else {
    sprint = max(0,sprint - 1);
}

/*
if(!onGround && !fly && oPlayerStats.powerUp=o && sprint==7){
    fly = true;
    alarm[6]=255;
}
*/

sprintTimer = false

