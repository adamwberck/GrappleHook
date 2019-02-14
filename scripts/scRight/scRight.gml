/// @description scRight(tempSkid,tempVxMax,tempAccel)
/// @function scRight
/// @param tempSkid
/// @param tempVxMax
/// @param tempAccel
facing = 1;

var tempSkid  = argument0;
var tempVxMax = argument1;
var tempAccel = argument2;
       
// Apply acceleration right
if (vx < 0){
    vx = Approach(vx, 0, tempSkid);   
}else {
    vx = Approach(vx, tempVxMax, tempAccel);
}

//turn around
if(ledgeTurnAround)
    ledgeOnRight = scLedgeCheck(facing);
else
    ledgeOnRight = false;
    
if(!moved || ledgeOnRight){
   state=scLeft;
   vx=abs(tempVxMax)*-1;
}

dangerous=true;
