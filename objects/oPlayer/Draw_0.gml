/// @description  Draw

///SKID
sprite_index=oPlayerStats.sprite;
image_speed=ANIMATION_SPD*vx;
if(!onGround){
	image_speed=0;
}

if(screenWrap){
	var leftBorder = camera_get_view_x(view_camera[0])+16;
	var rightBorder = leftBorder + camera_get_view_width(view_camera[0])-32;
	var topBorder = camera_get_view_y(view_camera[0])+16;
	var botBorder = topBorder + camera_get_view_height(view_camera[0])-32;	
	draw_rectangle_width(leftBorder,topBorder,rightBorder,botBorder,true,c_blue);
}

if(ds_exists(trail,ds_type_list)){
	//Draw Trail
	for(var i=0;i<ds_list_size(trail);i++){
		var spriteInfo = ds_list_find_value(trail,i);
		var sx = spriteInfo[2];
		var sy = spriteInfo[3];
		/*
		draw_set_alpha(i*06664);
		draw_rectangle_color(sx-8,sy-8,sx+8,sy+8,c_purple,c_purple,c_purple,c_purple,false);*/
		
		var alpha = (i*(.6/ds_list_size(trail)))+.1;
		
		draw_sprite_ext(spriteInfo[0],spriteInfo[1],spriteInfo[2],spriteInfo[3],spriteInfo[4]
			,1,0,c_white,alpha);
	}
	//Manage Trail
	var spriteInfo = recordSprite(self);
	ds_list_add(trail,spriteInfo);
	if(ds_list_size(trail)>20){
		ds_list_delete(trail,0);
	}
}


//Grapple
if(isGrappling){
	draw_set_color(c_gray);
	draw_line_width(ropeX,ropeY,oGrappleSpot.x,oGrappleSpot.y,3);
	draw_set_color(c_black);
	draw_line_width(x,y,oGrappleSpot.x,oGrappleSpot.y,3);
	draw_set_color(c_yellow);
	draw_circle(ropeX,ropeY,6,false);
	draw_set_color(c_white);
}


//Velocity Arrows
//draw_set_color(c_green);
//draw_arrow(x,y,x+(vx*10),y+(vy*10),7);
draw_set_color(c_white);


draw_sprite_ext(sprite_index,image_index,x,y,facing*-1,1,0,c_white,1);


/*
if (action == SKID && state != scHurt) {
    sprite_index = skid;
    rotate = 0;
    i=0;
///HURT
}else if(state == scHurt) {
    //sprite_index = sPlayerHurt;
    //image_speed = .1;
//SLIDE
}else if (action == SLIDE){
    if (image_index < 8 && sprite_index != sPlayerSlide){
        //sprite_index = sPlayerTransform;
        //image_speed = 0.5;
    
    }else {
        //sprite_index = sPlayerSlide;
        facing = 1;
        if (rotate<=360){
            if(slopeD==0){
                slopeD=sign(prevVx);
            }
            rotate = -7.2*(slideTime*sign(slopeD));
        }else rotate -= 360;
    }
//DUCK
}else if (action == DUCK){
    if (image_index < 8 && sprite_index != sPlayerSlide){
        //sprite_index = sPlayerTransform;
        //image_speed = 0.5;
    }else {
        var duckD = vx;
        //sprite_index = sPlayerSlide;
        facing = 1;
        if (rotate<=360){
            if(duckD==0){
                duckD=sign(prevVx);
            }
            rotate = -7.2*(slideTime*sign(duckD));
        }else rotate -= 360;
    }
//RUN
}else{
    //sprite_index = run;
    rotate = 0;
    i=0;
}
*/
/*
if(pickup!=0){
    if(pickup=="oShell"){//green
        if(facing==1) draw_sprite(sShell,0,bbox_right+2,bbox_bottom);
        else draw_sprite(sShell,0,bbox_left-14,bbox_bottom);
    }else if (pickup=="oShellR"){//red
        if(facing==1) draw_sprite(sShellR,0,bbox_right+2,bbox_bottom);
        else draw_sprite(sShellR,0,bbox_left-14,bbox_bottom);
    }
}
*/
///Max Speed

color = c_white;

//Color
/*
vxAbs = abs(vx)

if(vxAbs>=3.45){
    color = c_blue;
}

sprite_index=sRedMan;

draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, rotate, color, image_alpha);



/* */
///Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;

/* */
/*  */
