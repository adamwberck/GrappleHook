/// @description  Variables
event_inherited();

ledgeTurnAround=false;
// Inherit Entity
event_inherited();
dir = -1;
facing = 1;

hit = false;


moved=true;
// Movement ///////////////////////////////////////////////////////////////////
slope       = 0   ;
groundAccel = 2.5;
dSlopeAccel = 1/8 ;
vxAccelSlide= 1/8 ;
groundFric  = 1/15;
groundSkid  = 2.5 ;
airAccel    = 2.5;
airFric     = 0.00;
airSkid     = 1/8 ;
vxMax       = 1.5;
vxMaxSprint = 3.50;
vxMaxUp     = 2.50;
vxMaxSlide  = 3+15/16;
vyMax       = 16.0;
jumpHeight  = 9.00;
gravNorm    = 5/16;
walk        = false;
slide       = false;


gravSlide   = 2.5/16; 
clingTime   = 4.0;
// Misc ///////////////////////////////////////////////////////////////////////
sprint = 0;
sprintTimer = false;
state = scRight;
// Actions
IDLE      = 10;
RUN       = 11;
JUMP      = 12;
SKID      = 13;
SPRINT    = 14;
SLIDE     = 15;
// Initialize properties
action  = IDLE;
facing = image_xscale; // Change xscale in editor to adjust initial facing


//DRAWING
// For squash + stretch
xscale = 1;
yscale = 1;

//roating
rotate = 0
slideTime = 0
///////////////////////////////////////////////////////////////////////////////

// Legacy code, haha
sticking = false
prevNextTo = false
teststring = ""

