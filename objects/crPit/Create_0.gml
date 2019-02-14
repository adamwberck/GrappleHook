//get height and width

height = 2;//default
width  = 4;//default
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

action_kill_object();
