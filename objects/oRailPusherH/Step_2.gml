var vxNew, vyNew;

// Handle sub-pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

repeat(abs(vxNew)) {
    if (place_meeting(x + (sign(vxNew) * sprite_width), y, oParRail)) {
        with (oParEntity) {
            //make oParEntity check if this object(oRailMover) is right next to it and moves out of the way
            if (place_meeting(x - sign(vxNew), y, other.id)){
                x += sign(vxNew);
                prevNextTo = true;
            } else if (prevNextTo){
                vx += vxNew;
                prevNextTo = false;
                }
                
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
    else {
        // Squash + Stretch
        xscale = 0.67;
        yscale = 1.34;
        
        with (oParEntity) if (prevNextTo){
            vx += vxNew ;
            prevNextTo = false;
        }
           
        vx *= -1;
        break;
    }
}

/// Procedural Animation

xscale = Approach(xscale, 1, 0.1);
yscale = Approach(yscale, 1, 0.1);

