if(place_meeting(x+q,y+r,oShell)){//for shell collision
    shell=instance_place(x+q,y+r,oShell)
    if(shell.state==scStatic ){//make sure shell is static
        if(action==SLIDE){
        //slide into shell or shell melee
            with(shell) scEnDamage(10,other.vx,other.vy);
        }else{
            if(kAction && facing==sign(shell.x-x)){//PICKUP
                scPickup(shell)
            }
            else{//KICK
                with(shell){ 
                    if(!place_meeting(x+q,y+r,oParSolid)){
                        x+=(q*2);
                        y+=r;
                    }
                    moved=true;
                }
                shell.vx=sign(vx)*2;
                if(vxNew>0){
                    shell.state=scRight;
                    shell.vx=max(vx,3.5);
                }else{
                    shell.state=scLeft;
                    shell.vx=min(vx,-3.5);
                }
            }
        }
    }
} else if(place_meeting(x+q,y+r,oParEnemy)){
    //for enemy collision
    en=instance_place(x+q,y+r,oParEnemy){
    scPlayerHitCheck();
    }
}
