/// @description death affect
var corpse = instance_create(x,y,oCorpse);
with(corpse){
    vx=other.corvx;
    vy=other.corvy-5;
    sprite_index = other.sprite_index;
    image_xscale = other.image_xscale;
    image_angle  = 180+(other.image_angle);
}
visible=false;

