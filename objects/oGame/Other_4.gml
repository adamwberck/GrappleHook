rmPrev = rm;
rm     = room;

xcamo = 0;
ycamo = 0;

WIDTH = 448;
HEIGHT = 208;

global.isPlaying = false;
global.isRecording = false;
global.time = 0;


window_set_min_width(WIDTH);
window_set_min_height(HEIGHT);

view_camera[0] = camera_create_view(0,HEIGHT,WIDTH,HEIGHT,0,-1,0,0,0,0);
view_enabled = true;
view_visible[0] = true;
view_set_wport(0,WIDTH*2);
view_set_hport(0,(HEIGHT*2));
window_set_size(view_wport[0],view_hport[0]);

surface_resize(application_surface, WIDTH, HEIGHT);




follow = oPlayer;
view_w_half = camera_get_view_width(view_camera[0])*.5;
view_h_half = camera_get_view_height(view_camera[0])*.5;
xTo = xstart;
yTo = ystart;
camX = 0;
camY = 0;