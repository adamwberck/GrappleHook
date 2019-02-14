/// @description Hit check

var above = place_meeting(x,y+1,oParEnemy)&& !place_meeting(x,y,oParEnemy);
var falling = vy>0;
var slidehit=false;
if(above && falling){
    if(!place_meeting(x,yprevious, oParSolid)){
        y=yprevious;
    }
    vy = -(vxAbs/8 + 3 + 13/16);
    with(other){
        scEnDamage(1,other.vx,other.vy);
    }
    return true;
} else if(vx!=0 && action==SLIDE ){
    with(other){
        if(OnGround()) scEnDamage(10,other.vx,other.vy);
        else slidehit=true;
    }
} else if(other.dangerous){
    scPlDamage(1);
}


if(slidehit)
    scPlDamage(1);   


