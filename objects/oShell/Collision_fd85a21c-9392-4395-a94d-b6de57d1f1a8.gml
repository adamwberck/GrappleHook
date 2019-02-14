/// @description Kill
if(dangerous){
    with(other){
        scEnDamage(10,other.vx,other.vy);
    }
}

if(other.dangerous){
    with(self){
        scEnDamage(10,other.vx*-1,other.vy);
    }
}

