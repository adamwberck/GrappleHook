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
    if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax * 0.33, gravSlide);
    } else {
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
    }
}

script_execute(state,tempSkid,tempVxMax,tempAccel);



///Death?


if(hp<=0)
    instance_destroy();

