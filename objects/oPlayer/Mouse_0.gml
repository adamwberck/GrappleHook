/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oGrappleSpot)){
	instance_destroy(oGrappleSpot);
}
instance_create(mouse_x,mouse_y,oGrappleSpot);