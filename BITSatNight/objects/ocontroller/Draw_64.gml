var bh = camera_get_view_height(view_current)
var bw = camera_get_view_width(view_current)
var scale = .4*bw/1300;  //if we want to scale up the font

draw_set_halign(fa_left);
draw_text_transformed(bw*0.01 , bh*0.05 , "FPS : " + string(fps) , 0.5*scale, 0.5*scale ,0 )