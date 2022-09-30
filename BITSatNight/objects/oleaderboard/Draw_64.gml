
var bh = camera_get_view_height(view_current)
var bw = camera_get_view_width(view_current)
var scale = .4*bw/1300;  //if we want to scale up the font
var sc = scale/3*1.25

draw_set_halign(fa_center)
draw_set_color(c_dkgray)
draw_roundrect_ext(bw*0.01,bh*0.6 ,bw*0.19, bh*0.95 , 30 ,30 ,false)
draw_set_color(c_white)
draw_text_transformed(bw*0.1, bh*0.63 , "Leaderboard" , 0.3*scale, 0.3*scale ,0 )




for (var i = 0  ; i < array_length(global.leaderboard); i += 1)
	{
			if(i<7)
			{
				var item = global.leaderboard[i][0] + " "+string(global.leaderboard[i][1])+" Kills";
				if(i==ourPos)
				{
					draw_set_color(c_fuchsia);
				}else draw_set_color(c_white);
				draw_text_transformed(bw*0.105,bh*(0.68+i/40),string(i+1)+". "+item,sc*.65,sc*.65,0);
			}else //after 7 elements
			{
				var item = global.leaderboard[i][0] + " "+string(global.leaderboard[i][1])+" Kills";
				if(i==ourPos)
				{
				
					draw_set_color(c_white);
					draw_text_transformed(bw*0.105,bh*(0.68+(7)/40),".",sc*.65,sc*.65,0);
					draw_text_transformed(bw*0.105,bh*(0.68+(8)/40),".",sc*.65,sc*.65,0);
				
				
					draw_set_color(c_fuchsia);
					draw_text_transformed(bw*0.105,bh*(0.68+(9)/40),string(i+1)+". "+item,sc*.65,sc*.65,0);
				}
			
			}
	}