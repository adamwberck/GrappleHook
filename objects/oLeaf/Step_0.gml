/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

///Main Movement
// Apply the correct form of acceleration and friction
var tempAccel, tempFric, tempSkid, tempVxMax;

tempAccel = airAccel;
tempFric  = airFric;
tempSkid  = groundSkid;

tempVxMax = vxMax;



// Handle gravity
// Fall normally
vy = Approach(vy, vyMax, gravNorm);

if(x>orginX+32){
    state= scLeft;
    vy=0; vx=0;
    image_angle=150
}else if(x<=orginX){
    state= scRight;
    vy=0; vx=0;
    image_angle=30
}


moved=true;
script_execute(state,tempSkid,tempVxMax,tempAccel);




/// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0){
    instance_destroy();
}

