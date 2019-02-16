/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;
//show_message(object_index);

///State switch
isSwinging = isGrappling ? isSwinging : false;
var lastx = vx; 
var lasty = vy;

scPlKeys();

if(isGrappling){
	if(!isSwinging){//Swinging is set in end step.
		ropeAngle = point_direction(oGrappleSpot.x,oGrappleSpot.y,x,y);
	}
	ropeLength += (kDown - kUp) * 2;
	ropeLength = max(0,ropeLength);
	
	ropeX = round(oGrappleSpot.x + lengthdir_x(ropeLength, ropeAngle));
	ropeY = round(oGrappleSpot.y + lengthdir_y(ropeLength, ropeAngle));
	
	var breakRope = collision_line(x,y,oGrappleSpot.x,oGrappleSpot.y,oParSolid,false,false);
	if(breakRope){
		isGrappling = false;
	}
}
if(isSwinging){
	var _ropeAngleAcceleration = -0.2 *dcos(ropeAngle);
	_ropeAngleAcceleration += (kRight-kLeft) * 0.04;
	
	ropeAngleVelocity += _ropeAngleAcceleration;
	ropeAngle += ropeAngleVelocity;
	ropeAngleVelocity *= 0.99;
	vx = ropeX - x;
	vy = ropeY - y;
	// Jump 
	if (kJump) {
		isGrappling=false;
		if(sign(vx)==facing*-1){
			vx+=(vx*.27);
		}
        var vxAbs = abs(vx);
        vy = -(vxAbs/8 + 3 + 11/16);
	} 
}else{
	script_execute(state);
}
if(abs(lastx-vx)>10 or abs(lasty-vy)>10){
	var d =9;
	//show_error("hello",true);
}



///Throw
#region
/*
var canspawn = true;
var drop=0;

if(kActionRelease && pickup != 0){
    var ythrw = -8;//scGetYThrow(facing);
    if(pickup=="oShell"){//greenshell
        if(facing==1){
            var drop = instance_create(bbox_right+12,y-ythrw,oShell);
        }else{
            var drop = instance_create(bbox_left-24,y-ythrw,oShell);
        }
    }else if(pickup=="oShellR"){//redshell
        if(facing==1){ 
            var drop = instance_create(bbox_right+12,y-ythrw,oShellR);

        }else{
            var drop = instance_create(bbox_left-24,y-ythrw,oShellR);
        }
    }
    //set drop values
    if(drop!=0)
    {
        var isASlope = scGetSlope();
        with(drop){
            if(other.facing=1){
                state=scRight; 
                vx=other.vx+2;
                moved=true;
                if(!isASlope && place_meeting(x,y,oParSolid)){
                    scEnDamage(10,vx,vy);
                }
            }else{
                state=scLeft;
                vx=other.vx-2;
                moved=true;
                if(isASlope && place_meeting(x,y,oParSolid)){
                    scEnDamage(10,vx,vy);
                }
            }
        }
    }
    pickup=0;
    
}
*/
#endregion