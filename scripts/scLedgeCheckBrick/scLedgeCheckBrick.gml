/// @description scLedgeCheck(facing)
/// @function scLedgeCheck
/// @param facing
var facing = argument0;
if(facing==-1){//left
    for(var c=1;c<=2;c++)
    {
        for(var r=0;r<=17;r++){
            if(!position_meeting(bbox_left-c,bbox_bottom+r,oBrick) && OnGround()){
                ledge = true;
            }else{
                ledge = false;
                r=99;
                return ledge;
            }
        }
    }
}
else if(facing==1){//right
    for(var c=1;c<=2;c++)
    {
        for(var r=0;r<=17;r++){
            if(!position_meeting(bbox_right+c,bbox_bottom+r,oBrick) && OnGround()){
                ledge = true;
            }else{
                ledge = false;
                r=99;
                return ledge;
            }
        }
    }
}
return ledge;
