if(instance_number(oGame)>1){
	instance_destroy();
}

rm     = -1;
rmPrev = -1;


// Mouse
clickInit = mouse_check_button_pressed(mb_left)
clicked   = mouse_check_button(mb_left);


global.gameCheck = instance_number(oGame);

oldSchool = false;
