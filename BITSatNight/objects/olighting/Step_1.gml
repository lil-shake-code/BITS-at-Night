
surface_free(shadow)
shadow = surface_create(6000 , 3446);
surface_set_target(shadow);
draw_set_alpha(1)
draw_sprite(sLight , 0 , mouse_x , mouse_y);
