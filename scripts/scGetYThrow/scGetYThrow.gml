/// @description scGetYThrow(facing)
/// @function scGetYThrow
/// @param facing
var facing = argument0;
var ymax = 16;
//for throwing on a slope


return 0;


if(facing==1){
    for(var i=0;i<ymax;i++){
        if(!position_meeting(bbox_right+1,bbox_bottom-i,oParSolid)){
            if(i==0) return 0;
            return i+16;
        }
    }
}else{
    for(var i=0;i<ymax;i++){
        if(!position_meeting(bbox_left-1,bbox_bottom-i,oParSolid)){
            if(i==0) return 0;
            return i+16;
        }
    }    
}
return 0;

/*
if(facing==1){
    for(var i=0;i<ymax;i++){
        if(!place_meeting(bbox_right+12,y-i,oParSolid)){
            return i;
        }
    }
}else{
    for(var i=0;i<ymax;i++){
        if(!place_meeting(bbox_left-24,y-i,oParSolid)){
            return i;
        }
    }    
}
return 0;
