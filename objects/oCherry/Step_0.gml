// Apply the correct form of acceleration and friction
var tempAccel, tempFric, tempSkid, tempVxMax;

tempAccel = airAccel;
tempFric  = airFric;
tempSkid  = groundSkid;

tempVxMax = vxMax;



// Handle gravity
// Fall normally
vy = Approach(vy, vyMax, gravNorm-random_range(0,1));