/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

///Animation

var onGroundPrev = onGround;

event_inherited();

// Landing after jump
if (onGround && !onGroundPrev) {
    // Squash + stretch
    xscale = 1.5;
    yscale = 0.5;
    
    // Dust particles
    for (var i = 0; i < 4; i++)
        instance_create(random_range(bbox_left, bbox_right), bbox_bottom, oFxDust);
}

