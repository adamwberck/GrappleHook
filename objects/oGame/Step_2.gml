/// @description  Check Player

if (instance_number(oPlayer) > 1) {
    with(instance_nearest(0,0,oPlayer))
        instance_destroy();
    }

if (instance_number(oPlayer) < 1) {
    instance_create(304,224,oPlayer)
}

/// Camera Follow
// You can write your code in this editor
#region
var follow = oPlayer;
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}
if(oPlayerStats.powerUp != oPlayerStats.Powers.screenWrap || !oPlayer.screenWrap){
	var camL = camera_get_view_x(view_camera[0]);
	var camR = camL+WIDTH;
	var pushDis = 176;
	var camSpd = max(4,oPlayer.vx);
	if(xTo+pushDis>camR){
		camX =Approach(camX,xTo+pushDis-WIDTH,camSpd);
	}
	if(xTo-pushDis<camL){
		camX =Approach(camX,xTo-pushDis,camSpd);
	}
	pushDis = 80
	var camT = camera_get_view_y(view_camera[0]);
	var camB = camT+HEIGHT;
	if(yTo+pushDis>camB){
		camY =Approach(camY,yTo+pushDis-HEIGHT,camSpd);
	}
	if(yTo-pushDis<camT){
		camY =Approach(camY,yTo-pushDis,camSpd);
	}

	camX = clamp(camX,0,room_width-WIDTH)
	camY = clamp(camY,0,room_height-HEIGHT)


	camera_set_view_pos(view_camera[0],camX,camY); 
}
#endregion