//set up camera
cam = view_camera[0];
follow = oPlayer; //returns id of first insatnce of oplayer
view_w_half = camera_get_view_width(cam)*0.5;
view_h_half = camera_get_view_height(cam)*0.5;
xTo = xstart;
yTo = ystart;
xOld = xTo;
xOld = xTo;


shake_length = 120;
shake_magnitude = 6;
shake_remain = 0;
buff = 32;

themeMusic = audio_play_sound(SoundTheme , 1 , true);

transitionToJumpscareMusic = audio_play_sound(TransitionToJumpscare , 2 , true);
audio_stop_sound(TransitionToJumpscare);



audio_falloff_set_model(audio_falloff_exponent_distance);
audio_listener_position(x,y,0)
audio_listener_orientation(x, y, -1, 0, 1, 0);

global.falloff_factor = 2
global.half_sound = 400