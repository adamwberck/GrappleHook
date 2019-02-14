/// @description scLeft(tempSkid,tempVxMax,tempAccel)
/// @function scLeft
/// @param tempSkid
/// @param tempVxMax
/// @param tempAccel
facing = -1;

var tempSkid  = argument0;
var tempVxMax = argument1;
var tempAccel = argument2;
       
// Apply acceleration Left
if (vx > 0){
    vx = Approach(vx, 0, tempSkid);   
}else {
    vx = Approach(vx, -tempVxMax, tempAccel);
}

if(ledgeTurnAround)
    ledgeOnLeft = scLedgeCheck(facing);
else
    ledgeOnLeft = false;

if(!moved || ledgeOnLeft){
   state=scRight;
   vx=abs(tempVxMax);
}

dangerous=true;
