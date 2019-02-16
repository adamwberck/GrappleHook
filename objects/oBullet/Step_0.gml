/// @description Insert description here
// You can write your code in this editor
vx=lengthdir_x(SPD,dir);
vy=lengthdir_y(SPD,dir);
x+=vx;
y+=vy;
if(place_meeting(x,y,oParSolid)){
	if(instance_exists(oGrappleSpot)) then instance_destroy(oGrappleSpot);
	instance_create(x,y,oGrappleSpot);
	instance_destroy();
	with(oPlayer){
		isGrappling=true;
		ropeX = x;
		ropeY = y;
		ropeAngleVelocity = 0;
		ropeAngle  = point_direction(oGrappleSpot.x,oGrappleSpot.y,x,y);
		ropeLength = point_distance(oGrappleSpot.x,oGrappleSpot.y,x,y);
	}
}