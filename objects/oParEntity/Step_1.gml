/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

///onground and cling
if(vx!=0){
    prevVx=vx;
}

onGround = OnGround();

cLeft  = place_meeting(x - 1, y, oBlock); 
cRight = place_meeting(x + 1, y, oBlock);

if (cLeft) 
    wallTarget = instance_place(x - 1, y, oBlock);

if (cRight) 
    wallTarget = instance_place(x + 1, y, oBlock);


