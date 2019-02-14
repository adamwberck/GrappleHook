/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;


if(global.isRecording){
	tArray[global.time,0]= x;
	tArray[global.time,1]= y;
	tArray[global.time,2]= vx;
	tArray[global.time,3]= vy;
}
if(global.isPlaying){
	x  = tArray[global.time,0];
	y  = tArray[global.time,1];
	vx = tArray[global.time,2];
	vy = tArray[global.time,3];
	exit;
}

///Movement with collision
// Handle sub-pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

jumped = false;
landed = false;

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
        r = 10;
        repeat(20){
            if (!place_meeting(x+q,y+r,oParSolid) && !place_meeting(x+q,y+r,oBrick)){
            //only move if place is free
                if (r <= 0 || place_meeting(x,y+1,oParSolid)||place_meeting(x,y+1,oBrick)){
                //if onground or slope goes up moves
                    x += q;
                    y += r;
                    w += 1;
                    e -= r;
                    moved = true;
                    break;
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

