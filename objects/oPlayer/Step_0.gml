/// @description Pause/FreezeCheck
if(scFreezeCheck() == true) exit;
if(scPauseCheck()  == true) exit;
//show_message(object_index);

///State switch
script_execute(state);

///Throw

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


