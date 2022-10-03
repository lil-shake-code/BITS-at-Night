image_index = 0;
image_speed=0
alarm[0] =1; //alarm to switch the bullet sprite
var falloff_fac = global.falloff_factor
var t2 = global.half_sound
var t3 = 60000
var sd = SoundGunshot
audio_play_sound_at(sd, x, y, 0,t2,t3, falloff_fac, false, 1);
whoFiredMe = -1;