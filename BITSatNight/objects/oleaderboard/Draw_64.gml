
var bh = camera_get_view_height(view_current)
var bw = camera_get_view_width(view_current)
var scale = .4*bw/1300;  //if we want to scale up the font

draw_set_halign(fa_center)
draw_set_color(c_dkgray)
draw_roundrect_ext(bw*0.01,bh*0.7 ,bw*0.19, bh*0.95 , 30 ,30 ,false)
draw_set_color(c_white)
draw_text_transformed(bw*0.1, bh*0.73 , "Leaderboard" , 0.3*scale, 0.3*scale ,0 )




for(var i = 0 ; i <array_length(leaderboard) ; i++){
	

}