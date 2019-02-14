/// @description Move towards mouse

var dir  = point_direction(x,y,mouse_x,mouse_y);
var spd  = 4;
var rate = .2;
var vxTemp = lengthdir_x(spd,dir);
var vyTemp = lengthdir_y(spd,dir);
var vxRate = lengthdir_x(rate,dir);
var vyRate = lengthdir_y(rate,dir);
vx = Approach(vx,vxTemp,rate);
vy = Approach(vy,vyTemp,rate);

if(abs(x-mouse_x)<3 &&abs(y-mouse_y)<3){
    vx=0;
    vy=0;
}

var vxNew, vyNew;

// Handle sub-pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

repeat (abs(vyNew)) {
    if (!place_meeting(x, y + sign(vyNew), oParSolid)) {
        with (oParEntity) {
            if (place_meeting(x, y + 1, other.id)) {
                if (!PlaceMeetingException(x, y + sign(vyNew), oParSolid, other.id))
                    y += sign(vyNew);
            }
            
            if (place_meeting(x, y - 1, other.id))
                y += sign(vyNew);
            
        }
        y += sign(vyNew);
    }
    else {
        vy = 0;
        break;
    }
}



repeat(abs(vxNew)) {
    if (!place_meeting(x+ sign(vxNew),y,oParSolid)) {
        with (oParEntity) {
            if (place_meeting(x - sign(vxNew), y, other.id))
                x += sign(vxNew);
                
            //if (place_meeting(x + sign(vxNew), y, other.id) && wallTarget == other.id)
            //    x += sign(vxNew);    
            
            if (platformTarget != other.id)
                continue;
                
            if (!platformTarget) {
                if (place_meeting(x, y + 1, other.id))
                    platformTarget = other.id;
            }
            
            if (!place_meeting(x + sign(vxNew), y, oParSolid) && platformTarget == other.id)
                x += sign(vxNew);
        }
        x += sign(vxNew);
    }
}

/// Procedural Animation
/*
xscale = Approach(xscale, 1, 0.1);
yscale = Approach(yscale, 1, 0.1);

/* */
/*  */
