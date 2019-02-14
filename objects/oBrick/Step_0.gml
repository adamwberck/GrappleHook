/// @description Check for hit

if(y<orginY-3){
    hit=true;
}

if(item="shroom"||item="leaf"){
    breaks = false;
}

if(y>=orginY){
    hit=false;
    canbehit=true;
}

if((hit && !hardened && canbehit)||sidehit){
    canbehit=false;
    if(item=="coin"&&coins>0){
        coins--;
        instance_create(x,y-24,oCoinEffect);
    }else if(!PlaceMeetingSolid(x,y-24,0)){
        if (item=="shroom"){
            hardened=true;
            instance_create(x,y-24,oMushroom);
        }else if (item=="leaf"){
            if(oPlayerStats.hp<2){
                instance_create(x,y-24,oMushroom);
            }else{
                instance_create(x,y-24,oLeaf);   
            }
            hardened=true;
        }else{
            hardened=true;
        }
    }else{
        hardened=true;
    }
}

if(coins<1){
    hardened=true;
}

if((hit||sidehit) && hardened && breaks && (oPlayerStats.hp>1||sidehit)){
    instance_destroy();
    for(var i=0;i<4;i++){
        var piece = instance_create(x,y,oFXBreak);
        var neg = 1;
        var neg2 = 1;
        if(i%2==0) neg =-1;
        if(i<2) neg2 = -1;
        piece.vx=4*neg;
        piece.vy=-4+neg2;
        piece.dir=neg2;
    }
}

if(hardened && !breaks) sprite_index= sBrickHard;

if(hardened && y>=orginY && !breaks){
    var block = instance_create(x,y,oBlock16);
    block.sprite_index= sBrickHard;
    instance_destroy();
}

sidehit=false;

