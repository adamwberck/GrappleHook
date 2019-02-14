/// @description  Variables
event_inherited();
dangerous=false;
ledgeTurnAround=false;
hp=1;
alarm[0]=60*13;
// Inherit Entity
dir = -1;
facing = 1;

hit = false;
// Movement ///////////////////////////////////////////////////////////////////
slope       = 0   ;
groundAccel = 3.5;
dSlopeAccel = 1/8 ;
vxAccelSlide= 1/8 ;
groundFric  = 3.5;
groundSkid  = 3.5 ;
airAccel    = 3.5;
airFric     = 0.00;
airSkid     = 1/8 ;
vxMax       = 3.5;
vxMaxSprint = 3.50;
vxMaxUp     = 2.50;
vxMaxSlide  = 3+15/16;
vyMax       = 16.0;
jumpHeight  = 9.00;
gravNorm    = 5/16;
walk        = false;
slide       = false;

// Misc ///////////////////////////////////////////////////////////////////////
sprint = 0;
sprintTimer = false;
state = scStatic;
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


event_inherited();

