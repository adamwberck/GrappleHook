/// @description defaults

height = round(random_range(1,3));//default
width  = round(random_range(12,20));//default
ledge  = 4;//default
floating = false;

///Generation
y=0;
rmheight = room_height/16;

var f=0;

if(floating) then var f=ledge;

for(var w=0;w<width+f;w++){
    for(var h=0;h<rmheight;h++){
        var tempblock = instance_position(x+w*16,h*16,oParSolid);
        if(instance_position(x+w*16,h*16,oParSolid)){
            var wcheck = x+w*16;
            var hcheck = h*16;
            with(tempblock){
                instance_destroy()
            }
        }
    }
}

//create ledge
for(var w=0;w<ledge;w++){
    var destroybelow = false;
    for(var h=0;h<rmheight;h++){
    if(h>=rmheight-height){
            instance_create(w*16+x+width*16,h*16,oBlock16)
            var wcheck = x+w*16+width*16;
            var hcheck = h*16;
            if(floating) then h=rmheight;
        }
    }
}

//create rails
var start = true;//
var fin = false;//
for(var w=0;w<width;w++){
    var destroybelow = false;
    for(var h=0;h<rmheight;h++){
    if(h>=rmheight-height-3){
            if(w+1>=width) then fin = true;
            if(start){
                instance_create(w*16+x,h*16,oRailLeft)
                var plat = instance_create(w*16+x+32,h*16+8,oRailMoverH)                                
                with(plat) {vx=2}
                start = false;
            }
            else if(!fin){
                instance_create(w*16+x,h*16,oRail2)
                var wcheck = x+w*16+width*16;
                var hcheck = h*16;
            } else{
                instance_create(w*16+x,h*16,oRailRight);
            }
            h=rmheight;
        }
    }
}

action_kill_object();
