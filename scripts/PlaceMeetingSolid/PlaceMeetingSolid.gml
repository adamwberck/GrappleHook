/// @description PlaceMeetingSolid(x,y,or/and 0/1)
/// @function PlaceMeetingSolid
/// @param x
/// @param y
/// @param or/and 0/1
var xTemp = argument0;
var yTemp = argument1;
var andOr = argument2;
if(andOr = 0){
    return place_meeting(xTemp,yTemp,oParSolid) || place_meeting(xTemp,yTemp,oBrick);
} else{
    return place_meeting(xTemp,yTemp,oParSolid) && place_meeting(xTemp,yTemp,oBrick);
}
