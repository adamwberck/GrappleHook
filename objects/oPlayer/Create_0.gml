/// @description  Variables


screenWrap = false;

trail = ds_list_create();

ANIMATION_SPD = .5;


pickup=0;
drop=0;
hurt = false;
global.freeze =false;
global.paused =false;

//Farore
faroreCharge = false;
faroreCount = 0;
portal = noone;
// Inherit Entity
event_inherited();
i=0;
facing = 1;
o = false;
// Movement ///////////////////////////////////////////////////////////////////
#region
slope       = 0   ;
groundAccel = 0.0546875;
dSlopeAccel = 1/8 ;
vxAccelSlide= 1/8 ;
groundFric  = 0.0546875;
groundSkid  = 1/8 ;
airAccel    = 0.0546875;
airFric     = 0.00;
airSkid     = 1/8;
vxMax       = 2.5;
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
#endregion
// Misc ///////////////////////////////////////////////////////////////////////
sprint = 0;
sprintTimer = false;
fly=false;
flytimer=false;
state = scMovement;
// Actions
IDLE      = 10;
RUN       = 11;
JUMP      = 12;
SKID      = 13;
SPRINT    = 14;
SLIDE     = 15;
HURT      = 16;
DUCK      = 17;
// Initialize properties
action  = IDLE;
facing = image_xscale; // Change xscale in editor to adjust initial facing

//Powerups
walljump = false

//DRAWING
// For squash + stretch
xscale = 1;
yscale = 1;

//roating
rotate = 0;
slideTime = 0;
slopeD=0;
slopeDprev=0;
///////////////////////////////////////////////////////////////////////////////

//falling
slowedFall=false;
spinAttack = false;

// Legacy code, haha
sticking = false
prevNextTo = false


//Spin
dam=false;

jumpdelay = false;

