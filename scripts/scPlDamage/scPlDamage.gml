//scPlDamage(damage)
var damage = argument0;
if(!hurt && oPlayerStats.hp>0){
    action=RUN;
    rotate=0;
    oPlayerStats.hp-= damage;

    state = scHurt;
    alarm[2] = 80;
    hurt = true;

    if(!global.freeze){
        global.freeze=true;
        
        if(oPlayerStats.hp<=0){
			var cam = view_camera[0];
			var viewBot = camera_get_view_y(cam)+camera_get_view_height(cam)
            oGame.alarm[1] = abs(viewBot-y+30);
            instance_create(x,y,oPlayerCorpse);
            visible=false;
        }else{
            oGame.alarm[1] = 30;
        }
    }
    
}

///Player Size
scPlayerSize();
