gpu_set_blendmode(bm_add) //try bm_zero for diff effect
draw_set_alpha(1)
draw_surface(shadow , 0, 0)
gpu_set_blendmode(bm_src_alpha)
draw_set_alpha(0.05)
//layer_sprite_alpha()