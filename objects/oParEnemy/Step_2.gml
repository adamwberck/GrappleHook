/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

///Movement with collision
// Handle sub-pixel movement

if(scRecording()){
	exit;
}


cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

jumped = false;
landed = false;

var isShell = object_get_name(object_index)==("oShell") 
    || object_get_name(object_index)==("oShellR");

//verticle movement
repeat(abs(vyNew)) {

    if (!PlatformCheck()){
        y += sign(vy);
    } else {
        vy = 0;
        onGround = true;
        break;
    }
}

if (platformTarget) {
    if (!onGround)
        landed = true;
    
    if (landed)
        with (platformTarget) other.vy = 0;
    else
        with (platformTarget) other.vy = 0;
}

//x movement as well as handling slopes
r=0;
q=0;
var shell;
repeat(abs(vxNew)) {
    //var w=0, e=0;
    moved = false;
    q = sign(vx);
    while (abs(q) < 2){
        r = 5;
        repeat(10){
            if (!place_meeting(x+q,y+r,oParSolid) && !place_meeting(x+q,y+r,oBrick)){
            //only move if place is free
                if (r <= 0 || place_meeting(x,y+1,oParSolid)||place_meeting(x,y+1,oBrick)){
                //if onground or slope goes up then MOVE
                    if(place_meeting(x+q,y+r,oPlayer)){
                        var player = instance_place(x+q,y+r,oPlayer){
                            with(player) {
                                scPlayerHitCheck();
                            }
                        }
                    }
                    x += q;
                    y += r;
                    w += 1;
                    e -= r;
                    moved = true;
                    break;
                } 
            }
            if(place_meeting(x+q,y,oBrick)&&isShell){
                var brick = instance_place(x+q,y,oBrick){
                    with(brick) {
                        sidehit = true;
                    }
                }
            } 
            r -= 1;
        }
    q += sign(vx);
    }
    if (!moved){
        vx = 0;
        break;
    }
}

if (w>=5) {
    slope = round(e/abs(w)*2)/2 ;
    w=0;
    e=0;
};

// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0){
    instance_destroy();
}

