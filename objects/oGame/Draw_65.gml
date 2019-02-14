/// @description On Resize
// You can write your code in this editor
var WINDOW_W = window_get_width();
var WINDOW_H = window_get_height();

var portDif = 0;
var newPortH = 0;
var newPortW = 0;
for(var i=1;i<3;i++){
	var newH = HEIGHT*i;
	var newW = WIDTH*i;
	if(newW<=WINDOW_W && newH<=WINDOW_H){
		var newPortH = newH;
		var newPortW = newW;
	}
}
if(view_hport[0]!=newPortH || view_hport[0]!=newPortW){
	view_set_wport(0,newPortW);
	view_set_hport(0,newPortH);
}

surface_resize(application_surface, WIDTH, HEIGHT);