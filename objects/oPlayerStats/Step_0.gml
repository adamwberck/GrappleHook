/// @description Player Size
/*
var oldBbox = bbox_bottom;
if(hp>1){
    with(oPlayer){
        if(action==SLIDE || action==DUCK){
            if(OnGround()){
                mask_index=sPlayer;
            }
        }else{
            mask_index=sBigMask;
            run=other.bigSpr;
            skid = other.bigSkidSpr;
        }
    }
}else {//hp=1
    with(oPlayer){
        mask_index=sPlayer;
        run=sPlayerRun;
        skid = sPlayerSkid;
    }
}
*/
if(hp<3){
    powerUp=Powers.none;
	sprite = sWhiteRun;
}

///Power up Sprites
sprite = ds_map_find_value(powerSprites,powerUp);
