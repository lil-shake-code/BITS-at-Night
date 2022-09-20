if(y > oPlayer.y){
	y -= 50;
}
if(!audio_is_playing(SoundJumpscare)){
	image_alpha -= 0.1
}
if(image_alpha < 0){
	instance_destroy(id);
}