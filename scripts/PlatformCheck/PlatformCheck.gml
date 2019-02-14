/// @description  PlatformCheck();
/// @function  PlatformCheck

var collision = instance_place(x, y + sign(vy), oParSolid);

if (collision) {
    if (vy >= 0) {
        platformTarget = collision;
    } else {
        // Platform above
        vy=0;
    }
    return true;
}

//BRICK
if(vy<0 && place_meeting(x, y + sign(vy), oBrick)){
    var brickmove = false;
    while(place_meeting(x, y + sign(vy), oBrick)){
        var brick = instance_place(x, y + sign(vy), oBrick);
        with(brick) {
            hit=true;
            if(!(y<(orginY-8))){
                if(place_meeting(x,y+sign(other.vy),oParEnemy)){
                    var en = instance_place(x,y+sign(other.vy),oParEnemy);
                    with(en){
                        y-=8;
                        scEnDamageBlock(1,0,-1);
                    }
                }
                y+=(sign(other.vy));
                brickmove = true;
            }else{
                other.vy=0;
            }
        }
    }
    if(brickmove){
    return false;
    }
}

if (vy < 0) {
    platformTarget = 0;
}

if (instance_exists(platformTarget)) {
    if (platformTarget) {
        if (place_meeting(x, y + 1, platformTarget) && !place_meeting(x, y, platformTarget)) {
            //Platform below
            vy = 0;
            return true;
        } else
            platformTarget = 0;
    }
} else
    platformTarget = 0;
    
if (vy > 0) {
    with (oParEntity) {
        {
            if (place_meeting(x, y - 1, other) && !place_meeting(x, y, other)) {
                vy = 0;
            }
        }
    }
    
    with (oParJumpThru) {
        if (place_meeting(x, y - 1, other) && !place_meeting(x, y, other)) {
            // Land
            vy = 0;
            other.platformTarget = id;
            return true;
        }
    }
    
    with (oBrick) {
        if (place_meeting(x, y - 1, other)) {
            // Land
            vy = 0;
            other.platformTarget = id;
            return true;
        }
    }
}

platformTarget = 0;
return false;
