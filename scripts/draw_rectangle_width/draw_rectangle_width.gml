/// @description draw_rectangle_width(left,top,right,bottom,width)
/// @function  draw_rectangle_width
/// @param  left
/// @param  top
/// @param  right
/// @param  bottom
/// @param  width
/// @param  nColor
var left   = argument0
var top    = argument1
var right  = argument2
var bottom = argument3
var width  = argument4
var nColor = argument5
var oColor = draw_get_color();

draw_set_color(nColor);
draw_line_width(left,top,right,top,width);//TOP
draw_line_width(left,bottom,right,bottom,width);//BOTTOM
draw_line_width(left,top,left,bottom,width);//LEFT
draw_line_width(right,top,right,bottom,width);//RIGHT
draw_set_color(oColor);