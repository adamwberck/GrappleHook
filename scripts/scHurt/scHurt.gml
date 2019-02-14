//flash sprite
if(hurt)
{
    action = HURT;
    //image_speed = 4;
}
else
{
    state = scMovement;
}
scMovement();
