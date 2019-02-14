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
    vy = Approach(vy, vyMax, gravNorm);
}

script_execute(state,tempSkid,tempVxMax,tempAccel);

if(state!=scStatic) alarm[0]=60*13;


///Hit check
if(hp<0&&hp>=-3)
    hp=1;


if(hp==0){
    hp=1;
    if(state==scStatic){
        if(!flip){
            if(oPlayer.x<=x){
                state=scRight;
                moved=true;
            }
            else {
                state=scLeft;
                moved=true;
            }
        }else{
            flip =false;
            vy -=3;
            if(sprite_index==sShellRF){
                sprite_index=sShellR;
            } else{
                sprite_index=sShellRF;
            }            
        }
    }
    else state=scStatic;
}

if(hp<=-3){
    instance_destroy()
}

