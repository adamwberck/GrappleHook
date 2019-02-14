/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

///main movement
// Apply the correct form of acceleration and friction
var tempAccel, tempFric, tempSkid, tempVxMax;

if (onGround) {  
    tempAccel = groundAccel;
    tempFric  = groundFric;
    tempSkid  = groundSkid;
    if (slope < 0) tempAccel  = dSlopeAccel+slope/16; 
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
    tempSkid  = groundSkid;
}


tempVxMax = vxMax;



// Handle gravity
if (!onGround) {
    // Fall normally
    vy = Approach(vy, vyMax, gravNorm);
}

script_execute(state,tempSkid,tempVxMax,tempAccel);




///Check if in block
if(place_meeting(x,y,oParSolid)||place_meeting(x,y,oBrick)){
    instance_destroy();
}

/// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0){
    instance_destroy();
}

