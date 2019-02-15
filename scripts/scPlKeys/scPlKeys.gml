
// Input //////////////////////////////////////////////////////////////////////


kLeft         = keyboard_check(vk_left)           || gamepad_axis_value(0, gp_axislh) < -0.40 || keyboard_check(ord("A"));
kRight        = keyboard_check(vk_right)          || gamepad_axis_value(0, gp_axislh) >  0.40 || keyboard_check(ord("D"));
kUp           = keyboard_check(vk_up)             || gamepad_axis_value(0, gp_axislv) < -0.40;
kDown         = keyboard_check(vk_down)           || gamepad_axis_value(0, gp_axislv) >  0.75 || keyboard_check(ord("S"));
kDownPressed  = keyboard_check_pressed(vk_down)   || gamepad_axis_value(0, gp_axislv) >  0.75 || keyboard_check_pressed(ord("S")); 
kYtest        = keyboard_check_pressed(ord("Y"))  || false;

kJump         = keyboard_check_pressed(ord("C"))  || gamepad_button_check_pressed(0, gp_face1)  || keyboard_check_pressed(ord("W"));
kJumpRelease  = keyboard_check_released(ord("C")) || gamepad_button_check_released(0, gp_face1) || keyboard_check_released(ord("W"));
kJumpHeld     = keyboard_check(ord("C"))          || gamepad_button_check(0, gp_face1) || keyboard_check(ord("W"));

kAction        = keyboard_check(ord("X"))          || gamepad_button_check(0, gp_face2)			 || keyboard_check(vk_space);
kActionRelease = keyboard_check_released(ord("X")) || gamepad_button_check_released(0, gp_face2) || keyboard_check_released(vk_space);
kActionPress   = keyboard_check_pressed(ord("X"))  || gamepad_button_check_pressed(0, gp_face2)  || keyboard_check_pressed(vk_space);

kAction2       = keyboard_check(ord("Z"))          || gamepad_button_check(0, gp_face3)  || keyboard_check(vk_space);
kAction2Release= keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face3)  || keyboard_check_released(vk_space);
kAction2Press  = keyboard_check_pressed(ord("Z"))  || gamepad_button_check_pressed(0, gp_face3)  || keyboard_check_pressed(vk_space);

kHit           = keyboard_check_pressed(ord("Z"))  || gamepad_button_check_pressed(0, gp_face2);