/// @description  Debug

// Input variables for debug room traversal
var kRestart, kExit, kPrev, kNext;

kRestart = keyboard_check_pressed(ord("R"))    || gamepad_button_check_pressed(0, gp_select);
kExit    = keyboard_check_pressed(vk_escape);
kPrev    = keyboard_check_pressed(vk_pagedown) || gamepad_button_check_pressed(0, gp_shoulderlb);
kNext    = keyboard_check_pressed(vk_pageup)      || gamepad_button_check_pressed(0, gp_shoulderrb);
kLedge   = keyboard_check_pressed(ord("L"));
kLedgeM  = keyboard_check_pressed(ord("K"));
kPCheck  = keyboard_check_pressed(ord("P"));

if(kPCheck){
	oldSchool = !oldSchool;
}


if(kLedge)
    oEnemyG.ledgecheck++;

if(kLedgeM)
    oEnemyG.ledgecheck--;
    
    
if (kRestart)
    room_restart();
if (kExit)
    game_end();
    
// Iterate through rooms backward
if (kPrev) {
    global.room_debug=room;
    if (room == room_first)
        room_goto(room_last);
    else
        room_goto_previous();
}

// Iterate through rooms forwards
if (kNext) {
    if (room == room_last)
        room_goto(room_first);
    else
        room_goto_next();
}

/// Debug for path based platform
if (mouse_check_button_pressed(mb_left)) {
    if (instance_exists(oPathMover)) {
        with (oPathMover) {
            plen = path_get_length(path);
            path_add_point(path, mouse_x - xstart, mouse_y - ystart, pSpd);
            plennew = path_get_length(path);
            
            pPos = pPos * (plen / plennew);
        }
    }
} 

if (mouse_check_button(mb_left)) {
    if (instance_exists(oPathMover)) {
        with (oPathMover) {
            plen = path_get_length(path);
            path_delete_point(path, path_get_number(path) - 1);
            plennew = path_get_length(path);
            pPos = pPos * (plen / plennew);
                        
            plen = path_get_length(path);
            path_add_point(path, mouse_x - xstart, mouse_y - ystart, pSpd);
            plennew = path_get_length(path);
            pPos = pPos * (plen / plennew);
            
            pMov = false;
        }
    }
} else {
    with (oPathMover)
        pMov = true;
}

with (oPathMover) {
    pSpd += (mouse_wheel_up() - mouse_wheel_down()) * 2;
    pSpd  = clamp(pSpd, 1, 16);
}

/*
clickInit = mouse_check_button_pressed(mb_left)
clicked   = mouse_check_button(mb_left);

// INITIAL POINT
if (clickInit) {
    var dirToMouse = point_direction(oPlayer.x, oPlayer.y - 8, mouse_x, mouse_y);
    
    // Distance to contact point
    var i = 0;
    
    do {
        i++    
    } until (collision_line(oPlayer.x, oPlayer.y - 8, oPlayer.x + lengthdir_x(i, dirToMouse), (oPlayer.y - 8) + lengthdir_y(i, dirToMouse), oParSolid, false, true)); 
    
    lx = oPlayer.x + lengthdir_x(i, dirToMouse);
    ly = (oPlayer.y - 8) + lengthdir_y(i, dirToMouse);
// SECONDARY POINT(S)
}// else if (clicked) {
    var dirToMouse = point_direction(oPlayer.x, oPlayer.y - 8, mouse_x, mouse_y);
    
    // Distance to contact point
    var i = 0;
    
    do {
        i++    
    } until (collision_line(oPlayer.x, oPlayer.y - 8, oPlayer.x + lengthdir_x(i, dirToMouse), (oPlayer.y - 8) + lengthdir_y(i, dirToMouse), oParSolid, false, true)); 
    
    lx = oPlayer.x + lengthdir_x(i, dirToMouse);
    ly = (oPlayer.y - 8) + lengthdir_y(i, dirToMouse);
//}
*/

/* */
/*  */



