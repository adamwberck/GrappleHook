/// @description Handle slopes and death
inSlope = (place_meeting(x,y,oSlope23)|| place_meeting(x,y,oSlope45));
oldy = y;
flag = false;
while(inSlope){
    flag=true;
    inSlope = (place_meeting(x,y,oSlope23)|| place_meeting(x,y,oSlope45));
    y--;
}
if(flag){
    diff = oldy-y;
}
//Crushed
if(place_meeting(x,y,oParSolid)){
    scEnDamage(10,other.vx,other.vy);
}

///inherit
event_inherited();

