/// @description  Movement
var prevAction = action;
// Input //////////////////////////////////////////////////////////////////////

var kLeft, kRight, kDown, kJump, kJumpRelease,kYtest;

kLeft         = keyboard_check(vk_left)           || gamepad_axis_value(0, gp_axislh) < -0.40 || keyboard_check(ord("A"));
kRight        = keyboard_check(vk_right)          || gamepad_axis_value(0, gp_axislh) >  0.40 || keyboard_check(ord("D"));
kUp           = keyboard_check(vk_up)             || gamepad_axis_value(0, gp_axislv) < -0.40;
kDown         = keyboard_check(vk_down)           || gamepad_axis_value(0, gp_axislv) >  0.75 || keyboard_check(ord("S"));
kDownPressed  = keyboard_check_pressed(vk_down)   || gamepad_axis_value(0, gp_axislv) >  0.75 || keyboard_check_pressed(ord("S")); 
kYtest        = keyboard_check_pressed(ord("Y"))  || false;

kJump         = keyboard_check_pressed(ord("C"))  || gamepad_button_check_pressed(0, gp_face1)  || keyboard_check_pressed(ord("W"));
kJumpRelease  = keyboard_check_released(ord("C")) || gamepad_button_check_released(0, gp_face1) || keyboard_check_released(ord("W"));
kJumpHeld     = keyboard_check(ord("C"))          || gamepad_button_check(0, gp_face1) || keyboard_check(ord("W"));

kAction        = keyboard_check(ord("X"))          || gamepad_button_check(0, gp_face2)			 || keyboard_check(vk_space);
kActionRelease = keyboard_check_released(ord("X")) || gamepad_button_check_released(0, gp_face2) || keyboard_check_released(vk_space);
kActionPress   = keyboard_check_pressed(ord("X"))  || gamepad_button_check_pressed(0, gp_face2)  || keyboard_check_pressed(vk_space);

kAction2       = keyboard_check(ord("Z"))          || gamepad_button_check(0, gp_face3)  || keyboard_check(vk_space);
kAction2Release= keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face3)  || keyboard_check_released(vk_space);
kAction2Press  = keyboard_check_pressed(ord("Z"))  || gamepad_button_check_pressed(0, gp_face3)  || keyboard_check_pressed(vk_space);

kHit           = keyboard_check_pressed(ord("Z"))  || gamepad_button_check_pressed(0, gp_face2);

// Movement ///////////////////////////////////////////////////////////////////

// Apply the correct form of acceleration and friction
var tempAccel, tempFric, tempSkid, tempVxMax;
if(!oGame.oldSchool)
	if (onGround) {  
	    tempAccel = groundAccel;
	    tempFric  = groundFric;
	    tempSkid  = groundSkid;
	    if (slope < 0) tempAccel  = dSlopeAccel+slope/16; 
	} else {
	    tempAccel = airAccel;
	    tempFric  = airFric;
	    tempSkid  = airSkid;
	}
else if(oGame.oldSchool){
	sprint = 0;
		if (onGround) {  
	    tempAccel = groundAccel;
	    tempFric  = groundSkid;
	    tempSkid  = groundFric;
	    if (slope < 0) tempAccel  = dSlopeAccel+slope/16; 
	} else {
	    tempAccel = airAccel;
	    tempFric  = airSkid;
	    tempSkid  = airFric;
	}
}
else if(false){
		sprint = 0;
	if (onGround) {  
	    tempAccel = 0.0556640625;
	    tempFric  = 0.05078125;
	    tempSkid  = 0.1015625;
	    //if (slope < 0) tempAccel  = dSlopeAccel+slope/16; 
	} else {
		if(vx>=1.5625){
			tempAccel = 0.0556640625;
			tempFric  = airFric;
			tempSkid  = 0.0556640625;
		}else{
			tempAccel = 0.037109375;
			tempFric  = airFric;
			tempSkid  = 0.05078125;
		}
	}	
}

if slope > 0{
    tempVxMax = vxMax-slope;
}else if (sprint == 7){
    tempVxMax = vxMaxSprint
} else {
    tempVxMax = vxMax
}

if(oGame.oldSchool){
	tempVxMax = 2.5625
}

if(walk) tempVxMax -= 1;

// Wall cling to avoid accidental push-off
if(oPlayerStats.powerUp = Powers.wallJump){
	cLeft    = place_meeting(x - 1, y, oParSolid);
	cRight   = place_meeting(x + 1, y, oParSolid);
    if ((!cRight && !cLeft) || onGround) {
        canStick = true;
        sticking = false;
    } else if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
        alarm[0] = clingTime;
        sticking = true; 
        canStick = false;       
    }
}
// Handle gravity
if (!onGround) {
    if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax * 0.33, gravSlide);
    } else {
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
    }
}

// Left 
if (kLeft && !kRight && !sticking) {
    facing = -1;
    
    // Apply acceleration left
    if (vx > 0) {
        vx = Approach(vx, 0, tempSkid);
        action = SKID;
    } else if (sprint < 7 ) {
		if(vx>-tempVxMax || onGround){
			vx = Approach(vx, -tempVxMax, tempAccel);
		}
        action  = RUN;
        if (vx <= -vxMax && !sprintTimer && onGround){
            alarm[1] = 8.0
            sprintTimer = true
        }
    } else {
        //Sprinting
		if(abs(vx)<abs(tempVxMax)||onGround){
			vx = Approach(vx, tempVxMax * sign(vx), tempAccel);
			action = SPRINT;
		}
    }

// Right
} else if (kRight && !kLeft && !sticking) {
    facing = 1;
       
    // Apply acceleration right
    if (vx < 0){
            vx = Approach(vx, 0, tempSkid);   
            action = SKID;
        } else if (sprint < 7){
			if(vx<tempVxMax || onGround){
				vx = Approach(vx, tempVxMax, tempAccel);
			}
            action  = RUN;
            if (vx >= vxMax && !sprintTimer && onGround){
               alarm[1] = 8.0
               sprintTimer = true;
            }
        } 
		else {
			//Sprinting
			if(abs(vx)<abs(tempVxMax)||onGround){
				vx = Approach(vx, tempVxMax * sign(vx), tempAccel);
				action = SPRINT;
			}
		}
}

//Slide
if(slopeD!=0){
    slopeDprev = slopeD;//for animation
}

var q  = 1;
slopeD = 0;
repeat(2){
    repeat(2){
        if (!place_meeting(x+q, y + 1, oParSolid)
            &&!place_meeting(x+q, y + 1, oParJumpThru)
            &&!place_meeting(x+q, y + 1, oBrick)){
                slopeD = sign(q);
                break;
        }
        q *= 2
    }
    q = -1
}

//Slide Down
if (kDownPressed && pickup==0){
    if (!slide) slide = true else slide = false
}

if (!onGround || kLeft || kRight){
    slide = false;
}

if (slide && slopeD!=0){
    action = DUCK;
    vx = Approach(vx,vxMaxSlide*slopeD,vxAccelSlide);
    //if (abs(vx) < 2) vx = slopeD*2;
    slideTime += abs(vx);
} else if(slide){
    scPlayerSize();
    action = SLIDE;
    slideTime += abs(vx);
    tempFric=tempFric/2;
    slopeD = sign(vx);
} else slideTime = 0;

//SprintTimer

if (!sprintTimer && sprint != 0) {
    alarm[1] = 24.0
    sprintTimer = true
}

// Friction
if ((!kRight && !kLeft)) {
    vx    = Approach(vx, 0, tempFric);
    if (!slide) action = IDLE;
}



// Wall jump


if (oPlayerStats.powerUp=oPlayerStats.Powers.wallJump){
	var spd = .9;
	if(kJump && (cLeft||cRight) && !onGround){
		airSkid=1/15;
	}
	
	if(onGround){
		airSkid=1/8;
	}
	
	if (kJump && cLeft && !onGround) {   
	    xscale = 0.5;
	    yscale = 1.5;
	    for (var i = 0; i < 4; i++){
	        instance_create(bbox_left, random_range(bbox_top, bbox_bottom), oFxDust);
		}
	// Wall jump is different when pushing off/towards the wall        
	    if (kLeft) {
	        vx = vxMax*spd;// * .75;
	        vy = -(3 + 11/16) * 1.1;
	    } else {
	        vx = vxMax*spd;    
	        vy = -(3 + 11/16) * 1.1;
	    }  
	} else if (kJump && cRight && !onGround) {   
	    xscale = 0.5;
	    yscale = 1.5;

	    for (var i = 0; i < 4; i++)
	        instance_create(bbox_right, random_range(bbox_top, bbox_bottom), oFxDust);
                               
	    // Wall jump is different when pushing off/towards the wall  
	    if (kRight) {
	        vx = -vxMax*spd;// * .75;
	        vy = -(3 + 11/16) * 1.1;
	    } else {
	        vx = -vxMax*spd;    
	        vy = -(3 + 11/16) * 1.1;
	    }  
	}
}
//No Wall Jump Power
else{
	sticking = false;
	cLeft = false;
	cRight = false;
	airSkid = 1/8;
}
/*
if(!onGround&&!flytimer && oPlayerStats.powerUp="fly" && sprint==7){
    fly = true;
    flytimer = true;
    alarm[6]=255;//turn fly off
}
*/
//if(fly){sprint=7};

// Jump 
if (kJump) { 
    if (onGround) {
		if(sign(vx)==facing*-1){
			vx+=(vx*.27);
		}
        // Fall thru platform
        if (kDown) && (place_meeting(x, y + 1, oParJumpThru) && !place_meeting(x, y + 1, oParSolid)) {
                ++y;
        // Normal jump
        } else {
            xscale = 0.5;
            yscale = 1.5;
            
            for (var i = 0; i < 4; i++)
                instance_create(random_range(bbox_left, bbox_right), bbox_bottom, oFxDust);
            
            //vy = -jumpHeight;
            //Get hspeed
            var vxAbs = abs(vx);
            vy = -(vxAbs/8 + 3 + 11/16);
        }
    } else if(oPlayerStats.powerUp == oPlayerStats.Powers.glide){
		//LEAF SLOWFALL
        slowedFall=true;
        alarm[4]=10;
        for (var i = 0; i < 4; i++){
            instance_create(random_range(bbox_left, bbox_right), bbox_bottom, oFxDust);
        }
    }
// Variable jumping
} else if (kJumpHeld) {
    if (vy < -2){
        vy -= 1/4;
    }
}

if(slowedFall){
    /*if(fly){
        vy=-1;
    }else */
	if(vy>1){
        vy=1;
    }
}

// Jump state check
if (!onGround) {
    action = JUMP;
    
    if (cLeft)
        facing = 1;
    if (cRight)
        facing = -1;
}


