var bh = camera_get_view_height(view_current)
var bw = camera_get_view_width(view_current)
var scale = .4*bw/1300;  //if we want to scale up the font
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

draw_set_color(c_white)
draw_set_font(fPressStart2P)
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed(bw*0.5 , bh*0.25 , "BITS at Night" , scale, scale ,0 )

draw_text_transformed(bw*0.5 , bh*0.5 , "Enter a username" , 0.5*scale, 0.5*scale ,0 );



//Enter button
draw_set_color(c_green)
draw_roundrect(bw*0.4 , bh*(0.65-0.04) , bw*0.6 ,bh*(0.65+0.04) ,false )
draw_set_color(c_white)
draw_text_transformed(bw*0.5 , bh*0.66 , "PLAY" , scale, scale ,0 )
if(mouse_check_button_pressed(mb_left)){
	
	var c1 = mx < bw*0.6
	var c2 = mx > bw*0.4
	var c3 = my > bh*(0.65-0.04)
	var c4 = my < bh*(0.65+0.04)
	if(c1 and c2 and c3 and c4){
		room_goto(rGame)
	}
	
	
}

//Textbox for name
draw_set_color(c_white)
draw_roundrect(bw*0.4 , bh*(0.4-0.04) , bw*0.6 ,bh*(0.4+0.04) ,false )
draw_set_color(c_black)
if( string_length(keyboard_string) > 10){
	keyboard_string =  string_delete(keyboard_string ,10 , 1 )
}

draw_text_transformed(bw*0.5 , bh*0.4 , keyboard_string , 0.5*scale, 0.5*scale ,0 )