/*
var q  = 1;
var slopeD = 0;
repeat(2){
    repeat(2){
        if (!place_meeting(x+q, y + 1, oParSolid)&&!place_meeting(x+q, y + 1, oParJumpThru)){
            slopeD = sign(q);
            break;
        }
        q *= 2
    }
    q = -1
}
return -slopeD;
*/

var isASlope = false;
var dfsfh = position_meeting(bbox_right+2,y-8,oParSolid);
var husfdifbs = position_meeting(bbox_right+2,y+8,oParSolid);
if(facing==1){
    if(position_meeting(bbox_right+2,y-8,oParSolid)
        &&position_meeting(bbox_right+2,y+8,oParSolid)){
            isASlope = false;
    }else{
        isASlope = true;
    }
}else{
    if(position_meeting(bbox_left-2,y-8,oParSolid)
        &&position_meeting(bbox_right-2,y+8,oParSolid)){
            isASlope = false;
    }else{
        isASlope = true;
    }
}
return isASlope;
