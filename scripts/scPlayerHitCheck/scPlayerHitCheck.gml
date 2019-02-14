/// @description Hit check
var enemy = 0;
var above = place_meeting(x,y+1,oParEnemy);
var falling = vy>0;
var slidehit=false;
var enemy = instance_place(x,y+1,oParEnemy)
var vxAbs = abs(vx);
if(above && falling && alarm[2]<40){//head stomp
    if(!place_meeting(x,yprevious, oParSolid)){//get player out of way
        y=yprevious;
    }
    vy = -(vxAbs/8 + 3 + 13/16);//player bounce
    with(enemy){
        scEnDamage(1,other.vx,other.vy);//damage enemy
    }
    return true;
} else if(action==SLIDE && vx!=0){
//if hit from above by enemy while sliding
    with(enemy){
        if(OnGround() && sign(x-other.x) == sign(other.vx)){
        //if enemy is on ground and the same direction player is moving
            scEnDamage(10,other.vx,other.vy);
        }
        else {
            slidehit=true;
        }
    }
} else if(place_meeting(x+q,y+r,oParEnemy)){
    var enemy = instance_place(x+q,y+r,oParEnemy);
    if(enemy.dangerous){
        scPlDamage(1);
    }
}


if(slidehit)
    scPlDamage(1);   
    
return false;
