jumped = false;
landed = false;
moved = false;
facing = 1;
tArray = [0,0];
q=0;
r=0;

platformTarget = 0;
wallTarget     = 0;

corvx=0;
corvy=0;

// Velocity
vx  = 0;
vy  = 0;
mvx = 0;
cd  = false;

prevVx=vx;
//Slope
w=0;
e=0;
slope=0;
lastvx=0;
cBlockL = false

// Used for sub-pixel movement
cx = 0;
cy = 0;

onGround = OnGround();
cLeft    = place_meeting(x - 1, y, oBlock);
cRight   = place_meeting(x + 1, y, oBlock);

prevNextTo = false;

