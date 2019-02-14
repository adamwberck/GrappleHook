/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

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
            if(sprite_index==sShellF){
                sprite_index=sShell;
            } else{
                sprite_index=sShellF;   
            }
        }
    }
    else state=scStatic;
}

if(hp<=-3){
    instance_destroy()
}

///main movement
// Apply the correct form of acceleration and friction
var tempAccel, tempFric, tempSkid, tempVxMax;

tempAccel = groundAccel;
tempFric  = groundFric;
tempSkid  = groundSkid;

tempVxMax = vxMax;



// Handle gravity
if (!onGround) {
    // Fall normally
    vy = Approach(vy, vyMax, gravNorm);
}

script_execute(state,tempSkid,tempVxMax,tempAccel);

if(state!=scStatic) alarm[0]=60*13;


